local api = vim.api

local B = {}

-- visible
B.list_visible = function()
    local wins = api.nvim_list_wins()

    return vim.tbl_map(vim.api.nvim_win_get_buf, wins)
end

-- not_visible
B.list_not_visible = function()
    local bufs = api.nvim_list_bufs()

    return vim.tbl_filter(function(buf) return not vim.tbl_contains(B.list_visible(), buf) end, bufs)
end

B.is_visible = function(buf_num) 
    local visible_bufs = B.list_visible()
    return vim.tbl_contains(visible_bufs, buf_num)
end

--- delete
B.delete = function()
    local current_buf = api.nvim_get_current_buf()
    local buf_list = api.nvim_list_bufs()

    local first_buf = buf_list[1]
    local last_buf = buf_list[#buf_list]

    if current_buf ~= first_buf and current_buf ~= last_buf then
        api.nvim_set_current_buf(B.list_not_visible()[1])
    end

    if current_buf == first_buf then
        api.nvim_set_current_buf(buf_list[#buf_list])
    end

    if current_buf == last_buf then
        api.nvim_set_current_buf(buf_list[1])
    end

    api.nvim_buf_delete(current_buf, {})
end

return B
