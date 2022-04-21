local M = {'tpope/vim-commentary'}

M.after = 'nvim-treesitter'

M.requires = {
  {'JoosepAlviste/nvim-ts-context-commentstring'}
}

M.config = function()
end

return M