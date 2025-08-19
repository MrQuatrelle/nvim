local keymap = vim.keymap

keymap.set("n", "<leader>c", ":RustLsp renderDiagnostic current<CR>")

local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
    "n",
    "<leader>a",
    function()
        -- supports rust-analyzer's grouping
        vim.cmd.RustLsp('codeAction')
    end,
    { silent = true, buffer = bufnr }
)

vim.keymap.set(
    "n",
    "<leader>v",
    function()
        vim.cmd.RustLsp({ 'hover', 'actions' })
    end,
    { silent = true, buffer = bufnr }
)
