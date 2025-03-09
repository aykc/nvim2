return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  lazy = false,
  keys = {
    { "gd",         vim.lsp.buf.definition,  desc = "definition" },
    { "gD",         vim.lsp.buf.declaration, desc = "declaration" },
    { "<leader>ca", vim.lsp.buf.code_action, mode = { "n", "v" }, desc = "code action" },
  },
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
  end,
}
