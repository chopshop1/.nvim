return {
  -- Add svelte to treesitter for syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "svelte" },
    },
  },
}
