-- Collection of various small independent plugins/modules (vim.pack)

vim.pack.add { 'https://github.com/echasnovski/mini.nvim' }

-- Better Around/Inside textobjects
--
-- Examples:
--  - va)  - [V]isually select [A]round [)]paren
--  - yinq - [Y]ank [I]nside [N]ext [']quote
--  - ci'  - [C]hange [I]nside [']quote
require('mini.ai').setup { n_lines = 500 }

require('mini.icons').setup()

require('mini.surround').setup {
  mappings = {
    add = 'gsa', -- Add surrounding in Normal and Visual modes
    delete = 'gsd', -- Delete surrounding
    find = 'gsf', -- Find surrounding (to the right)
    find_left = 'gsF', -- Find surrounding (to the left)
    highlight = 'gsh', -- Highlight surrounding
    replace = 'gsr', -- Replace surrounding
    update_n_lines = 'gsn', -- Update `n_lines`
  },
}

require('mini.operators').setup {
  exchange = {
    prefix = 'gX',
  },
  replace = {
    prefix = 'gR',
  },
  sort = {
    prefix = 'gS',
  },
}

--  Check out: https://github.com/echasnovski/mini.nvim
