return {
	pylsp = {
		configurationSources = { "flake8" },
		plugins = {
			pylint = {
				enabled = false,
				args = {
					"--disable=W0613",
				},
			},
			pyflakes = { enabled = false },
			pycodestyle = { enabled = false },
			flake8 = {
				enabled = true,
				inlineQuotes = "single",
			},
		},
	},
}
