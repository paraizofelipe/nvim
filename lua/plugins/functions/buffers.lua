local api = vim.api

local B = {}

B.delete = function()
    local current_buf = api.nvim_get_current_buf()
    vim.api.nvim_command('bNext')
    api.nvim_buf_delete(current_buf, {})
end

return B
