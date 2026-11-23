-- CMake integration (vim.pack)

vim.pack.add {
  'https://github.com/Civitasv/cmake-tools.nvim',
  'https://github.com/nvim-lua/plenary.nvim', -- dependency
  -- dependency of the 'toggleterm' executor below: cmake-tools checks for it
  -- with pcall(require, 'toggleterm') at setup time, so it must already be
  -- on the runtimepath (terminal.lua sets it up afterwards)
  'https://github.com/akinsho/toggleterm.nvim',
}

require('cmake-tools').setup {
  cmake_executor = {
    name = 'toggleterm',
  },
}
