local utils = require('utils')

local cmd = vim.cmd
local g = vim.g
local o = vim.o

local indent = 2

g.mapleader = ','

cmd 'set encoding=UTF-8'
cmd 'filetype plugin indent on'
-- utils.opt('o', 't_Co', '256')

cmd 'let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"'
cmd 'let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"'
utils.opt('o', 'termguicolors', true)

cmd 'syntax on'
cmd 'syntax enable'
cmd 'set cursorline'

utils.opt('b', 'expandtab', true)
utils.opt('b', 'shiftwidth', indent)
utils.opt('b', 'smartindent', true)
utils.opt('b', 'tabstop', indent)

utils.opt('o', 'showmode', false)
utils.opt('o', 'laststatus', 2)
utils.opt('o', 'showtabline', 2)
utils.opt('o', 'pumheight', 10)
utils.opt('o', 'title', true)
utils.opt('o', 'shortmess', 'atc')
utils.opt('o', 'diffopt', table.concat({
  o.diffopt,
  'algorithm:patience',
  'indent-heuristic',
  'iwhiteall',
  'hiddenoff',
}, ','))
utils.opt('o', 'mouse', 'a')
utils.opt('o', 'hidden', true)
utils.opt('o', 'scrolloff', 12)
utils.opt('o', 'shiftround', true)
utils.opt('o', 'splitright', true)
utils.opt('o', 'splitbelow', true)
utils.opt('o', 'wildmode', 'list:longest')
-- utils.opt('o', 'listchars', table.concat({'tab:⇥ ', 'eol:↴', 'trail:␣', 'space:·'}, ','))
utils.opt('o', 'completeopt', 'menuone,noinsert,noselect')
utils.opt('o', 'clipboard', 'unnamed,unnamedplus')

utils.opt('o', 'hlsearch', true)
utils.opt('o', 'incsearch', true)
utils.opt('o', 'inccommand', 'split')
utils.opt('o', 'ignorecase', true)
utils.opt('o', 'smartcase', true)
utils.opt('o', 'wrap', false)
cmd('set nowrap')

utils.opt('w', 'number', true)
utils.opt('w', 'relativenumber', true)
utils.opt('w', 'signcolumn', 'yes:1')
utils.opt('w', 'colorcolumn', '100')
utils.opt('w', 'list', true)

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