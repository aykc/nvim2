return {
  "williamboman/mason-lspconfig.nvim",
  lazy = false,
  opts = {
    ensure_installed = { "lua_ls", "ts_ls", "ruby_lsp" }
  }
}
