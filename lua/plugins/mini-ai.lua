return {
  {
    "nvim-mini/mini.ai",
    opts = function(_, opts)
      -- Prevent mini.ai from overriding I/A in visual/visual-block mode,
      -- which breaks native block insert/append.
      opts.mappings = opts.mappings or {}
      opts.mappings.around_next = ""
      opts.mappings.inside_next = ""
      opts.mappings.around_last = ""
      opts.mappings.inside_last = ""
    end,
  },
}
