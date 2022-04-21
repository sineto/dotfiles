local M = {'junegunn/fzf.vim'}

M.requires = {
  {'junegunn/fzf'},
}

M.cond = function()
	return vim.fn.executable('fzf') == 1
end

M.setup = function()
  vim.g.fzf_layout = {
    up = '~45%',
  }

  require('main.utils').map('n', '<C-p>', '<cmd>Files<cr>')
  require('main.utils').map('n', '<C-b>', '<cmd>Buffers<cr>')

  require('main.utils').map_leader_keys({
    fa = '<cmd>Ag<cr>',
    fr = '<cmd>Rg<cr>',
  })
end

return M