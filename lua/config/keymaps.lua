-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Open fold when pressing j on a collapsed code block
vim.keymap.set("n", "j", function()
  if vim.fn.foldclosed(".") ~= -1 then
    return "zo"
  end
  return "j"
end, { expr = true, desc = "Move down or open fold" })
