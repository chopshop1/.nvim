-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  -- Session management - automatically saves and restores your nvim session
  {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    opts = {
      dir = vim.fn.expand(vim.fn.stdpath 'state' .. '/sessions/'),
      options = { 'buffers', 'curdir', 'tabpages', 'winsize' },
      -- Close neo-tree before saving session to prevent issues on restore
      pre_save = function()
        vim.cmd 'Neotree close'
      end,
    },
    keys = {
      {
        '<leader>qs',
        function()
          require('persistence').load()
        end,
        desc = 'Restore Session',
      },
      {
        '<leader>ql',
        function()
          require('persistence').load { last = true }
        end,
        desc = 'Restore Last Session',
      },
      {
        '<leader>qd',
        function()
          require('persistence').stop()
        end,
        desc = "Don't Save Current Session",
      },
    },
    init = function()
      -- Auto-restore session when starting nvim without arguments
      local function restore_session()
        if vim.fn.argc(-1) == 0 then
          require('persistence').load()
        end
      end

      local group = vim.api.nvim_create_augroup('PersistenceAutoRestore', { clear = true })
      vim.api.nvim_create_autocmd('VimEnter', {
        group = group,
        callback = restore_session,
        nested = true,
      })
    end,
  },
  {
    'NickvanDyke/opencode.nvim',
    dependencies = {
      -- Recommended for better prompt input, and required to use `opencode.nvim`'s embedded terminal — otherwise optional
      { 'folke/snacks.nvim', opts = { input = { enabled = true } } },
    },
    config = function()
      vim.g.opencode_opts = {
        -- Your configuration, if any — see `lua/opencode/config.lua`
      }

      -- Required for `opts.auto_reload`
      vim.opt.autoread = true

      -- Recommended/example keymaps
      vim.keymap.set('n', '<leader>ot', function()
        require('opencode').toggle()
      end, { desc = 'Toggle embedded' })
      vim.keymap.set('n', '<leader>oA', function()
        require('opencode').ask()
      end, { desc = 'Ask' })
      vim.keymap.set('n', '<leader>oa', function()
        require('opencode').ask '@cursor: '
      end, { desc = 'Ask about this' })
      vim.keymap.set('v', '<leader>oa', function()
        require('opencode').ask '@selection: '
      end, { desc = 'Ask about selection' })
      vim.keymap.set('n', '<leader>oe', function()
        require('opencode').prompt 'Explain @cursor and its context'
      end, { desc = 'Explain this code' })
      vim.keymap.set('n', '<leader>o+', function()
        require('opencode').prompt('@buffer', { append = true })
      end, { desc = 'Add buffer to prompt' })
      vim.keymap.set('v', '<leader>o+', function()
        require('opencode').prompt('@selection', { append = true })
      end, { desc = 'Add selection to prompt' })
      vim.keymap.set('n', '<leader>on', function()
        require('opencode').command 'session_new'
      end, { desc = 'New session' })
      vim.keymap.set('n', '<S-C-u>', function()
        require('opencode').command 'messages_half_page_up'
      end, { desc = 'Messages half page up' })
      vim.keymap.set('n', '<S-C-d>', function()
        require('opencode').command 'messages_half_page_down'
      end, { desc = 'Messages half page down' })
      vim.keymap.set({ 'n', 'v' }, '<leader>os', function()
        require('opencode').select()
      end, { desc = 'Select prompt' })
    end,
  },
}
