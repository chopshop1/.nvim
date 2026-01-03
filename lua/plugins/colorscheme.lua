-- Tokyo Night colorscheme configuration (matches system theme)
return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "storm",
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        sidebars = "dark",
        floats = "dark",
      },
    },
  },

  -- Set colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-storm",
    },
  },
}
