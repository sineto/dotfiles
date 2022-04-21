local M = {}

function M.get_available_runtimes()
	local existing_runtimes = vim.api.nvim_list_runtime_paths()
	local usable_runtimes = {}

	for _, path in pairs(existing_runtimes) do
		path = string.format('%s/lua/', path)

		if vim.fn.isdirectory(path) then
			usable_runtimes[path] = true
		end
	end

	return usable_runtimes
end

return M