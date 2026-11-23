-- Open files from nested terminals in the host neovim (vim.pack).
-- Must load early (see init.lua).

vim.pack.add { 'https://github.com/willothy/flatten.nvim' }

require('flatten').setup {
  window = { open = 'alternate' },
}
