local M = {'hrsh7th/nvim-compe'}

M.requires = {
  require('specs.vsnip'),
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
      buffer   = { kind = "﬘", priority = 0 },
      path     = { priority = 1 },
      nvim_lsp = { priority = 2 },
      vsnip    = { kind = "﬌", priority = 3 },
      nvim_lua = true
    }
  })

  -- Use Saga to show signature help
  vim.cmd [[autocmd User CompeConfirmDone :Lspsaga signature_help]]

  -- Add basic snippet support when language server does not
  -- Replaces: https://github.com/windwp/nvim-autopairs#using-nvim-compe
  -- Ref: https://github.com/hrsh7th/nvim-compe/issues/302
  local Helper = require('compe.helper')
  Helper.convert_lsp_orig = Helper.convert_lsp
  Helper.convert_lsp = function(args)
    local response = args.response or {}
    local items = response.items or response
    for _, item in ipairs(items) do
      if item.insertText == nil and (item.kind == 2 or item.kind == 3 or item.kind == 4) then
        item.insertText = item.label .. '(${1})'
        item.insertTextFormat = 2
      end
    end
    return Helper.convert_lsp_orig(args)
  end
end

return M