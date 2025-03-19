return {
	"rmagatti/auto-session",
  lazy = false,
  keys = {
    { '<leader>fs', '<cmd>SessionSearch<CR>', desc = 'Sessions' },
  },
	opts = {
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
  },
}
