return {
  {
    "folke/snacks.nvim",
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
              preset = "right",
              width = 0.2,
              resize = false,
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
