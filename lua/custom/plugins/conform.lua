return { -- Autoformat
  'stevearc/conform.nvim',
  config = function()
    ---@diagnostic disable-next-line: inject-field
    vim.g.disable_autoformat = true
    require('conform').setup {
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat then
          return
        end
        return {
          timeout_ms = 500,
          lsp_fallback = true,
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        rust = { 'rustfmt' },
        -- Conform can also run multiple formatters sequentially
        python = { 'ruff_format' },
        json = { 'jq' },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
    }

    vim.api.nvim_create_user_command('FormatDisable', function(args)
      vim.g.disable_autoformat = true
    end, {
      desc = 'Disable autoformat-on-save',
      bang = true,
    })
    vim.api.nvim_create_user_command('FormatEnable', function(args)
      vim.g.disable_autoformat = false
    end, {
      desc = 'Re-enable autoformat-on-save',
    })
    vim.api.nvim_create_user_command('FormatToggle', function()
      ---@diagnostic disable-next-line: inject-field
      vim.g.disable_autoformat = not vim.g.disable_autoformat
      if vim.g.disable_autoformat then
        print 'Formatting disabled'
      else
        print 'Formatting enabled'
      end
    end, {
      desc = 'Toggle global formatting setting',
    })

    vim.keymap.set('n', '<leader>F', '<cmd>:FormatToggle<cr>', { desc = 'Toggle format' })
  end,
}
