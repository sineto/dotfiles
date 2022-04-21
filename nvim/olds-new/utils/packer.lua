local packer = {}

local fn = vim.fn
local execute = vim.api.nvim_command

function packer.bootstrap()
	local install_path = string.format('%s/%s',
		fn.stdpath('data'),
		'site/pack/packer/start/packer.nvim'
	)

	if fn.empty(fn.glob(install_path)) > 0 then
		local git_url = 'https://github.com/wbthomason/packer.nvim'
    fn.system({'git', 'clone', git_url, install_path})
		execute 'packadd packer.nvim'
	end
end

return packer