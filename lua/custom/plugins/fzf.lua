return {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    {
      "junegunn/fzf", build = "./install --bin"
    }
  },
  config = function()
    -- calling `setup` is optional for customization
    require('fzf-lua').setup {}
  end,
  cmd = "FzfLua",
  -- stylua: ignore
  keys = {
    { "<c-p>",            mode = { "n" }, function() require('fzf-lua').files() end,                                  desc = "fzf files" },
    { '<leader><leader>', mode = { 'n' }, function() require('fzf-lua').buffers() end,                                desc = '[ ] Find existing buffers' },
    { '<leader>s.',       mode = { 'n' }, function() require('fzf-lua').grep_curbuf() end,                            desc = '[S]earch Current Buffer' },
    { '<leader>sd',       mode = { 'n' }, function() require('fzf-lua').diagnostics_workspace() end,                  desc = '[S]earch [D]iagnostics' },
    { '<leader>sf',       mode = { 'n' }, function() require('fzf-lua').oldfiles() end,                               desc = '[S]earch Recent [F]iles' },
    { '<leader>sg',       mode = { "n" }, function() require('fzf-lua').live_grep() end,                              desc = "fzf grep" },
    { '<leader>sh',       mode = { 'n' }, function() require('fzf-lua').helptags() end,                               desc = '[S]earch [H]elp' },
    { '<leader>sk',       mode = { 'n' }, function() require('fzf-lua').keymaps() end,                                desc = '[S]earch [K]eymaps' },
    { '<leader>sn',       mode = { 'n' }, function() require('fzf-lua').files({ cwd = vim.fn.stdpath 'config' }) end, desc = '[S]earch [N]eovim files' },
    { '<leader>sr',       mode = { 'n' }, function() require('fzf-lua').resume() end,                                 desc = '[S]earch [R]esume' },
    { '<leader>ss',       mode = { 'n' }, function() require('fzf-lua').builtin() end,                                desc = '[S]earch [S]elect FZF' },
    { '<leader>sw',       mode = { 'n' }, function() require('fzf-lua').grep_cword() end,                             desc = '[S]earch current [W]ord' },
  },
}
