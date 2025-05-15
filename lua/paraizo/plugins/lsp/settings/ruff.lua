return {
	settings = {
		logLevel = "debug",
		lineLength = 79,
		-- configurationPreference = "editorOnly",
	},
	configuration = {
		lint = {
			unfixable = { "B" },
			enable = true,
			select = { "E", "F", "W", "B", "Q000" },
			ignore = {},
			["per-file-ignores"] = {
				["__init__.py"] = { "E402" },
				["**/{tests,docs,tools}/*"] = { "E402" },
			},
			["flake8-quotes"] = {
				["inline-quotes"] = "single",
			},
		},
		format = {
			enable = true,
			quoteStyle = "single",
		},
	},
}
