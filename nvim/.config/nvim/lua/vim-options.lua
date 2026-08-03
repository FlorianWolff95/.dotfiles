vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number relativenumber")
vim.g.mapleader = " "

vim.opt.swapfile = false
vim.opt.undofile = true

vim.wo.number = true
vim.opt.scrolloff = 8

-- Inlay hints are enabled per-buffer on LspAttach, see lua/plugins/lsp-config.lua
vim.diagnostic.config({ virtual_text = true })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostic float" })

-- Neovim already maps .exs/.eex/.leex/.heex/.sface. Only .ex needs an override,
-- since Neovim disambiguates it between Elixir, Euphoria and TeX.
vim.filetype.add({
  extension = {
    ex = "elixir",
  }
})
