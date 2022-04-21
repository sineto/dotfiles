local M = {'preservim/nerdtree'}

M.requires = {
  {'tiagofumo/vim-nerdtree-syntax-highlight'},
  {'ryanoasis/vim-devicons'}
}

M.config = function()
  local utils = require('utils')
  local map_opts =  {silent = true, noremap = true}
  utils.map('n', '<A-e>', '<cmd>NERDTreeToggle<cr>', map_opts)

  vim.g.NERDTreeMinimalUI = 1
  vim.g.NERDTreeMinimalMenu = 1
  vim.g.NERDTreeMouseMode = 2
  vim.g.NERDTreeCascadeSingleChildDir = 0
  vim.g.NERDTreeIgnore = { 'node_modules' }

  vim.g.NERDTreeDirArrowExpandable = ''
  vim.g.NERDTreeDirArrowCollapsible = ''

  vim.api.nvim_exec([[
    autocmd ColorScheme * highlight NERDTreeNormal guibg=#221F22
    autocmd FileType nerdtree setlocal winhighlight=Normal:NERDTreeNormal
  ]], false)
end

return M