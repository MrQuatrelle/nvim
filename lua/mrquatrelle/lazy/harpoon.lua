return {
    "theprimeagen/harpoon",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        local keymap = vim.keymap

        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        keymap.set("n", "<M-a>", mark.add_file)
        keymap.set("n", "<M-h>", ui.toggle_quick_menu)

        keymap.set("n", "<M-1>", function() ui.nav_file(1) end)
        keymap.set("n", "<M-2>", function() ui.nav_file(2) end)
        keymap.set("n", "<M-3>", function() ui.nav_file(3) end)
        keymap.set("n", "<M-4>", function() ui.nav_file(4) end)
        keymap.set("n", "<M-5>", function() ui.nav_file(5) end)
        keymap.set("n", "<M-6>", function() ui.nav_file(6) end)
        keymap.set("n", "<M-7>", function() ui.nav_file(7) end)
        keymap.set("n", "<M-8>", function() ui.nav_file(8) end)
        keymap.set("n", "<M-9>", function() ui.nav_file(9) end)
        keymap.set("n", "<M-0>", function() ui.nav_file(10) end)
    end
}
