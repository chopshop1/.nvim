return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      -- Better signs
      signs = {
        add = { text = "▎" },
        change = { text = "▎" },
        delete = { text = "" },
        topdelete = { text = "" },
        changedelete = { text = "▎" },
        untracked = { text = "▎" },
      },

      -- Keymaps for toggling diff views
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = function(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Toggle diff views
        map("n", "<leader>gtd", gs.toggle_deleted, { desc = "Toggle deleted lines" })
        map("n", "<leader>gtw", gs.toggle_word_diff, { desc = "Toggle word diff" })
        map("n", "<leader>gtl", gs.toggle_linehl, { desc = "Toggle line highlight" })

        -- Preview hunk inline
        map("n", "<leader>gp", gs.preview_hunk, { desc = "Preview hunk" })
        map("n", "<leader>gP", gs.preview_hunk_inline, { desc = "Preview hunk inline" })

        -- Navigate hunks
        map("n", "]h", gs.next_hunk, { desc = "Next hunk" })
        map("n", "[h", gs.prev_hunk, { desc = "Previous hunk" })

        -- Blame
        map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, { desc = "Blame line" })
      end,
    },
  },
}
