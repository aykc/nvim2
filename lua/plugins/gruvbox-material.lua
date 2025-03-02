return {
  "sainnhe/gruvbox-material",
  opts = {
    terminal_colors = true, -- add neovim terminal colors
    undercurl = true,
    underline = true,
    bold = true,
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
    palette_overrides = {},
    overrides = {},
    dim_inactive = true,
    transparent_mode = false,
  },
  config = function()
    vim.o.background = 'dark'
    vim.cmd [[let g:gruvbox_material_colors_override = {'bg0': ['#1A1A1A', '234']}]]
    vim.cmd 'colorscheme gruvbox-material'
  end,
}
