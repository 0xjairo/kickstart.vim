return {
  "ibhagwan/fzf-lua",
  dependencies = { "echasnovski/mini.icons" },
  opts = {},
  keys = {
      -- files
      { "<leader>ff", function() require('fzf-lua').files() end, desc = "Find Files" },
      { "<leader>fr", function() require('fzf-lua').oldfiles() end, desc = "Old (recent) Files" },
      { "<leader>fg", function() require('fzf-lua').git_files({ cwd=vim.fn.expand('%:h:p')  }) end, desc = "Find Git Files" },
      { "<leader>,", function() require('fzf-lua').buffers() end, desc = "Buffers" },
      { "<leader>fc", function() require('fzf-lua').files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },

      -- grep
      { "<leader>/", function() require('fzf-lua').live_grep() end, desc = "Grep" },
      { "<leader>sw", function() require('fzf-lua').grep_cword() end, desc = "Visual selection or word", mode = { "n" } },
      { "<leader>sw", function() require('fzf-lua').grep_visual() end, desc = "Visual selection or word", mode = { "x" } },

      -- diagnostics
      { "<leader>sd", function() require('fzf-lua').diagnostics_document() end, desc = "Diagnostics" },
      { "<leader>sD", function() require('fzf-lua').diagnostics_workspace() end, desc = "Buffer Diagnostics" },

      -- LSP
      { "gd", function() require('fzf-lua').lsp_definitions() end, desc = "Goto Definition" },
      { "gD", function() require('fzf-lua').lsp_declarations() end, desc = "Goto Declaration" },
      { "gr", function() require('fzf-lua').lsp_references() end, nowait = true, desc = "References" },
      { "gI", function() require('fzf-lua').lsp_implementations() end, desc = "Goto Implementation" },
      { "gy", function() require('fzf-lua').lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
      { "<leader>ss", function() require('fzf-lua').lsp_document_symbols() end, desc = "LSP Symbols" },
      { "<leader>sS", function() require('fzf-lua').lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
  }
}
