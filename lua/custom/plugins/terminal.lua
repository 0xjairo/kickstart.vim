return {
  "akinsho/toggleterm.nvim",
  keys = [[<C-\>]],
  config = function()
    local toggleterm = require "toggleterm"


    -- close term on q
    vim.api.nvim_create_autocmd('TermOpen', {
      desc = 'Close term with q when in normal mode',
      group = vim.api.nvim_create_augroup('ToggleTerm-q', { clear = true }),
      pattern='term://*toggleterm#*',
      callback = function()
        vim.keymap.set('n', 'q', [[<cmd>:ToggleTerm<CR>]], {buffer=0})
      end,
    })

    toggleterm.setup(
    {
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<c-\>]],
      direction = "float",
      hide_numbers = true,
      insert_mappings = false,
      terminal_mappings = true,
      close_on_exit = false,
    })

  end,
}
