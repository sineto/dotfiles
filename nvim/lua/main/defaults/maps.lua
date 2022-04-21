local maps = {}

function maps.setup()
  local map = require('main.utils').map
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

  map('', '<Down>', '<nop>')
  map('', '<Up>', '<nop>')
  map('', '<Left>', '<nop>')
  map('', '<Right>', '<nop>')
  map('v', '<Down>', '<nop>')
  map('v', '<Up>', '<nop>')
  map('v', '<Left>', '<nop>')
  map('v', '<Right>', '<nop>')

  -- Copy to clipboard in normal, visual, select and operator modes
  map('n', 'YY', '"+y')
  map('n', 'XX', '"+x')

  map('n', '°', '<cmd>nohlsearch<cr>') -- disable hlsearch
  map('n', '<leader>o', 'm`o<Esc>``')  -- insert newline below in normal mode
  map('n', '<leader>O', 'm`O<Esc>``')  -- insert newline above in normal mode
  map('v', '<', '<gv')
  map('v', '>', '>gv')
  map('n', 'H', '^')
  map('n', 'L', '$')
  map('n', '<leader>vs', '<cmd>vsplit<cr>', {silent=true, noremap=true})
  map('n', '<leader>hs', '<cmd>split<cr>', {silent=true, noremap=true})
  map('n', '<leader>ws', '<cmd>ToggleWorkspace<cr>', {silent=true, noremap=true})

  cmd([[
    nmap <silent> <A-/> :Commentary<cr>
    vmap <silent> <A-/> :Commentary<cr>
    noremap       <C-e> :NvimTreeToggle<cr>
  ]])
end

return maps