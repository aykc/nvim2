return {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
  -- or                              , branch = '0.1.x',
  cmd = 'Telescope',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  keys = {
    -- Files
    { "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
    { "<leader>fg", "<cmd>Telescope live_grep preview={timeout=1000}<CR>", desc = "Find text" },
    { "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help" },
    { "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Find keymaps" },
    -- LSP
    { "<leader>lr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>", desc = "LSP references" },
    -- Git
    { "<leader>gc", "<cmd>lua require('telescope.builtin').git_commits()<CR>", desc = "Git commits" },
    { "<leader>gb", "<cmd>lua require('telescope.builtin').git_branches()<CR>", desc = "Git branches" },
    { "<leader>gs", "<cmd>lua require('telescope.builtin').git_status()<CR>", desc = "Git status" },
  },
  opts = {
    defaults = {
      file_ignore_patterns = { "node%_modules/*", ".yarn/*", ".git/*", ".idea/*" },
    },
  },
  config = function()
    require('telescope').setup {
      extensions = {
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
        }
      }
    }
    require('telescope').load_extension('fzf')
  end,
}
