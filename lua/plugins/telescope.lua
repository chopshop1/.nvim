return {
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = { "node_modules" },
      },
      pickers = {
        find_files = {
          hidden = true,
          no_ignore = true,
          file_ignore_patterns = { "node_modules" },
        },
        live_grep = {
          additional_args = { "--hidden", "--no-ignore", "--glob", "!node_modules/*" },
        },
      },
    },
  },
}
