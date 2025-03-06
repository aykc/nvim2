return {
	"neovim/nvim-lspconfig",
	config = function()
		local lspconfig = require("lspconfig")
		lspconfig.lua_ls.setup({})
		lspconfig.ruby_lsp.setup({
			mason = false,
			cmd = { "ruby-lsp" },
			-- cmd = { vim.fn.expand("~/.rbenv/versions/3.1.2/bin/ruby-lsp") },
		})
		-- lspconfig.solargraph.setup {}
		-- lspconfig.rubocop.setup {}
    lspconfig.ts_ls.setup({})

		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
	end,
}
