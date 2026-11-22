-- Small plugins managed with vim.pack (Neovim 0.13+) instead of lazy.nvim.
-- This module is required after lazy.setup() (see init.lua) so that plugins
-- still managed by lazy (e.g. snacks.nvim, used in the keymap below) are
-- available at runtime.

vim.pack.add {
  'https://github.com/tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'https://github.com/imsnif/kdl.vim', -- configuration language (as in yaml or xml)
  'https://github.com/nvim-lua/plenary.nvim', -- dependency of todo-comments.nvim
  'https://github.com/folke/todo-comments.nvim', -- Highlight todo, notes, etc in comments
}

-- lazy.nvim disables 'loadplugins'; source plugin/ scripts ourselves
-- (required for vimscript plugins like vim-sleuth)
require('custom.pack_loader').source_plugin_scripts {
  'vim-sleuth',
  'kdl.vim',
  'plenary.nvim',
  'todo-comments.nvim',
}

require('todo-comments').setup { signs = true }

vim.keymap.set('n', '<leader>st', function()
  Snacks.picker.todo_comments { keywords = { 'PERF', 'INFO', 'TODO', 'FIX', 'FIXME', 'XXX', 'BUG' } }
end, { desc = 'Todo/Fix/Fixme' })
