local M = {'kyazdani42/nvim-web-devicons'}

function M.config()
	require('nvim-web-devicons').setup({
		default = true,
		override = {
			default_icon = {
				icon = "",
				color = "#6d8086",
				name = "Default",
			},
		},
	})
end

return M