vim.g.mapleader = " "

-- Explore Files
vim.keymap.set("n", "<leader>ef", vim.cmd.Ex)

-- Cursor movements
vim.keymap.set("n", "gl", "$")
vim.keymap.set("v", "gl", "$")

vim.keymap.set("n", "gh", "0")
vim.keymap.set("v", "gh", "0")

vim.keymap.set("n", "gt", "gg")
vim.keymap.set("n", "gb", "G")

-- Clipboard
-- Sync OS and vim
vim.o.clipboard = vim.fn.has('unnamedplus') ~= 0 and 'unnamedplus' or 'unnamed'
