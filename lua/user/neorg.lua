require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.integrations.telescope"] = {},
		["core.dirman"] = {
			config = {
				workspaces = {
					work = "~/notes/work",
					home = "~/notes/home",
				},
			},
		},
		["core.integrations.treesitter"] = {},
		["core.completion"] = {
			config = {
				engine = "nvim-cmp",
				name = "[Neorg]",
			},
		},
		["core.concealer"] = {},
	},
})
