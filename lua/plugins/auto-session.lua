return {
	"rmagatti/auto-session",
  lazy = false,
  keys = {
    { '<leader>ss', '<cmd>SessionSearch<CR>', desc = 'Session search' },
  },
	opts = {
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
  },
}
