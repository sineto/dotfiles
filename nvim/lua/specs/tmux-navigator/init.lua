local M = {'christoomey/vim-tmux-navigator'}

M.requires = {
}

M.config = function()
  vim.g.tmux_navigator_disable_when_zoomed = 1
end

return M