-- Autocompletion (vim.pack)

-- use a release tag to download pre-built binaries
-- OR build from source, requires nightly rust: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
vim.pack.add {
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('0.*') },
  'https://github.com/rafamadriz/friendly-snippets',
}

---@module 'blink.cmp'
---@type blink.cmp.Config
require('blink.cmp').setup {
  keymap = { preset = 'default' },
  -- fuzzy = { prebuilt_binaries = { force_version = 'v0.7.6' } },

  appearance = {
    -- Sets the fallback highlight groups to nvim-cmp's highlight groups
    -- Useful for when your theme doesn't support blink.cmp
    -- will be removed in a future release
    use_nvim_cmp_as_default = true,
    -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    -- Adjusts spacing to ensure icons are aligned
    nerd_font_variant = 'mono',
  },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
  -- optionally disable cmdline completions
  cmdline = { enabled = false },

  -- experimental signature help support
  signature = { enabled = true },
}
