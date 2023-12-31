return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = "work",
          path = "~/OneDrive - Rugged Robotics/Documents/Notes",
        },
      },
    }
  },
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
      require('toggleterm').setup({})
      vim.keymap.set('n', '<Leader>T', '<cmd>ToggleTerm<cr>', { desc = 'ToggleTerm' } )
      vim.keymap.set('t', '<Esc><Esc>', '<cmd>ToggleTerm<cr>', { desc = 'ToggleTerm' } )
      return true
    end
  },

}

-- vim: ts=2 sts=2 sw=2 et
