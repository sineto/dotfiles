local M = {'wbthomason/packer.nvim'}

M.config = function()
  -- vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'

  require('utils').map_leader_keys({
		pc = '<cmd>PackerCompile<cr>',
		pi = '<cmd>PackerInstall<cr>',
		pu = '<cmd>PackerUpdate<cr>',
		ps = '<cmd>PackerSync<cr>',
	})

end

return M