-- Small plugins managed with vim.pack (Neovim 0.13+).

vim.pack.add {
  'https://github.com/tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'https://github.com/imsnif/kdl.vim', -- configuration language (as in yaml or xml)
  'https://github.com/nvim-lua/plenary.nvim', -- dependency of todo-comments.nvim
  'https://github.com/folke/todo-comments.nvim', -- Highlight todo, notes, etc in comments
}

require('todo-comments').setup { signs = true }

vim.keymap.set('n', '<leader>st', function()
  Snacks.picker.todo_comments { keywords = { 'PERF', 'INFO', 'TODO', 'FIX', 'FIXME', 'XXX', 'BUG' } }
end, { desc = 'Todo/Fix/Fixme' })
