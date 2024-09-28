return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  event = 'VeryLazy',
  -- See `:help lualine.txt`
  opts = {
    options = {
      theme = 'tokyonight',
      -- section_separators = '',
    },
    sections = {
      lualine_c = {
        {
          'filename',
          path = 1, -- 4: Filename and parent dir, with tilde as the home directory
        },
        {
          'navic',
          color_correction = nil,
          navic_opts = nil,
        },
      },
    },
  },
}
