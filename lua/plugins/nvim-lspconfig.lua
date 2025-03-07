return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
	lazy = false,
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lspconfig = require("lspconfig")
		lspconfig.lua_ls.setup({
			capabilities = capabilities,
		})
		lspconfig.ruby_lsp.setup({
			capabilities = capabilities,
			mason = false,
			cmd = { "ruby-lsp" },
			-- cmd = { vim.fn.expand("~/.rbenv/versions/3.1.2/bin/ruby-lsp") },
		})
		-- lspconfig.solargraph.setup {}
		-- lspconfig.rubocop.setup {}
		lspconfig.ts_ls.setup({
			capabilities = capabilities,
		})

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
	end,
}
