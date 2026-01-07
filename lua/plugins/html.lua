return {
  -- Add html to treesitter for syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "html" },
    },
  },
}
