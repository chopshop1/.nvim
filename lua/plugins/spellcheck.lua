return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        typos_lsp = {},
      },
    },
    init = function()
      vim.keymap.set("n", "<leader>cw", function()
        local word = vim.fn.expand("<cword>")
        local file = vim.fn.getcwd() .. "/_typos.toml"
        local entry = word .. ' = "' .. word .. '"'

        -- Read existing content or start fresh
        local content = ""
        local f = io.open(file, "r")
        if f then
          content = f:read("*a")
          f:close()
        end

        -- Add [default.extend-words] header if missing
        if not content:find("%[default%.extend%-words%]") then
          content = content .. "\n[default.extend-words]\n"
        end

        -- Append word under the header
        content = content:gsub("(%[default%.extend%-words%]\n)", "%1" .. entry .. "\n")

        f = io.open(file, "w")
        if f then
          f:write(content)
          f:close()
          vim.notify("Added '" .. word .. "' to _typos.toml", vim.log.levels.INFO)
          -- Restart typos-lsp to pick up the change
          vim.cmd("LspRestart typos_lsp")
        end
      end, { desc = "Add word to typos dictionary" })
    end,
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "typos-lsp" },
    },
  },
}
