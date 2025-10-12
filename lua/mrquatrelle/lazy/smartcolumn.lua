return {
    "m4xshen/smartcolumn.nvim",

    config = function()
        require("smartcolumn").setup({
            colorcolumn = "100",
            disabled_filetypes = {},
            custom_colorcolumn = {
                c = "80",
                h = "80",
            },
            scope = "file",
        })
    end
}
