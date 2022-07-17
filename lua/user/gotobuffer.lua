local vim = vim

Get_current_buffers = function()
	local buffers = {}
	local key = 0

	for _, buffer_num in ipairs(vim.api.nvim_list_bufs()) do
		if vim.fn.buflisted(buffer_num) then
			key = key + 1
			buffers[key] = buffer_num
		end
	end

	return buffers
end
