return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    branch = "main",
    config = function()
      -- Basic setup (optional, uses defaults if not called)
      require('nvim-treesitter').setup({
        install_dir = vim.fn.stdpath('data') .. '/site'
      })

      -- Install parsers for your languages
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
        "vim",
      }

      -- Install the parsers
      require('nvim-treesitter').install(languages)

      -- Enable highlighting only for languages in our local languages list
      vim.api.nvim_create_autocmd('FileType', {
        pattern = languages,
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
  }
}
