-- Fuzzy finder (vim.pack). Icons come from mini.icons (mini.lua).

vim.pack.add { 'https://github.com/ibhagwan/fzf-lua' }

require('fzf-lua').setup {
  winopts = {
    preview = { flip_columns = 200 },
  },
}

local fzf = require 'fzf-lua'

-- files
vim.keymap.set('n', '<leader>ff', fzf.files, { desc = 'Find Files' })
vim.keymap.set('n', '<leader>fr', fzf.oldfiles, { desc = 'Old (recent) Files' })
vim.keymap.set('n', '<leader>fg', function() fzf.git_files { cwd = vim.fn.expand '%:h:p' } end, { desc = 'Find Git Files' })
vim.keymap.set('n', '<leader>,', fzf.buffers, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fc', function() fzf.files { cwd = vim.fn.stdpath 'config' } end, { desc = 'Find Config File' })

-- grep
vim.keymap.set('n', '<leader>/', fzf.live_grep, { desc = 'Live Grep' })
vim.keymap.set('n', '<leader>sw', fzf.grep_cword, { desc = 'Visual selection or word' })
vim.keymap.set('x', '<leader>sw', fzf.grep_visual, { desc = 'Visual selection or word' })

-- diagnostics
vim.keymap.set('n', '<leader>sd', fzf.lsp_document_diagnostics, { desc = 'Diagnostics' })
vim.keymap.set('n', '<leader>sD', fzf.lsp_workspace_diagnostics, { desc = 'Buffer Diagnostics' })

-- LSP
vim.keymap.set('n', 'gd', fzf.lsp_definitions, { desc = 'Goto Definition' })
vim.keymap.set('n', 'gD', fzf.lsp_declarations, { desc = 'Goto Declaration' })
vim.keymap.set('n', 'gr', fzf.lsp_references, { nowait = true, desc = 'References' })
vim.keymap.set('n', 'gI', fzf.lsp_implementations, { desc = 'Goto Implementation' })
vim.keymap.set('n', 'gy', fzf.lsp_typedefs, { desc = 'Goto T[y]pe Definition' })
vim.keymap.set('n', '<leader>ss', fzf.lsp_document_symbols, { desc = 'LSP Symbols' })
vim.keymap.set('n', '<leader>sS', fzf.lsp_workspace_symbols, { desc = 'LSP Workspace Symbols' })
