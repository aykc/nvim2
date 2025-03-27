return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    null_ls.setup({
      sources = {
        formatting.stylua,
        diagnostics.rubocop,
        diagnostics.eslint_d,
        formatting.rubocop,
        formatting.prettier,
      },
    })

    vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { noremap = true, silent = true, desc = "format" })
  end,
}
