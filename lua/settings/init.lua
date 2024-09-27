local options = {
  splitright = true,
  splitbelow = true,
  number = true,
  autoindent = true,
  expandtab = true,
  tabstop = 2,
  shiftwidth = 2,
  scrolloff = 5,
  termguicolors = true,
  clipboard = 'unnamedplus',
  hidden = true,
  guifont = 'JetBrainsMono, Nerd, Font, 11',
  encoding = 'UTF-8',
  listchars = 'tab:▸ ,trail:·,precedes:←,extends:→,eol:↲,nbsp:␣,space:⋅',
  mouse = 'a',
  undofile = true,
  undolevels = 1000,
  updatetime = 100,
  showmatch = true,
  ignorecase = true,
  hlsearch = false,
  smartcase = true,
  completeopt = 'menu,menuone,noselect',
  showmode = false,
  cursorline = true,
  signcolumn = "yes",
  foldlevel = 20,
  foldmethod = "expr",
  foldexpr = "nvim_treesitter#foldexpr()",
  -- set shada options
  shada = [[!,'1000,s100,<500,f1,:100,@1000,/50,%50,h]],
}

for k, v in pairs(options) do
  vim.o[k] = v
end
