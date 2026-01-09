-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Window navigation with Ctrl+hjkl
vim.keymap.set("n", "<C-h>", "<Cmd>wincmd h<CR>", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<Cmd>wincmd j<CR>", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<Cmd>wincmd k<CR>", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", "<Cmd>wincmd l<CR>", { desc = "Go to right window" })

-- Also enable in terminal mode
vim.keymap.set("t", "<C-h>", "<Cmd>wincmd h<CR>", { desc = "Go to left window" })
vim.keymap.set("t", "<C-j>", "<Cmd>wincmd j<CR>", { desc = "Go to lower window" })
vim.keymap.set("t", "<C-k>", "<Cmd>wincmd k<CR>", { desc = "Go to upper window" })
vim.keymap.set("t", "<C-l>", "<Cmd>wincmd l<CR>", { desc = "Go to right window" })

-- Open fold when pressing j on a collapsed code block
vim.keymap.set("n", "j", function()
  if vim.fn.foldclosed(".") ~= -1 then
    return "zo"
  end
  return "j"
end, { expr = true, desc = "Move down or open fold" })

-- Copy to tmux buffer
vim.keymap.set({'n', 'v'}, '<leader>ty', ':w !tmux load-buffer -<CR><CR>')

-- Or make 'y' automatically copy to tmux in visual mode
vim.keymap.set('v', 'y', 'y:call system("tmux load-buffer -", @")<CR>')
