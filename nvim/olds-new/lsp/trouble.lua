local M = {'folke/trouble.nvim'}

M.requires = {
  {'kyazdani42/nvim-web-devicons'}
}

M.config = function()
  require('trouble').setup {}
end

return M