if vim.g.neovide ~= nil then
    vim.g.neovide_normal_opacity = 0.8
    vim.opt.background = "dark"
    vim.api.nvim_set_hl(0, "MsgArea", { bg = "NONE" })
end

require("tokyonight").setup({
    style = "night",
    -- transparent = tostring(vim.g.neovide == nil),
    transparent = "true",

    sidebars = { "packer" },
    on_colors = function(colors)
        colors.red = "#EE4B2B"
        colors.green = "#32CD30"
        colors.blue = "#5294E3"
    end,
    on_highlights = function(hl, c)
        hl.Boolean = { fg = c.red }
        hl.Operator = { fg = c.orange }
        hl.Keyword = { fg = c.orange }
        hl.LineNr = { fg = c.blue }
        hl.Type = { fg = c.orange }
        hl.Conditional = { fg = c.orange }
        hl.Repeat = { fg = c.orange }
        hl.Label = { fg = c.orange }
        hl.ColorColumn = { bg = c.dark5 }
    end,
})
vim.cmd("colorscheme tokyonight")
