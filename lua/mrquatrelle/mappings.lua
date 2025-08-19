local keymap = vim.keymap

vim.g.mapleader = " "

keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Scroll
keymap.set({ "n", "v" }, "<C-j>", "10jzz")
keymap.set({ "n", "v" }, "<C-k>", "10kzz")

keymap.set({"n"}, "<M-n>", ":Ex<CR>")

keymap.set({"i"}, "<C-BS>", "<C-w>")
