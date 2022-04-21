local M = {'airblade/vim-gitgutter'}

M.requires = {
}

M.config = function()
  vim.cmd ([[
    set updatetime=100
  ]])

  vim.g.gitgutter_sign_column_always = 1
  vim.g.gitgutter_sign_added = '┃'
  vim.g.gitgutter_sign_modified = '┃'
  vim.g.gitgutter_sign_removed = ''
  vim.g.gitgutter_sign_modified_removed = ''
  vim.g.gitgutter_sign_removed_first_line = ''
end

return M