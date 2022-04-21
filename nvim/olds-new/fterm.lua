local M = {'numtostr/FTerm.nvim'}

M.config = function()
  require('FTerm').setup({
    dimensions  = {
      height = 0.8,
      width = 0.8,
      x = 0.5,
      y = 0.5
    },
    border = 'single'
  })

  local utils = require('utils')
  local opts = {noremap=true, silent=true}
  utils.map('n', "<A-i>", '<cmd>lua require("FTerm").toggle()<cr>', opts)
  utils.map('t', "<A-i>", '<C-\\><C-n><cmd>lua require("FTerm").toggle()<cr>', opts)
end

return M