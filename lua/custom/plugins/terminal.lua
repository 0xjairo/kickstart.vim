-- Floating/split terminals (vim.pack). The open_mapping (<C-\>) is
-- registered by toggleterm's setup itself.

vim.pack.add { 'https://github.com/akinsho/toggleterm.nvim' }

require('toggleterm').setup {
  size = function(term)
    if term.direction == 'horizontal' then
      return 15
    elseif term.direction == 'vertical' then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-\>]],
  direction = 'float',
  hide_numbers = true,
  insert_mappings = false,
  terminal_mappings = true,
  close_on_exit = false,
}
