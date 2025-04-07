return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = function()
    local lualine = require 'lualine'
    local opts = {
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },

        lualine_c = {
          { 'filename', path = 1 },
          {
            'diagnostics',
            -- symbols = {
            --   error = icons.diagnostics.Error,
            --   warn = icons.diagnostics.Warn,
            --   info = icons.diagnostics.Info,
            --   hint = icons.diagnostics.Hint,
            -- },
          },
          { 'filetype', icon_only = true, separator = '', padding = { left = 1, right = 0 } },
        },
      },
    }

    return opts
  end,
}
