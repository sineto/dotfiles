
local M = {'kyazdani42/nvim-tree.lua'}

M.requires = {
  require('specs.webdevicons'),
	'justinmk/vim-gtfo'
}

M.config = function()
	local g = vim.g
	local tree_cb = require('nvim-tree.config').nvim_tree_callback

	g.nvim_tree_side = "left"
  g.nvim_tree_width = 25
	g.nvim_tree_gitignore = 1
	g.nvim_tree_ignore = { '.git', 'node_modules', 'dist', 'Session.vim', '.undodir' }
	g.nvim_tree_auto_ignore_ft = { 'dashboard' }
	g.nvim_tree_auto_open = 0
	g.nvim_tree_auto_close = 0 -- closes tree when it's the last window
	g.nvim_tree_quit_on_open = 0 -- closes tree when file's opened
	g.nvim_tree_follow = 1
	g.nvim_tree_indent_markers = 1
	g.nvim_tree_hide_dotfiles = 0
	g.nvim_tree_git_hl = 1
	g.nvim_tree_highlight_opened_files = 0
	g.nvim_tree_root_folder_modifier = ":t"
	g.nvim_tree_tab_open = 0
	g.nvim_tree_allow_resize = 1
	g.nvim_tree_add_trailing = 0 -- append a trailing slash to folder names
	g.nvim_tree_disable_netrw = 1
	g.nvim_tree_hijack_netrw = 0
	g.nvim_tree_update_cwd = 1
	g.nvim_tree_show_icons = {
		folders = 1,
		files = 1,
		git = 0
	}

	g.nvim_tree_icons = {
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

	function NvimTreeOSOpen()
		local lib = require "nvim-tree.lib"
		local node = lib.get_node_at_cursor()
		if node then
			vim.fn.jobstart("open '" .. node.absolute_path .. "' &", {detach = true})
		end
	end

	g.nvim_tree_bindings = {
		{key = {"<CR>", "o", "<2-LeftMouse>", "l", "h"}, cb = tree_cb("edit")},
		{key = {"<2-RightMouse>", "<C-}>"}, cb = tree_cb("cd")},
		{key = "<C-v>", cb = tree_cb("vsplit")},
		{key = "<C-x>", cb = tree_cb("split")},
		{key = "<C-t>", cb = tree_cb("tabnew")},
		{key = "<", cb = tree_cb("prev_sibling")},
		{key = ">", cb = tree_cb("next_sibling")},
		{key = "P", cb = tree_cb("parent_node")},
		{key = "<BS>", cb = tree_cb("close_node")},
		{key = "<S-CR>", cb = tree_cb("close_node")},
		{key = "<Tab>", cb = tree_cb("preview")},
		{key = "K", cb = tree_cb("first_sibling")},
		{key = "J", cb = tree_cb("last_sibling")},
		{key = "I", cb = tree_cb("toggle_ignored")},
		{key = "H", cb = tree_cb("toggle_dotfiles")},
		{key = "R", cb = tree_cb("refresh")},
		{key = "a", cb = tree_cb("create")},
		{key = "d", cb = tree_cb("remove")},
		{key = "r", cb = tree_cb("rename")},
		{key = "<C->", cb = tree_cb("full_rename")},
		{key = "x", cb = tree_cb("cut")},
		{key = "c", cb = tree_cb("copy")},
		{key = "p", cb = tree_cb("paste")},
		{key = "y", cb = tree_cb("copy_name")},
		{key = "Y", cb = tree_cb("copy_path")},
		{key = "gy", cb = tree_cb("copy_absolute_path")},
		{key = "[c", cb = tree_cb("prev_git_item")},
		{key = "}c", cb = tree_cb("next_git_item")},
		{key = "-", cb = tree_cb("dir_up")},
		{key = "q", cb = tree_cb("close")},
		{key = "g?", cb = tree_cb("toggle_help")}
	}

	MUtils = {}
	MUtils.toggle_nvimtree = function()
		local open = function()
			require'bufferline.state'.set_offset(26)
			require'nvim-tree'.toggle()
		end

		local close = function()
			require'bufferline.state'.set_offset(0)
			require'nvim-tree'.close()
		end

		local view = require 'nvim-tree.view'
		local lib = require 'nvim-tree.lib'

		if view.win_open() then
			close()
		else
			if vim.g.nvim_tree_follow == 1 then
				open()
			else
				lib.open()
			end
		end
	end

	MUtils.nvimtree_osopen = function()
		local lib = require "nvim-tree.lib"
		local node = lib.get_node_at_cursor()
		if node then
			vim.fn.jobstart("open '" .. node.absolute_path .. "' &", {detach = true})
		end
	end

	MUtils.update_nvimtree_statusline = function()
		local bufnr = vim.api.nvim_get_current_buf()
		if vim.api.nvim_buf_get_option(bufnr, 'ft') == 'NvimTree' then return ' ' end
	end

	vim.api.nvim_exec([[
		au BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == "NvimTree" | set laststatus=0 | else | set laststatus=2 | endif
	]], false)

	require('main.utils').map('n', '<A-b>', '<cmd>lua MUtils.toggle_nvimtree()<cr>')
	require('main.utils').map('n', '<A-o>', '<cmd>lua MUtils.nvimtree_osopen()<cr>')
	require('main.utils').map_leader_keys({
		ef = '<cmd>NvimTreeFindFile<cr>',
		er = '<cmd>NvimTreeRefresh<cr>',
		et = '<cmd>lua MUtils.toggle_nvimtree()<cr>',
	})


end

return M