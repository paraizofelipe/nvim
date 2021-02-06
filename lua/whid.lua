local vim = vim

local M = {}

function M.makeScratch()
    -- local s_start = vim.api.nvim_buf_get_mark(0, "<")
    -- local s_end = vim.api.nvim_buf_get_mark(0, ">")
    local lines = vim.api.nvim_buf_get_lines(0, 1, 3, false)
    for k,v in pairs(lines) do
        print(v)
    end
end

return M
