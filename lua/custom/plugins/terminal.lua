return {
  "akinsho/toggleterm.nvim",
  keys = [[<C-\>]],
  config = function()
    local toggleterm = require "toggleterm"
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
