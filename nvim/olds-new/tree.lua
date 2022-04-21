local M = {'kyazdani42/nvim-tree.lua'}

M.requires = {
	require('specs.webdevicons')
}

M.config = function()
	-- local tree_cb = require('nvim-tree.config').nvim_tree_callback

	vim.g.nvim_tree_ignore = { '.git', 'node_modules', 'dist', 'Session.vim', '.undodir' }
	vim.g.nvim_tree_highlight_opened_files = 1
	vim.g.nvim_tree_follow = 1
	vim.g.nvim_tree_indent_markers = 1
	vim.g.nvim_tree_add_trailing = 1
	vim.g.nvim_tree_show_icons = {
		folders = 1,
		files = 1,
		git = 0
	}

	vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    folder = {
      default = "",
      open = "",
      empty = "",
      empty_open = "",
      symlink = "",
      symlink_open = "",
    }
  }

	-- vim.g.nvim_tree_bindings = {
	-- 	["l"] = tree_cb("edit"),
	-- 	["h"] = tree_cb("edit")
	-- }

	require('utils').map('n', '<A-e>', '<cmd>NvimTreeToggle<cr>')

	vim.cmd([[autocmd BufEnter NvimTree setlocal cursorline]])

	require('utils').map_leader_keys({
		ef = '<cmd>NvimTreeFindFile<cr>',
		er = '<cmd>NvimTreeRefresh<cr>',
		et = '<cmd>NvimTreeToggle<cr>',
	})
end

return M