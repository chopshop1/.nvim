return {
  {
    "MagicDuck/grug-far.nvim",
    config = function()
      require("grug-far").setup({})
    end,
    keys = {
      { "<leader>sr", '<cmd>lua require("grug-far").open()<CR>', desc = "Find and Replace" },
      { "<leader>sw", '<cmd>lua require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })<CR>', desc = "Search word under cursor" },
    },
  },
}
