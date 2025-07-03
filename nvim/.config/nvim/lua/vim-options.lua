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

vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
vim.diagnostic.config({ virtual_text = true })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
