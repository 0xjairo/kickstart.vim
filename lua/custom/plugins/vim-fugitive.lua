-- Git client (vim.pack)
vim.pack.add {
  'https://github.com/tpope/vim-fugitive'
}

vim.keymap.set('n', '<leader>gg', ':Git<CR>', { desc = 'vim-fugitive' })
