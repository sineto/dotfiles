local M = {'itchyny/lightline.vim'}

M.requires = {
  {'ryanoasis/vim-devicons'},
  {'tpope/vim-fugitive'},
  require('specs.gitgutter'),
  {'sineto/lightline-hunks'},
  {'f-person/git-blame.nvim'}
}

M.config = function()
  vim.g.gitblame_date_format = '%x'

  vim.cmd ([[
    function! DeviconsFiletype()
      return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'Plain Text') : ''
    endfunction

    function! TabNum(n) abort
      return a:n." \ue0bb"
    endfunction
  ]])

	-- TODO: fix section delimiters
  vim.g.lightline = {
    -- 
    separator = { left = '', right = '' },
    subseparator = { left = '', right = '' },
    enable = {
			statusline = true,
			tabline = false,
		},
    active = {
      left = {
        {'mode', 'paste'},
        {'githunks', 'readonly', 'filename', 'modified'}
      },
      right = {
        {'lineinfo'},
        {'percent'},
        {'fileencoding', 'devicons_filetype'}
      }
    },
    inactive = {
      left = { { 'filename' , 'modified', 'fileformat', 'devicons_filetype' } },
    },
    component_function = {
      githunks = 'lightline#hunks#composer',
      devicons_filetype = 'DeviconsFiletype',
    },
    component = {
      lineinfo = '並%3l:%-2v',
      readonly = '%{&readonly?" RO":""}',
      close = '%{has("nvim") ? " NVIM " : " VIM "}',
      vim_logo = ''
    }
  }
end

return M