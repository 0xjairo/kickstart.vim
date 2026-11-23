-- Treesitter (vim.pack)

-- Rebuild parsers after nvim-treesitter is installed or updated
-- (replaces lazy.nvim's `build = ':TSUpdate'`)
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    if ev.data.spec.name == 'nvim-treesitter' and (ev.data.kind == 'install' or ev.data.kind == 'update') then
      -- deferred: :TSUpdate does not exist yet while the plugin is being installed
      vim.schedule(function()
        pcall(vim.cmd, 'TSUpdate')
      end)
    end
  end,
})

vim.pack.add {
  { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = 'main' }, -- main, not master
}

-- DO NOT call require('nvim-treesitter.configs').setup() here!
-- Highlighting and indentation are already handled natively.
--
--
-- Define the languages you frequently use
-- local parsers = { 'bash', 'c', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc', 'python', 'cmake' }

-- -- Track and run the asynchronous installer
-- local ts = require("nvim-treesitter")
-- ts.install(parsers)
--
-- -- Ensure the native Tree-sitter engine attaches to these filetypes
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = parsers,
--   callback = function()
--     vim.treesitter.start()
--   end,
-- })
