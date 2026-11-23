-- LSP setup using vim.pack (Neovim 0.13+).
-- blink.cmp is set up in lua/custom/plugins/blink.lua, which must be
-- required before this module (see init.lua) so its capabilities are
-- available.

vim.pack.add {
  'https://github.com/neovim/nvim-lspconfig', -- default configs used by vim.lsp.config
  'https://github.com/williamboman/mason.nvim', -- installs LSPs and tools to stdpath
  'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
  'https://github.com/b0o/schemastore.nvim', -- for jsonls schemas
  'https://github.com/j-hui/fidget.nvim', -- useful status updates for LSP
  'https://github.com/folke/lazydev.nvim', -- lua_ls setup for neovim config/plugins
}

require('mason').setup()
require('fidget').setup {}
require('lazydev').setup {}

--  This function gets run when an LSP attaches to a particular buffer.
--    That is to say, every time a new file is opened that is associated with
--    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
--    function will be executed to configure the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
  callback = function(event)
    -- NOTE: Remember that Lua is a real programming language, and as such it is possible
    -- to define small helper and utility functions so you don't have to repeat yourself.
    --
    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local map = function(keys, func, desc)
      vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    -- Rename the variable under your cursor.
    --  Most Language Servers support renaming across files, etc.
    map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

    -- Execute a code action, usually your cursor needs to be on top of an error
    -- or a suggestion from your LSP for this to activate.
    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    -- Opens a popup that displays documentation about the word under your cursor
    --  See `:help K` for why this keymap.
    map('K', vim.lsp.buf.hover, 'Hover Documentation')

    map('<M-k>', vim.lsp.buf.signature_help, 'Show signature help')

    -- WARN: This is not Goto Definition, this is Goto Declaration.
    --  For example, in C this would take you to the header.
    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

    -- The following two autocommands are used to highlight references of the
    -- word under your cursor when your cursor rests there for a little while.
    --    See `:help CursorHold` for information about when this is executed
    --
    -- When you move your cursor, the highlights will be cleared (the second autocommand).
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.server_capabilities.documentHighlightProvider then
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})

-- See `:help lspconfig-all` for a list of all the pre-configured LSPs
local servers = {
  bashls = {}, -- bash
  neocmake = {},
  biome = {}, -- javascript
  clangd = {}, -- c/c++
  jsonls = {
    settings = {
      json = {
        schemas = require('schemastore').json.schemas(),
        validate = { enable = true },
      },
    },
  },
  lua_ls = {
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
        workspace = {
          checkThirdParty = 'Disable',
        },
        -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
        diagnostics = { disable = { 'missing-fields' } },
      },
    },
  },
  pyright = {}, -- Python
  tinymist = {
    settings = {
      formatterMode = 'typstyle',
      exportPdf = 'onType',
      semanticTokens = 'disable',
    },
  }, -- typst
  ruff = {}, -- Python
  rust_analyzer = {}, -- rust
  ts_ls = {}, -- javascript/typescript/react
}

-- Packages to install with mason. These are MASON package names, not
-- lspconfig server names (no mason-lspconfig to translate them), and include
-- tools that are not LSP servers (stylua).
require('mason-tool-installer').setup {
  ensure_installed = {
    'bash-language-server', -- bashls
    'neocmakelsp', -- neocmake
    'biome',
    'clangd',
    'json-lsp', -- jsonls
    'lua-language-server', -- lua_ls
    'pyright',
    'tinymist',
    'ruff',
    'rust-analyzer', -- rust_analyzer
    'typescript-language-server', -- ts_ls
    'stylua', -- formatter, not an LSP server
  },
}

-- blink.cmp capabilities for all servers
vim.lsp.config('*', {
  capabilities = require('blink.cmp').get_lsp_capabilities(),
})

-- Per-server config overrides (merged on top of nvim-lspconfig defaults)
for name, config in pairs(servers) do
  vim.lsp.config(name, config)
end
vim.lsp.enable(vim.tbl_keys(servers))
