return {
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- required
      'sindrets/diffview.nvim', -- optional - Diff integration

      -- Only one of these is needed.
      'echasnovski/mini.pick', -- optional
    },
    config = true,
    keys = {
      { '<leader>GG', ':Neogit<CR>', desc = 'Lazygit', },
    }
  },
}
