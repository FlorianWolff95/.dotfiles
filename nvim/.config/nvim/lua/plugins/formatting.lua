return {
  {
    -- mason.nvim has no ensure_installed of its own, so non-LSP tools
    -- (formatters, linters) are bootstrapped here.
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    dependencies = { "mason-org/mason.nvim" },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "stylua",
          "isort",
          "ruff",
          "goimports",
          "golines",
          "nixfmt",
        },
        run_on_start = true,
      })
    end,
  },
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "isort", "ruff_format" },
          go = { "goimports", "golines" },
          nix = { "nixfmt" },
          elixir = { "mix" },
          eelixir = { "mix" },
          heex = { "mix" },
        },
        -- Fall back to LSP formatting for filetypes without a formatter above
        -- (gopls, lua_ls, nil_ls, ... all provide one).
        default_format_opts = {
          lsp_format = "fallback",
        },
      })

      vim.keymap.set({ "n", "v" }, "<leader>gf", function()
        require("conform").format({ async = true })
      end, { desc = "Format buffer" })
    end,
  },
}
