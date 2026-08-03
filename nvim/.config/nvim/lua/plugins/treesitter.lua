return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    branch = "main",
    config = function()
      require('nvim-treesitter').setup({
        install_dir = vim.fn.stdpath('data') .. '/site'
      })

      -- Parsers to install. These are *parser* names.
      local languages = {
        "bash",
        "c",
        "cpp",
        "css",
        "go",
        "dockerfile",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "python",
        "rust",
        "typescript",
        "tsx",
        "vim",
        "elixir",
        "eex",
        "heex",
        "surface",
        "nix",
      }

      require('nvim-treesitter').install(languages)

      -- Filetypes to start highlighting for. These are *filetype* names, which
      -- do not always match the parser name (bash -> sh, eex -> eelixir, ...).
      local filetypes = {
        "sh",
        "bash",
        "c",
        "cpp",
        "css",
        "go",
        "gomod",
        "dockerfile",
        "html",
        "javascript",
        "javascriptreact",
        "json",
        "lua",
        "markdown",
        "python",
        "rust",
        "typescript",
        "typescriptreact",
        "vim",
        "elixir",
        "eelixir",
        "heex",
        "surface",
        "nix",
      }

      vim.api.nvim_create_autocmd('FileType', {
        pattern = filetypes,
        callback = function()
          -- install() is async, so the parser may not exist yet on a fresh setup.
          pcall(vim.treesitter.start)
        end,
      })
    end,
  }
}
