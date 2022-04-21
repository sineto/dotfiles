local M = {'karb94/neoscroll.nvim'}

M.config = function()
  require('neoscroll').setup({
    hide_cursor = false,
  })
end

return M