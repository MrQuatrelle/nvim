local keymap = vim.keymap
local builtin = require("telescope.builtin")

keymap.set("n", "<M-e>", builtin.find_files, {})
keymap.set("n", "<leader>ps", function()
	builtin.grep_string({
		search = vim.fn.input(" Search > ")
	})
end)
