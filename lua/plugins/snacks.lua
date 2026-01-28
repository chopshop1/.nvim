return {
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>gc", function() require("snacks").picker.git_log() end, desc = "Git Commits" },
      { "<leader>gd", function() require("snacks").picker.git_diff() end, desc = "Git Diff" },
      { "<leader>gs", function() require("snacks").picker.git_status() end, desc = "Git Status" },
    },
    opts = {
      picker = {
        sources = {
          files = {
            hidden = true,
          },
          explorer = {
            hidden = true,
            ignored = true,
            layout = {
              layout = {
                position = "right",
                width = 40,
              },
            },
          },
        },
      },
      explorer = {
        replace_netrw = true,
      },
    },
  },
}
