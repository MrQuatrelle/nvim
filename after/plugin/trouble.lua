local keymap = vim.keymap;

local trouble = require("trouble")
trouble.setup({
    auto_close = true,

    modes = {
        diagnostics = {
            focus = false,
            groups = {
                { "filename", format = "{file_icon} {basename:Title} {count}" },
            },
            filter = {
                function(item)
                    return item.filename:find(vim.fn.getcwd(), 1, true)
                end,
            },
        },

        diagnostics_filtered = {
            mode = "diagnostics",
            filter = {
                severity = vim.diagnostic.severity.ERROR,
            },
        },

        diagnostics_buffer = {
            mode = "diagnostics",
            filter = {
                buf = 0,
            },
            groups = {},
        },

        diagnostics_filtered_buffer = {
            mode = "diagnostics_filtered",
            filter = {
                buf = 0,
            },
            groups = {},
        },
    }
})

-- there must be a better way of doing this...

local function get_errors(bufnr)
    local diagnostics

    if bufnr == nil then
        diagnostics = vim.diagnostic.get()
    else
        diagnostics = vim.diagnostic.get(bufnr)
    end

    if #diagnostics == 0 then
        return false
    end

    for _, diagnostic in ipairs(diagnostics) do
        if diagnostic.severity == vim.diagnostic.severity.ERROR then
            return vim.diagnostic.severity.ERROR
        end
    end

    return true
end

-- If there is an error in the current buffer, only show them.
--
-- If there isn't any error in the current buffer but there are one or more
-- anywhere else in the project, show them.
--
-- If there aren't any errors anywhere, same logic applies but for the
-- remaining hints.
local function toggle_diagnostics_smart()
    local mode = "diagnostics"
    local errors = get_errors()
    local errors_buffer = get_errors(0)

    if errors == vim.diagnostic.severity.ERROR then
        mode = mode .. "_filtered"

        if errors_buffer == vim.diagnostic.severity.ERROR then
            mode = mode .. "_buffer"
        end
    elseif errors_buffer then
        mode = mode .. "_buffer"
    end

    if trouble.is_open(mode) then
        trouble.close(mode)
        return
    end

    trouble.close()
    trouble.open(mode)
end

local function toggle_diagnostics_dumb()
    if trouble.is_open("diagnostics") then
        trouble.close("diagnostics")
        return
    end

    trouble.close()
    trouble.open("diagnostics")
end

keymap.set("n", "<leader>dq", toggle_diagnostics_smart)
keymap.set("n", "<leader>da", toggle_diagnostics_dumb)

keymap.set("n", "<leader>dn", function()
    trouble.next()
    trouble.jump_only()
end)

keymap.set("n", "<leader>dp", function()
    trouble.prev()
    trouble.jump_only()
end)
