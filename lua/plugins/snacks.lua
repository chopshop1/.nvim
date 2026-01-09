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
