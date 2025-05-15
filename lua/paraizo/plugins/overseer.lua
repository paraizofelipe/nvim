M = {}

local function load_config()
	local overseer = require("overseer")
	overseer.setup({
		task_list = {
			direction = "bottom",
			min_height = 25,
			max_height = 25,
			default_detail = 1,
		},
		bindings = {
			["<CR>"] = function()
				local task_list = require("overseer.task_list")
				local task = task_list.get_selected_task()
				if task then
					task:open({ enter = true, direction = "float" })
				end
			end,
		},
	})
end

M.lazy = {
	"stevearc/overseer.nvim",
	cmd = { "MakeitOpen", "MakeitToggleResults", "MakeitRedo" },
	config = load_config,
}

return M.lazy
