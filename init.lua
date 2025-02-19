if vim.g.neovide then
  vim.o.guifont = 'FiraCode NF:h9' -- text below applies for VimScript
  vim.g.neovide_cursor_animation_length = 0.05
  vim.g.neovide_cursor_trail_size = 0.1
end

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
vim.opt.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim.
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

-- Diagnostic keymaps
vim.keymap.set('n', ']e', function()
  vim.diagnostic.goto_next { severity = vim.diagnostic.severity.ERROR }
end, { desc = 'Go to next error' })
vim.keymap.set('n', '[e', function()
  vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.ERROR }
end, { desc = 'Go to previous error' })
vim.keymap.set('n', ']w', function()
  vim.diagnostic.goto_next { severity = vim.diagnostic.severity.WARN }
end, { desc = 'Go to next warning' })
vim.keymap.set('n', '[w', function()
  vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.WARN }
end, { desc = 'Go to previous warning' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
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

require('lazy').setup({
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = true },
    keys = {
      { "<leader>st", function() Snacks.picker.todo_comments() end, desc = "Todo" },
      { "<leader>sT", function () Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "Todo/Fix/Fixme" },
    },
  },

  -- configuration language (as in yaml or  xml)
  { 'imsnif/kdl.vim' },

  -- { import = 'custom.plugins' },
  require 'custom.plugins.blink',
  require 'custom.plugins.colorscheme',
  require 'custom.plugins.conform',
  require 'custom.plugins.diffview',
  require 'custom.plugins.flash',
  require 'custom.plugins.flatten',
  require 'custom.plugins.gitsigns',
  require 'custom.plugins.lsp',
  require 'custom.plugins.mini',
  require 'custom.plugins.snacks',
  require 'custom.plugins.terminal',
  require 'custom.plugins.treesitter',
  require 'custom.plugins.whichkey',
}, {
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

-- vim: ts=2 sts=2 sw=2 et
