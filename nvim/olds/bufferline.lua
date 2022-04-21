local M = {'akinsho/nvim-bufferline.lua'}

M.requires = {
	{'kyazdani42/nvim-web-devicons'},
}

M.config = function()
	-- TODO: fix section delimiters
	require('bufferline').setup({
		options = {
			diagnostics = 'nvim_lsp',
			show_buffer_close_icons = true,
		},
	})
end

return M