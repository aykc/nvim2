return {
	"folke/which-key.nvim",
	event = "VeryLazy",
  opts = {
    preset = "modern",
    spec = {
      { "<leader>c", group = "Code" },
      { "<leader>f", group = "Find" },
      { "<leader>g", group = "Git" },
      { "<leader>t", group = "Test" },
    },
  },
}
