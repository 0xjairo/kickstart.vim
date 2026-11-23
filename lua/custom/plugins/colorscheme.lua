-- Colorscheme (vim.pack). Loaded early (see init.lua) so highlights are
-- correct for all other plugins.

vim.pack.add {
  { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' },
}

require('catppuccin').setup {
  flavour = 'mocha',
  styles = {
    comments = {},
  },
}

-- TODO: Use a custom neovide theme to differentiate from terminal nvim
vim.cmd.colorscheme(vim.g.neovide and 'catppuccin-frappe' or 'catppuccin')

-- You can configure highlights by doing something like:
-- vim.cmd.hi 'Comment gui=none'

-- vim: ts=2 sts=2 sw=2 et
