-- GitHub Dark High Contrast colorscheme (original theme)
return {
  -- Add github theme
  {
    "projekt0n/github-nvim-theme",
    lazy = false,
    priority = 1000,
    config = function()
      require("github-theme").setup({})

      local function apply_highlights()
        -- Light blue highlight for matching words under cursor
        local ref_bg = "#1a3a5c"
        vim.api.nvim_set_hl(0, "LspReferenceText", { bg = ref_bg })
        vim.api.nvim_set_hl(0, "LspReferenceRead", { bg = ref_bg })
        vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg = ref_bg, underline = true })

        -- Very dark blue cursor
        local cursor_bg = "#0d1f3c"
        vim.api.nvim_set_hl(0, "Cursor", { bg = cursor_bg, fg = "#c9d1d9" })
        vim.api.nvim_set_hl(0, "CursorLine", { bg = cursor_bg })
        vim.api.nvim_set_hl(0, "CursorColumn", { bg = cursor_bg })
      end

      vim.api.nvim_create_autocmd("ColorScheme", { callback = apply_highlights })
      apply_highlights()
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
