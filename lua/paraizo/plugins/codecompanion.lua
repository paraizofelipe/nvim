M = {}

local function load_config()

    local fmt = string.format

    local constants = {
      LLM_ROLE = "llm",
      USER_ROLE = "user",
      SYSTEM_ROLE = "system",
    }

    local defaults = {
      adapters = {
        -- LLMs -------------------------------------------------------------------
        anthropic = "anthropic",
        azure_openai = "azure_openai",
        copilot = "copilot",
        gemini = "gemini",
        ollama = "ollama",
        -- openai = "openai",
        openai = function()
          return require("codecompanion.adapters").extend("openai", {
            env = {
              api_key = "cmd:gpg --decrypt ~/.openai 2>/dev/null",
            },
          })
        end,
        xai = "xai",
        -- NON-LLMs ---------------------------------------------------------------
        non_llms = {
          jina = "jina",
        },
        -- OPTIONS ----------------------------------------------------------------
        opts = {
          allow_insecure = false, -- Allow insecure connections?
          proxy = nil, -- [protocol://]host[:port] e.g. socks5://127.0.0.1:9999
        },
      },
    }

    require("codecompanion").setup(defaults)
end

M.lazy = {
	"olimorris/codecompanion.nvim",
    dependencies = {
        { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } },
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
	config = load_config,
	lazy = false,
	enabled = true,
}

return M.lazy
