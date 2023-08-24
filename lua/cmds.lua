-------------------------------------------------------------------------------
-- Open Settings
-------------------------------------------------------------------------------

vim.api.nvim_create_user_command('OpenSettings', function(opts)
    local config = "edit ~/.config/nvim/"

    local settings_file = opts.fargs[1]
    if not settings_file then
        vim.cmd(config .. "init.lua")
    else
        vim.cmd(config .. "lua/" .. settings_file .. ".lua")
    end
end, { nargs = '?' })
