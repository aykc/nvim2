return {
	"nvim-telescope/telescope.nvim",
	-- tag = "0.1.5",
	-- or                              , branch = '0.1.x',
  branch = 'master',
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-ui-select.nvim",
	},
	keys = {
		-- Files
		{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Files" },
		{ "<leader>fg", "<cmd>Telescope live_grep preview={timeout=1000}<CR>", desc = "Text" },
		{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
		{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help" },
		{ "<leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Keymaps" },
		-- LSP
		{ "<leader>fr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>", desc = "LSP references" },
		-- Git
		{ "<leader>gc", "<cmd>lua require('telescope.builtin').git_commits()<CR>", desc = "Commits" },
		{ "<leader>gb", "<cmd>lua require('telescope.builtin').git_branches()<CR>", desc = "Branches" },
		{ "<leader>gs", "<cmd>lua require('telescope.builtin').git_status()<CR>", desc = "Status" },
	},
	opts = {
		defaults = {
			file_ignore_patterns = { "node%_modules/*", ".yarn/*", ".git/*", ".idea/*" },
		},
		extensions = {
			fzf = {
				fuzzy = true, -- false will only do exact matching
				override_generic_sorter = true, -- override the generic sorter
				override_file_sorter = true, -- override the file sorter
				case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			},
			["ui-select"] = {
				require("telescope.themes").get_dropdown({}),
			},
		},
	},
	config = function()
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("ui-select")
	end,
}
