-- Helper for plugins installed with vim.pack while lazy.nvim is still around.
-- lazy.nvim sets 'loadplugins' to false and sources plugin scripts itself,
-- but only for plugins it manages. vim.pack plugins get added to 'runtimepath'
-- via :packadd, yet their plugin/ scripts are never sourced. Source them here.
local M = {}

--- Source plugin/**/*.{vim,lua} for the given vim.pack plugin names.
---@param names string[]
function M.source_plugin_scripts(names)
  for _, name in ipairs(names) do
    local plug = vim.pack.get({ name })[1]
    if plug and plug.active then
      for _, file in ipairs(vim.fn.globpath(plug.path, 'plugin/**/*.{vim,lua}', true, true)) do
        vim.cmd.source(vim.fn.fnameescape(file))
      end
    end
  end
end

return M
