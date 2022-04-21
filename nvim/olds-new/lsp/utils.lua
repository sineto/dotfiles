local M = {}

local is_disabled = os.getenv('NVIM_DISABLE_LSP')
function M.is_enabled()
	return not is_disabled
end

return M