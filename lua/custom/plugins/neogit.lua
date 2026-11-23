-- Git client (vim.pack)

vim.pack.add {
  'https://github.com/NeogitOrg/neogit',
  'https://github.com/nvim-lua/plenary.nvim', -- required
  'https://github.com/sindrets/diffview.nvim', -- optional - Diff integration
  -- picker: mini.pick is provided by mini.nvim (see mini.lua)
}

require('neogit').setup {}

vim.keymap.set('n', '<leader>gg', ':Neogit cwd=%:p:h<CR>', { desc = 'Lazygit' })
