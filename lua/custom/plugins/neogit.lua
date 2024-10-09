return {
  'NeogitOrg/neogit',
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration
    "ibhagwan/fzf-lua",              -- optional
  },
  config = true,
  event = "VeryLazy",
  keys = {
    { '<leader>gg', ':Neogit cwd=%:p:h<cr>', desc = 'Neogit' },
  },
  cmd = { "Neogit"},

}
