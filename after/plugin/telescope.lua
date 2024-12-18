local keymap = vim.keymap

local telescope = require("telescope")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")

telescope.setup({
    pickers = {
        find_files = {
            find_command = { "fd", "--type", "f", "--hidden", "--strip-cwd-prefix", "--exclude", ".git" },
        },
        diagnostics = {
            sort_by = "severity"
        }
    },
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
            },
        }
    }
})

keymap.set("n", "<M-e>", builtin.find_files, {})
keymap.set("n", "<M-g>", builtin.live_grep)
keymap.set("n", "<M-m>", builtin.man_pages)
keymap.set("n", "<leader>dt", builtin.diagnostics)

keymap.set("n", "<M-t>", "<cmd>TodoTelescope<CR>")

keymap.set("n", "<M-f>", function()
    if vim.fn.expand("%") == "" then
        telescope.extensions.file_browser.file_browser()
    else
        vim.cmd("Telescope file_browser path=%:p:h select_buffer=true<CR>")
    end
end)
