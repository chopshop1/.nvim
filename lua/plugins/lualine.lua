-- Token count in statusline (approximate LLM tokens: ~4 chars per token)
return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local cache = {}

      local function token_count()
        local buf = vim.api.nvim_get_current_buf()
        local tick = vim.api.nvim_buf_get_changedtick(buf)
        local cached = cache[buf]
        if cached and cached.tick == tick then
          return cached.display
        end

        local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
        local chars = 0
        for _, line in ipairs(lines) do
          chars = chars + #line + 1
        end
        local tokens = math.floor(chars / 4)

        local display
        if tokens >= 1000 then
          display = string.format("%.1fk tok", tokens / 1000)
        else
          display = tokens .. " tok"
        end

        cache[buf] = { tick = tick, display = display }
        return display
      end

      -- Clean up cache when buffers are deleted
      vim.api.nvim_create_autocmd("BufDelete", {
        callback = function(ev)
          cache[ev.buf] = nil
        end,
      })

      table.insert(opts.sections.lualine_z, 1, token_count)
    end,
  },
}
