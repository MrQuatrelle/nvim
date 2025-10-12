return {
    "danymat/neogen",

    config = function()
        local neogen = require("neogen")
        neogen.setup({ snippet_engine = "luasnip" })

        local opts = { noremap = true, silent = true }
        vim.keymap.set("n", "<leader>df", function()
            neogen.generate({ type = "func" })
        end, opts)
        vim.keymap.set("n", "<leader>dc", function()
            neogen.generate({ type = "class" })
        end, opts)
        vim.keymap.set("n", "<leader>dt", function()
            neogen.generate({ type = "type" })
        end, opts)
        vim.keymap.set("n", "<leader>dh", function()
            neogen.generate({ type = "file" })
        end, opts)
    end
}
