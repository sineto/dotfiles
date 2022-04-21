local utils = require('utils')

local cmd = vim.cmd

cmd ':cnoreabbrev W! w!'
cmd ':cnoreabbrev Q! q!'
cmd ':cnoreabbrev Qall! qall!'
cmd ':cnoreabbrev Qall! qall!'
cmd ':cnoreabbrev Wa wa'
cmd ':cnoreabbrev WQ wq'
cmd ':cnoreabbrev Wq wq'
cmd ':cnoreabbrev wQ wq'
cmd ':cnoreabbrev Wqa wqa'
cmd ':cnoreabbrev W w'
cmd ':cnoreabbrev X x'
cmd ':cnoreabbrev Q q'

utils.map('', '<Down>', '<nop>')
utils.map('', '<Up>', '<nop>')
utils.map('', '<Left>', '<nop>')
utils.map('', '<Right>', '<nop>')
utils.map('v', '<Down>', '<nop>')
utils.map('v', '<Up>', '<nop>')
utils.map('v', '<Left>', '<nop>')
utils.map('v', '<Right>', '<nop>')

-- Copy to clipboard in normal, visual, select and operator modes
utils.map('n', 'YY', '"+y')
utils.map('n', 'XX', '"+x')

utils.map('n', '°', '<cmd>nohlsearch<cr>') -- disable hlsearch
utils.map('n', '<leader>o', 'm`o<Esc>``')  -- insert newline below in normal mode
utils.map('n', '<leader>O', 'm`O<Esc>``')  -- insert newline above in normal mode
utils.map('v', '<', '<gv')
utils.map('v', '>', '>gv')
utils.map('n', 'H', '^')
utils.map('n', 'L', '$')
utils.map('n', '<leader>vs', '<cmd>vsplit<cr>', {silent=true,noremap=true})
utils.map('n', '<leader>hs', '<cmd>split<cr>', {silent=true,noremap=true})
utils.map('n', '<leader>ws', '<cmd>ToggleWorkspace<cr>', {silent=true,noremap=true})

-- utils.map('', '<A-w>', '<cmd>Bdelete<cr>', {silent = true})
-- utils.map('n', '<A-a>', '<cmd>bprev<cr>', {silent = true})
-- utils.map('n', '<A-s>', '<cmd>bnext<cr>', {silent = true})

cmd([[
  nmap <silent> <A-/> :Commentary<cr>
  vmap <silent> <A-/> :Commentary<cr>
  noremap       <C-e> :NvimTreeToggle<cr>
]])
