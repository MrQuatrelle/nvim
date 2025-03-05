local keymap = vim.keymap

keymap.set("v", "K", ":m '>+1<CR>gv=gv")
keymap.set("v", "L", ":m '<-2<CR>gv=gv")

-- Scroll
keymap.set({ "n", "v" }, "<C-k>", "10jzz")
keymap.set({ "n", "v" }, "<C-l>", "10kzz")

keymap.set({"n"}, "<M-n>", ":Ex<CR>")

keymap.set({"i"}, "<C-BS>", "<C-w>")
