return {
  {
    "nvim-telescope/telescope.nvim",
    -- tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
      require("telescope").setup({
        pickers = {
          help_tags = {
            mappings = {
              i = {
                ["<CR>"] = "select_vertical",
              },
            },
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
