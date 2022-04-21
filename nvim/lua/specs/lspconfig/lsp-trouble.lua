local M = {'folke/trouble.nvim'}

M.requires = {
  require('specs.webdevicons')
}

M.config = function()
  require('trouble').setup {}
end

return M