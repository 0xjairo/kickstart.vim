-- Jump around with labels (vim.pack)

vim.pack.add { 'https://github.com/folke/flash.nvim' }

---@type Flash.Config
local flash = require 'flash'
flash.setup {}
flash.toggle(false)

-- stylua: ignore
vim.keymap.set({ 'n', 'x', 'o' }, '<c-s>', function() require('flash').jump() end, { desc = 'Flash' })
vim.keymap.set({ 'n', 'x', 'o' }, 'S', function() require('flash').treesitter() end, { desc = 'Flash Treesitter' })
vim.keymap.set('o', 'r', function() require('flash').remote() end, { desc = 'Remote Flash' })
vim.keymap.set({ 'o', 'x' }, 'R', function() require('flash').treesitter_search() end, { desc = 'Treesitter Search' })
vim.keymap.set('c', '<c-s>', function() require('flash').toggle() end, { desc = 'Toggle Flash Search' })
