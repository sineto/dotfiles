local settings = {}

function settings.setup()
  local opt = require('main.utils').opt
  local cmd = vim.cmd
  local g = vim.g
  local o = vim.o

  local indent = 2
  g.mapleader = ','

  cmd 'set encoding=UTF-8'
  cmd 'filetype plugin indent on'

  cmd 'let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"'
  cmd 'let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"'
  opt('o', 'termguicolors', true)

  cmd 'syntax on'
  cmd 'syntax enable'
  cmd 'set cursorline'

  opt('b', 'expandtab', true)
  opt('b', 'shiftwidth', indent)
  opt('b', 'smartindent', true)
  opt('b', 'tabstop', indent)

  opt('o', 'showmode', false)
  opt('o', 'laststatus', 2)
  opt('o', 'showtabline', 2)
  opt('o', 'pumheight', 10)
  opt('o', 'title', true)
  opt('o', 'shortmess', 'atc')
  opt('o', 'diffopt', table.concat({
    o.diffopt,
    'algorithm:patience',
    'indent-heuristic',
    'iwhiteall',
    'hiddenoff',
  }, ','))
  opt('o', 'mouse', 'a')
  opt('o', 'hidden', true)
  opt('o', 'scrolloff', 12)
  opt('o', 'shiftround', true)
  opt('o', 'splitright', true)
  opt('o', 'splitbelow', true)
  opt('o', 'wildmode', 'list:longest')
  opt('o', 'completeopt', 'menuone,noinsert,noselect')
  opt('o', 'clipboard', 'unnamed,unnamedplus')

  opt('o', 'hlsearch', true)
  opt('o', 'incsearch', true)
  opt('o', 'inccommand', 'split')
  opt('o', 'ignorecase', true)
  opt('o', 'smartcase', true)
  opt('o', 'wrap', false)
  cmd('set nowrap')

  opt('w', 'number', true)
  opt('w', 'relativenumber', true)
  opt('w', 'signcolumn', 'yes:1')
  opt('w', 'colorcolumn', '100')
  opt('w', 'list', true)

  cmd([[
    augroup RememberCursorPosition
      autocmd!
      autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
    augroup END
  ]])

  -- Highlight on yank
  cmd('au TextYankPost * lua vim.highlight.on_yank {on_visual = false}')

  -- hot module reload
  -- https://parceljs.org/hmr.html#safe-write
  cmd('set backupcopy=yes')
end

return settings