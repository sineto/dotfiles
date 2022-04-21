local M = {'hrsh7th/nvim-compe'}

M.requires = {
  require('specs.vsnip'),
  -- {'ray-x/lsp_signature.nvim'},
}

M.setup = function()
  vim.o.completeopt = table.concat({'menu', 'menuone', 'noselect'}, ',')

  local map_opts = {silent = true, expr = true}
  local set_keymap = vim.api.nvim_set_keymap

  set_keymap('i', '<C-Space>', 'compe#complete()', map_opts)
  set_keymap('i', '<CR>',      'compe#confirm("<CR>")', map_opts)
  set_keymap('i', '<C-e>',     'compe#close("<C-e">)', map_opts)
  set_keymap('i', '<C-e>',     'compe#scroll({ "delta": +4 })', map_opts)
  set_keymap('i', '<C-e>',     'compe#scroll({ "delta": -4 })', map_opts)
end

M.config = function()
  require('compe').setup({
    preselect = 'always',
    source = {
      buffer   = { priority = 0 },
      path     = { priority = 1 },
      nvim_lsp = { priority = 2 },
      vsnip    = { priority = 3 },
      nvim_lua = true
    }
  })
end

return M
