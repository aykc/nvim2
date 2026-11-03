return {
  "OXY2DEV/markview.nvim",
  lazy = false,
  ft = { "markdown", "codecompanion" }, -- Указываем типы файлов для загрузки
  opts = {
    preview = {
      filetypes = { "markdown", "codecompanion" },
      ignore_buftypes = {},
    },
  },
}
