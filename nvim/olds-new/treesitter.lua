local M = {'nvim-treesitter/nvim-treesitter'}

-- M.requires = {
--   {'tree-sitter/tree-sitter-typescript'}
-- }

M.config = function()
  -- TODO: implement treesitter compatibility with my monokai colorscheme for:
  -- ts, tsx, js, jsx, go, json, jsonc, toml, yaml, bash, html, scss

  require('nvim-treesitter.configs').setup({
    ensure_installed = 'all',
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  })

  vim.wo.foldmethod = 'expr'
  vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'

  vim.api.nvim_exec([[
    augroup tree-sitter
      autocmd!
      autocmd BufEnter * setlocal foldmethod=expr foldexpr=nvim_treesitter#foldexpr() foldlevel=99
      autocmd BufEnter *.toml setfiletype toml
      autocmd TermOpen * TSBufDisable highlight
    augroup END

  ]], false)
end

M.run = ':TSUpdate'

return M
