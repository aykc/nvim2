return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	--[[ opts = function(_, opts)
		opts = {
			indent = {
				-- highlight = highlight,
				char = "┊",
				-- char = ""
			},
			whitespace = {
				-- highlight = highlight,
				remove_blankline_trail = false,
			},
			scope = {
				enabled = true,
			},
		}
		-- Other blankline configuration here
		return require("indent-rainbowline").make_opts(opts)
	end,
	dependencies = {
		"TheGLander/indent-rainbowline.nvim",
	}, ]]
	config = function()
		local highlight = {
			"RainbowRed",
			"RainbowYellow",
			"RainbowBlue",
			"RainbowOrange",
			"RainbowGreen",
			"RainbowViolet",
			"RainbowCyan",
		}

		local opts = {
			indent = {
				highlight = highlight,
				char = "┊",
			},
			scope = {
				-- highlight = highlight,
				enabled = false,
			},
		}

		local hooks = require("ibl.hooks")
		-- create the highlight groups in the highlight setup hook, so they are reset
		-- every time the colorscheme changes
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#5e0000" })
			vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#b3b805" })
			vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#303d8e" })
			vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
			vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
			vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
			vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
		end)

		require("ibl").setup(opts)
	end,
}
