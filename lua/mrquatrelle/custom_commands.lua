local api = vim.api

-- one less problem in this miserable world
api.nvim_create_user_command("Q", "q", {})
api.nvim_create_user_command("W", "w", {})
api.nvim_create_user_command("Wq", "wq", {})
api.nvim_create_user_command("WQ", "wq", {})
api.nvim_create_user_command("Qa", "qa", {})
api.nvim_create_user_command("QA", "qa", {})

api.nvim_create_user_command("CreateTmuxSession", function()
    local cwd = vim.loop.cwd()

    local session = cwd
        :gsub("/", "_")
        :gsub("[^%w_]", "_")

    local has_session = os.execute("tmux has-session -t " .. session .. " 2>/dev/null")

    if has_session ~= 0 then
        os.execute("tmux new-session -ds " .. session .. " -c " .. cwd)
        print("created new tmux session: " .. session)
    end
end, {})

api.nvim_create_user_command(
    "OpenTmuxSession",
    function()
        local session = vim.loop
            .cwd()
            :gsub("/", "_")
            :gsub("[^%w_]", "_")

        local inside_tmux = os.getenv("TMUX") ~= nil

        if inside_tmux then
            vim.cmd.terminal({ "tmux", "switch-client", "-t", session })
        else
            vim.cmd.terminal({ "tmux", "attach-session", "-t", session })
        end
    end,
    {})

-- local last_non_term_buf = nil

vim.api.nvim_create_user_command(
    "ToggleTerminal",
    function()
        -- local bufnr = vim.api.nvim_get_current_buf()

        -- if vim.bo[bufnr].buftype == "terminal" and
        --     vim.api.nvim_buf_is_valid(last_non_term_buf) then
        --     vim.api.nvim_set_current_buf(last_non_term_buf)
        --     return
        -- end

        -- last_non_term_buf = bufnr

        vim.cmd("CreateTmuxSession")
        vim.cmd("OpenTmuxSession")
    end,
    {}
)
