return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main", -- Ensure you are on main, not master
  build = ":TSUpdate",
  config = function()
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
  end

}
