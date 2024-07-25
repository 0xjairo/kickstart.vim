return {
  'NeogitOrg/neogit',
  event = "VeryLazy",
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration
  },
  config = true,
  keys = {
    { '<leader>gg', ':Neogit<cr>', desc = 'Neogit' },
  },
}
