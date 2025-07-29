return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    branch = "main",
    config = function()
      require('nvim-treesitter').setup()
      local ensure_installed = {
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

      require('nvim-treesitter').install(ensure_installed)
    end
  }
}
