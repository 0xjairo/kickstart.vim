return {
  {
    'rebelot/kanagawa.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = {
      transparent = true,
    },
    init = function()

      -- -- choose style 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      -- vim.cmd.colorscheme 'tokyonight-night'
      -- -- choose style 'kanagawa-wave' (default), 'kanagawa-dragon' (dark), or 'kanagawa-lotus' (light).
      vim.cmd.colorscheme 'kanagawa-wave'

      -- You can configure highlights by doing something like:
      -- vim.cmd.hi 'Comment gui=none'
    end,
  },
}

-- vim: ts=2 sts=2 sw=2 et
