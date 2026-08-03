return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup({})
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "pyright", "nil_ls", "gopls", "elixirls" },
        -- rustaceanvim manages rust_analyzer itself; enabling it here would
        -- start a second, conflicting client.
        automatic_enable = { exclude = { "rust_analyzer" } },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      -- Applied on top of every server config shipped by nvim-lspconfig.
      -- mason-lspconfig's automatic_enable does the vim.lsp.enable() calls.
      vim.lsp.config("*", {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      vim.lsp.config("pyright", {
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
          },
        },
      })

      vim.lsp.config("gopls", {
        settings = {
          gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
              unusedParams = true,
            },
          },
        },
      })

      vim.lsp.config("elixirls", {
        settings = {
          elixirLS = {
            dialyzerEnabled = false,
            fetchDeps = false,
            enableTestLenses = false,
            suggestSpecs = false,
          },
        },
      })

      -- Neovim 0.11 already maps K, grn, gra, grr and gri by default.
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
        callback = function(args)
          local opts = { buffer = args.buf }
          vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
          -- <leader>gf is owned by conform.nvim (lua/plugins/formatting.lua),
          -- which falls back to LSP formatting when no formatter is configured.

          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client:supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
            vim.keymap.set("n", "<leader>ih", function()
              vim.lsp.inlay_hint.enable(
                not vim.lsp.inlay_hint.is_enabled({ bufnr = args.buf }),
                { bufnr = args.buf }
              )
            end, opts)
          end
        end,
      })
    end,
  },
}
