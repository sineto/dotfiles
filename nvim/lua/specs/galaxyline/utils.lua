local M = {}

M.hi_vi_mode = function(color)
	local cmd_str = string.format('hi GalaxyViMode guifg=%s', color)

	vim.cmd(cmd_str)
end

function M.add_component(section, ...)
	for i, value in ipairs(...) do
		section[i] = value
	end
end

return M