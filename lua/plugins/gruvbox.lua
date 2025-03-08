return {
	"ellisonleao/gruvbox.nvim",
	opts = {
		terminal_colors = true, -- add neovim terminal colors
		undercurl = true,
		underline = true,
		bold = false,
		italic = {
			strings = true,
			emphasis = true,
			comments = true,
			operators = false,
			folds = true,
		},
		strikethrough = true,
		invert_selection = false,
		invert_signs = false,
		invert_tabline = false,
		invert_intend_guides = false,
		inverse = true, -- invert background for search, diffs, statuslines and errors
		contrast = "hard", -- can be "hard", "soft" or empty string
		palette_overrides = {
			dark0_hard = "#17191a",
			bright_green = "#80B050",
      dark2 = "#605955",
		},
		overrides = {},
		dim_inactive = false,
		transparent_mode = false,
	},
}
