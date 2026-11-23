-- Statusline (vim.pack)

vim.pack.add {
  'https://github.com/nvim-lualine/lualine.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
}

require('lualine').setup {
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },

    lualine_c = {
      { 'filename', path = 1 },
      { 'diagnostics' },
      { 'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 } },
    },
  },
}
