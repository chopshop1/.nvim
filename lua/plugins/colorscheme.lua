-- GitHub Dark High Contrast colorscheme (original theme)
return {
  -- Add github theme
  {
    "projekt0n/github-nvim-theme",
    lazy = false,
    priority = 1000,
    config = function()
      require("github-theme").setup({})

      -- Darker highlight for matching words under cursor
      vim.api.nvim_create_autocmd("ColorScheme", {
        callback = function()
          local bg = "#1a3a5c"
          vim.api.nvim_set_hl(0, "LspReferenceText", { bg = bg })
          vim.api.nvim_set_hl(0, "LspReferenceRead", { bg = bg })
          vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg = bg, underline = true })
        end,
      })
      -- Apply immediately for the current colorscheme
      local bg = "#1a3a5c"
      vim.api.nvim_set_hl(0, "LspReferenceText", { bg = bg })
      vim.api.nvim_set_hl(0, "LspReferenceRead", { bg = bg })
      vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg = bg, underline = true })
    end,
  },

  -- Set colorscheme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "github_dark_high_contrast",
    },
  },
}
