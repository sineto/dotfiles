local M = {'glepnir/lspsaga.nvim'} -- plugin name

-- Specifies code to run after this plugin is loaded.
M.config = function()
  local saga = require('lspsaga')
  saga.init_lsp_saga({
    use_saga_diagnostic_sign = false
  })

  vim.cmd([[
    nnoremap <silent><leader>cc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<cr>
    nnoremap <silent><leader>gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<cr>
  ]])
end


return M