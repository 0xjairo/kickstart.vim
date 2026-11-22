if vim.g.neovide then
  -- font is specified in $APPDATA\neovide\config.toml
  -- see https://neovide.dev/config-file.html

  -- vim.g.neovide_scale_factor = 1.0 -- useful for presentations
  vim.g.neovide_cursor_animation_length = 0.05
  vim.g.neovide_cursor_trail_size = 0.1
  vim.g.neovide_theme = 'auto'
  vim.g.neovide_opacity = 0.94
  -- vim.g.neovide_hide_mouse_when_typing = true

  vim.cmd("cd " .. vim.env.USERPROFILE)
end

    require('vim._core.ui2').enable({
      enable = true, -- Whether to enable or disable the UI.
      msg = { -- Options related to the message module.
        ---@type 'cmd'|'msg' Default message target, either in the
        ---cmdline or in a separate ephemeral message window.
        ---@type string|table<string, 'cmd'|'msg'|'pager'> Default message target
        ---or table mapping |ui-messages| kinds and triggers to a target.
        targets = 'cmd',
        cmd = { -- Options related to messages in the cmdline window.
          height = 0.5 -- Maximum height while expanded for messages beyond 'cmdheight'.
        },
        dialog = { -- Options related to dialog window.
          height = 0.5, -- Maximum height.
        },
        msg = { -- Options related to msg window.
          height = 0.5, -- Maximum height.
          timeout = 4000, -- Time a message is visible in the message window.
        },
        pager = { -- Options related to message window.
          height = 1, -- Maximum height.
        },
      },
    })

if vim.fn.has 'win32' == 1 then
  --
  local function set_pwsh_opts()
    vim.opt.shellcmdflag =
      "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues['Out-File:Encoding']='utf8';"
    vim.opt.shellredir = '-RedirectStandardOutput %s -NoNewWindow -Wait'
    vim.opt.shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
    vim.opt.shellquote = '"'
    vim.opt.shellxquote = ''
  end

  local prog_files = string.gsub(vim.env.ProgramFiles, '\\', '/')
  local pwsh7 = prog_files .. '/Powershell/7/pwsh.exe'

  local windir = string.gsub(vim.env.WinDir, '\\', '/')
  local pwsh_sys = windir .. '/System32/WindowsPowerShell/v1.0/powershell.exe'

  if vim.fn.filereadable(pwsh7) == 1 then
    vim.opt.shell = 'pwsh'
    set_pwsh_opts()
  elseif vim.fn.filereadable(pwsh_sys) == 1 then
    vim.opt.shell = 'powershell'
    set_pwsh_opts()
  end

  vim.g.clipboard = {
    name = 'win32yank',
    copy = {
      ['+'] = 'win32yank.exe -i --crlf',
      ['*'] = 'win32yank.exe -i --crlf',
    },
    paste = {
      ['+'] = 'win32yank.exe -o --lf',
      ['*'] = 'win32yank.exe -o --lf',
    },
    cache_enabled = 0,
  }
end

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true -- Set to true if you have a Nerd Font installed

vim.opt.number = true -- Make line numbers default
vim.opt.mouse = 'a' -- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.showmode = false -- Don't show the mode, since it's already in the status line
vim.opt.breakindent = true -- Enable break indent
vim.opt.undofile = true -- Save undo history
vim.opt.ignorecase = true -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes' -- Keep signcolumn on by default
vim.opt.updatetime = 250 -- Decrease update time
vim.opt.timeoutlen = 300 -- Decrease mapped sequence wait time. Displays which-key popup sooner
vim.opt.inccommand = 'split' -- Preview substitutions live, as you type!
vim.opt.cursorline = false -- Show which line your cursor is on
vim.opt.termguicolors = true -- NOTE: You should make sure your terminal supports this
vim.opt.exrc = true
vim.opt.scrolloff = 3 -- Minimal number of screen lines to keep above and below the cursor.
vim.opt.hlsearch = true -- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.winborder = 'rounded'
vim.opt.spell = true -- `z=` to show suggetsions, `zg` to add current word to dictionary
vim.opt.spelllang = "en_us"

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = false

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- ts=2 sts=2 sw=2 et
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.diagnostic.config({ virtual_text = true, virtual_lines = false })

-- Diagnostic keymaps
vim.keymap.set('n', ']e', function()
  vim.diagnostic.jump { count = 1, severity = vim.diagnostic.severity.ERROR, float = true }
end, { desc = 'Go to next error' })
vim.keymap.set('n', '[e', function()
  vim.diagnostic.jump { count = -1, severity = vim.diagnostic.severity.ERROR, float = true }
end, { desc = 'Go to previous error' })
vim.keymap.set('n', ']w', function()
  vim.diagnostic.jump { count = 1, severity = vim.diagnostic.severity.WARN, float = true }
end, { desc = 'Go to next warning' })
vim.keymap.set('n', '[w', function()
  vim.diagnostic.jump { count = -1, severity = vim.diagnostic.severity.WARN, float = true }
end, { desc = 'Go to previous warning' })
vim.keymap.set('n', '<leader>d', function() vim.diagnostic.open_float({source='if_many'}) end, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics location-list' })

-- navigate quickfix and location list
vim.keymap.set('n', '[q', '<cmd>cprev<CR>', { desc = 'Previous [q]uickfix item' })
vim.keymap.set('n', ']q', '<cmd>cnext<CR>', { desc = 'Next [q]uickfix item' })
vim.keymap.set('n', '[l', '<cmd>lprev<CR>', { desc = 'Previous [l]ocation-list item' })
vim.keymap.set('n', ']l', '<cmd>lnext<CR>', { desc = 'Next [l]ocation-list item' })

vim.keymap.set('n', '<leader>~', '<cmd>cd %:h<cr>', { desc = 'Change working directory to current file' })
-- Escape in terminal sends escape sequence
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

vim.keymap.set('n', '<leader><tab>', '<cmd>b#<CR>', { desc = 'Previous buffer' })

-- custom toggles
vim.keymap.set('n', '<leader>uv', function()
  if vim.diagnostic.config().virtual_lines then
    vim.diagnostic.config({virtual_lines = false })
  else
    vim.diagnostic.config({virtual_lines = true })
  end
end, { desc = 'Toggle virtual lines' })

vim.keymap.set('n', '<leader>uV', function()
  if vim.diagnostic.config().virtual_text then
    vim.diagnostic.config({virtual_text = false })
  else
    vim.diagnostic.config({virtual_text = true })
  end
end, { desc = 'Toggle virtual text' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- bypass :wq to prevent erroneous exits. Use :x instead
vim.cmd.cnoreabbrev 'wq <nop>'

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- ROS launch files as xml files
local ext_syntax_group = vim.api.nvim_create_augroup('ext_syntax', { clear = true })
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = ext_syntax_group,
  pattern = '*.launch',
  command = 'set filetype=xml',
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

local function custom_plugins()
  local cp = {
  require 'custom.plugins.blink',
  require 'custom.plugins.cmake',
  require 'custom.plugins.conform',
  require 'custom.plugins.diffview',
  require 'custom.plugins.flash',
  require 'custom.plugins.flatten',
  require 'custom.plugins.fzf-lua',
  require 'custom.plugins.gitsigns',
  require 'custom.plugins.lualine',
  require 'custom.plugins.mini',
  require 'custom.plugins.neogit',
  require 'custom.plugins.snacks',
  require 'custom.plugins.terminal',
  require 'custom.plugins.treesitter',
  require 'custom.plugins.whichkey',
  }
  local cs;

  if vim.g.neovide then
    -- TODO: Use a custom neovide theme to differentiate from terminal nvim
    cs = {
      {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
          flavour = 'mocha',
          styles = {
            comments = { },
          }
        },
        init = function()
          vim.cmd.colorscheme 'catppuccin-frappe'

          -- You can configure highlights by doing something like:
          -- vim.cmd.hi 'Comment gui=none'
        end,
      },
    }
    -- cs = {
    -- 'folke/tokyonight.nvim',
    -- priority = 1000, -- Make sure to load this before all the other start plugins.
    -- config = {
    --   transparent = true,
    --  },
    --  init = function()
    --   -- Load the colorscheme here.
    --   -- Like many other themes, this one has different styles, and you could load
    --   -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    --   vim.cmd.colorscheme 'tokyonight-night'
    --   end
    -- }
  else
    cs = require 'custom.plugins.colorscheme'
  end

  table.insert(cp, cs)
  return cp
end

require('lazy').setup({
  custom_plugins()
}, {
  performance = {
    -- keep the default runtimepath/packpath entries so that plugins
    -- installed with vim.pack (Neovim 0.13+) can still be loaded
    reset_packpath = false,
    rtp = {
      reset = false,
    },
  },
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- LSP is set up with vim.pack (Neovim 0.13+) instead of lazy.nvim.
-- Must be required after lazy.setup so that blink.cmp (managed by lazy) is
-- loaded and its capabilities are available.
require 'custom.plugins.lsp'
require 'custom.plugins.pack' -- vim-sleuth, kdl.vim, todo-comments (vim.pack)

-- Trigger checktime to reload a file when switching back to a buffer or regaining focus
-- i.e. When closing a ToggleTerm terminal
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "TermClose", "TermLeave" }, {
    group = vim.api.nvim_create_augroup("ReloadOnTermClose", { clear = true }),
    callback = function()
        if vim.o.buftype ~= 'terminal' then
            vim.cmd('checktime')
        end
    end,
})

-- Configure OSC 52 for the '+' and '*' registers over SSH
if vim.env.SSH_TTY then
  vim.opt.clipboard = ""
  vim.g.clipboard = {
    name = 'OSC 52',
    copy = {
      ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
      ['*'] = require('vim.ui.clipboard.osc52').copy('*'),
    },
    paste = {
      ['+'] = require('vim.ui.clipboard.osc52').paste('+'),
      ['*'] = require('vim.ui.clipboard.osc52').paste('*'),
    },
  }

  -- Automatically mirror all yanks to the '+' register (OSC 52)
  vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('Osc52Copy', { clear = true }),
    callback = function()
      if vim.v.event.operator == 'y' then
        vim.fn.setreg('+', vim.fn.getreg('"'))
      end
    end,
  })
else
  vim.opt.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim.
end


-- vim: ts=2 sts=2 sw=2 et
