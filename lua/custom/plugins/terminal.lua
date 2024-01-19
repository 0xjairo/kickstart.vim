return {
  "akinsho/toggleterm.nvim",
  keys = {"<F4>", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
  opts ={
    open_mapping = "<F4>",
    direction = "horizontal",
    hide_numbers = true,
    insert_mappings = true,
    terminal_mappings = true,
    close_on_exit = false,
    start_in_insert = true,
  },
}
