return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  lazy = false,
  config = function()
    local config = {
      -- disable virtual text
      -- virtual_text = false,
      -- show signs
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.INFO] = "",
          [vim.diagnostic.severity.HINT] = "󰌵",
        },
        numhl = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.HINT] = "",
          [vim.diagnostic.severity.INFO] = "",
        },
      },
      -- update_in_insert = true,
      -- underline = true,
      -- severity_sort = true,
      -- float = {
      --   focusable = false,
      --   style = "minimal",
      --   border = "rounded",
      --   source = "always",
      --   header = "",
      --   prefix = "",
      -- },
    }

    vim.diagnostic.config(config)

    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require("lspconfig")
    local util = require("lspconfig.util")

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })
    lspconfig.ruby_lsp.setup({
      capabilities = capabilities,
      mason = false,
      cmd = { "ruby-lsp" },
      filetypes = { "ruby", "eruby" },
      root_dir = util.root_pattern("Gemfile", ".git"),
      init_options = {
        formatter = "auto",
      },
      single_file_support = true,
      -- cmd = { vim.fn.expand("~/.rbenv/versions/3.1.2/bin/ruby-lsp") },
    })

    -- lspconfig.solargraph.setup {}
    --[[ lspconfig.rubocop.setup({
      capabilities = capabilities,
      mason = false,
      cmd = { "rubocop", "--lsp" },
      filetypes = { "ruby", "eruby" },
      root_dir = util.root_pattern("Gemfile", ".git"),
      init_options = {
        formatter = "auto",
      },
      single_file_support = true,
    }) ]]

    lspconfig.ts_ls.setup({
      capabilities = capabilities,
    })

    lspconfig.gopls.setup({
      capabilities = capabilities,
    })

    -- LspAttach event
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("LspAttachGroup", { clear = true }),
      callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client.server_capabilities.completionProvider then
          vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
        end
        if client.server_capabilities.definitionProvider then
          vim.bo[bufnr].tagfunc = "v:lua.vim.lsp.tagfunc"
        end

        -- Set custom key mappings for LSP when attached
        local bufopts = { noremap = true, silent = true }
        bufopts = vim.tbl_deep_extend("force", bufopts, { desc = "definition" })
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", bufopts)

        bufopts = vim.tbl_deep_extend("force", bufopts, { desc = "declaration" })
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", bufopts)

        bufopts = vim.tbl_deep_extend("force", bufopts, { desc = "code action" })
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", bufopts)
        vim.api.nvim_buf_set_keymap(bufnr, "v", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", bufopts)

        bufopts = vim.tbl_deep_extend("force", bufopts, { desc = "references" })
        vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>cr", "<cmd>lua vim.lsp.buf.references()<CR>", bufopts)
      end,
    })
  end,
}
