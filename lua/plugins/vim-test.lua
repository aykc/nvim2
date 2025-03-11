return {
  "vim-test/vim-test",
  dependencies = {
    "preservim/vimux",
  },
  keys = {
    { "<leader>tn", ":TestNearest<CR>" },
    { "<leader>tc", ":TestClass<CR>" },
    { "<leader>tf", ":TestFile<CR>" },
    { "<leader>ta", ":TestSuite<CR>" },
    { "<leader>tl", ":TestLast<CR>" },
    { "<leader>tv", ":TestVisit<CR>" },
  },
  config = function()
    vim.cmd("let test#strategy = 'vimux'")
  end,
}
