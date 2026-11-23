-- Useful plugin to show you pending keybinds (vim.pack)

vim.pack.add { 'https://github.com/folke/which-key.nvim' }

local wk = require 'which-key'
wk.setup()

vim.keymap.set('n', '<leader>?', function()
  require('which-key').show { global = false }
end, { desc = 'Buffer Local Keymaps (which-key)' })

-- Document existing key chains
wk.add {
  { '<leader>c', group = '[C]ode' },
  -- { "<leader>c_", hidden = true },
  { '<leader>d', group = '[D]ocument' },
  -- { "<leader>d_", hidden = true },
  { '<leader>r', group = '[R]ename' },
  -- { "<leader>r_", hidden = true },
  { '<leader>s', group = '[S]earch' },
  -- { "<leader>s_", hidden = true },
  { '<leader>w', group = '[W]orkspace' },
  -- { "<leader>w_", hidden = true },
}
