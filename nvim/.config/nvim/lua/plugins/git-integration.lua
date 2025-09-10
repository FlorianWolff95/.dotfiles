return {
  { "tpope/vim-fugitive" },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
          end

          map("n", "<leader>gh", gs.preview_hunk, "Preview hunk")
          map("n", "<leader>gt", gs.toggle_current_line_blame, "Toggle line blame")
        end,
      })
    end,
  },
}
