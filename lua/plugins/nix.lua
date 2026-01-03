return {
  -- Add nix to treesitter for syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "nix" },
    },
  },

  -- Add nil_ls for Nix LSP support
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        nil_ls = {},
      },
    },
  },

  -- Ensure nil is installed via mason
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "nil" },
    },
  },
}
