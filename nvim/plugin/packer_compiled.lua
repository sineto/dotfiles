-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/snio/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/snio/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/snio/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/snio/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/snio/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["AutoSave.nvim"] = {
    config = { "\27LJ\1\2ß\2\0\0\6\0\18\0\0254\0\0\0%\1\1\0>\0\2\0027\1\2\0003\2\6\0004\3\3\0007\3\4\0037\3\5\3:\3\a\2%\3\b\0004\4\3\0007\4\t\0047\4\n\4%\5\v\0>\4\2\2$\3\4\3:\3\f\0023\3\r\0:\3\14\0023\3\15\0002\4\0\0:\4\16\3:\3\17\2>\1\2\1G\0\1\0\15conditions\20filetype_is_not\1\0\2\15modifiable\2\vexists\2\vevents\1\2\0\0\16InsertLeave\22execution_message\r%H:%M:%S\rstrftime\afn\19autosaved at: \fenabled\1\0\3\22write_all_buffers\1\20on_off_commands\2 clean_command_line_interval\3Ä\19\14auto_save\6g\bvim\nsetup\rautosave\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/snio/.local/share/nvim/site/pack/packer/opt/AutoSave.nvim"
  },
  ["FTerm.nvim"] = {
    config = { '\27LJ\1\2Ü\2\0\0\a\0\14\0\0264\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\0014\0\0\0%\1\6\0>\0\2\0027\0\a\0003\1\b\0\16\2\0\0%\3\t\0%\4\n\0%\5\v\0\16\6\1\0>\2\5\1\16\2\0\0%\3\f\0%\4\n\0%\5\r\0\16\6\1\0>\2\5\1G\0\1\0005<C-\\><C-n><cmd>lua require("FTerm").toggle()<cr>\6t+<cmd>lua require("FTerm").toggle()<cr>\n<A-i>\6n\1\0\2\vsilent\2\fnoremap\2\bmap\15main.utils\15dimensions\1\0\1\vborder\vsingle\1\0\4\6x\4\0€€€ÿ\3\vheight\4š³æÌ\t™³¦ÿ\3\nwidth\4š³æÌ\t™³¦ÿ\3\6y\4\0€€€ÿ\3\nsetup\nFTerm\frequire\0' },
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/FTerm.nvim"
  },
  ["barbar.nvim"] = {
    config = { "\27LJ\1\2¬\a\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0Œ\a    let bufferline = get(g:, 'bufferline', {})\n    let bufferline.icons = 'numbers'\n    let bufferline.maximum_padding = 2\n    let bufferline.no_name_title = '[Untitled]'\n\n    nnoremap <silent>    <A-w> :BufferClose<cr>\n    nnoremap <silent>    <A-a> :BufferPrevious<cr>\n    nnoremap <silent>    <A-s> :BufferNext<cr>\n\n    nnoremap <silent>    <A-<> :BufferMovePrevious<cr>\n    nnoremap <silent>    <A->> :BufferMoveNext<cr>\n\n    nnoremap <silent>    <leader>1 :BufferGoto 1<cr>\n    nnoremap <silent>    <leader>2 :BufferGoto 2<cr>\n    nnoremap <silent>    <leader>3 :BufferGoto 3<cr>\n    nnoremap <silent>    <leader>4 :BufferGoto 4<cr>\n    nnoremap <silent>    <leader>5 :BufferGoto 5<cr>\n    nnoremap <silent>    <leader>6 :BufferGoto 6<cr>\n    nnoremap <silent>    <leader>7 :BufferGoto 7<cr>\n    nnoremap <silent>    <leader>8 :BufferGoto 8<cr>\n    nnoremap <silent>    <leader>9 :BufferLast<cr>\n  \bcmd\bvim\0" },
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["dashboard-nvim"] = {
    commands = { "Dashboard", "DashboardNewFile", "DashboardJumpMarks", "SessionLoad", "SessionSave" },
    loaded = false,
    needs_bufread = false,
    path = "/home/snio/.local/share/nvim/site/pack/packer/opt/dashboard-nvim"
  },
  ["diffview.nvim"] = {
    config = { "\27LJ\1\2‚\6\0\0\a\0'\0_4\0\0\0%\1\1\0>\0\2\0027\0\2\0004\1\0\0%\2\3\0>\1\2\0027\1\4\0013\2\5\0003\3\6\0:\3\a\0023\3\b\0003\4\n\0\16\5\0\0%\6\t\0>\5\2\2:\5\v\4\16\5\0\0%\6\f\0>\5\2\2:\5\r\4\16\5\0\0%\6\14\0>\5\2\2:\5\15\4\16\5\0\0%\6\16\0>\5\2\2:\5\17\4:\4\18\0033\4\20\0\16\5\0\0%\6\19\0>\5\2\2:\5\21\4\16\5\0\0%\6\19\0>\5\2\2:\5\22\4\16\5\0\0%\6\23\0>\5\2\2:\5\24\4\16\5\0\0%\6\23\0>\5\2\2:\5\25\4\16\5\0\0%\6\26\0>\5\2\2:\5\27\4\16\5\0\0%\6\26\0>\5\2\2:\5\28\4\16\5\0\0%\6\26\0>\5\2\2:\5\29\4\16\5\0\0%\6\30\0>\5\2\2:\5\31\4\16\5\0\0%\6 \0>\5\2\2:\5!\4\16\5\0\0%\6\"\0>\5\2\2:\5#\4\16\5\0\0%\6$\0>\5\2\2:\5%\4\16\5\0\0%\6\t\0>\5\2\2:\5\v\4\16\5\0\0%\6\f\0>\5\2\2:\5\r\4\16\5\0\0%\6\14\0>\5\2\2:\5\15\4\16\5\0\0%\6\16\0>\5\2\2:\5\17\4:\4\a\3:\3&\2>\1\2\1G\0\1\0\17key_bindings\6R\18refresh_files\6U\16unstage_all\6S\14stage_all\6-\23toggle_stage_entry\18<2-LeftMouse>\6o\t<cr>\17select_entry\t<up>\6k\15prev_entry\v<down>\6j\1\0\0\15next_entry\tview\14<leader>b\17toggle_files\14<leader>e\16focus_files\f<s-tab>\22select_prev_entry\n<tab>\1\0\0\22select_next_entry\1\0\1\21disable_defaults\1\15file_panel\1\0\2\nwidth\3\25\14use_icons\2\1\0\1\18diff_binaries\1\nsetup\rdiffview\22diffview_callback\20diffview.config\frequire\0" },
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/diffview.nvim"
  },
  fzf = {
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/fzf"
  },
  ["fzf.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/snio/.local/share/nvim/site/pack/packer/opt/fzf.vim"
  },
  ["gina.vim"] = {
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/gina.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\2—\4\0\0\4\0\16\0\0194\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\14\0003\2\4\0003\3\3\0:\3\5\0023\3\6\0:\3\a\0023\3\b\0:\3\t\0023\3\n\0:\3\v\0023\3\f\0:\3\r\2:\2\15\1>\0\2\1G\0\1\0\nsigns\1\0\0\17changedelete\1\0\4\ttext\bïƒ—\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\ttext\bïƒ˜\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\ttext\bïƒ—\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\ttext\bâ”ƒ\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\ttext\bâ”ƒ\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/snio/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim"
  },
  ["lsp-colors.nvim"] = {
    config = { "\27LJ\1\0028\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\15lsp-colors\frequire\0" },
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim"
  },
  ["lspkind-nvim"] = {
    config = { "\27LJ\1\0025\0\2\6\0\3\0\0064\2\0\0007\2\1\2%\3\2\0\16\4\0\0\16\5\1\0@\2\4\0\f%s (%s)\vformat\vstringó\a\1\0\a\0L\0}1\0\0\0004\1\1\0%\2\2\0>\1\2\0027\1\3\0013\2\4\0003\3\a\0\16\4\0\0%\5\5\0%\6\6\0>\4\3\2:\4\b\3\16\4\0\0%\5\t\0%\6\n\0>\4\3\2:\4\v\3\16\4\0\0%\5\f\0%\6\r\0>\4\3\2:\4\14\3\16\4\0\0%\5\15\0%\6\16\0>\4\3\2:\4\17\3\16\4\0\0%\5\18\0%\6\19\0>\4\3\2:\4\20\3\16\4\0\0%\5\21\0%\6\22\0>\4\3\2:\4\23\3\16\4\0\0%\5\24\0%\6\25\0>\4\3\2:\4\26\3\16\4\0\0%\5\27\0%\6\28\0>\4\3\2:\4\29\3\16\4\0\0%\5\30\0%\6\31\0>\4\3\2:\4 \3\16\4\0\0%\5!\0%\6\"\0>\4\3\2:\4#\3\16\4\0\0%\5$\0%\6%\0>\4\3\2:\4&\3\16\4\0\0%\5'\0%\6(\0>\4\3\2:\4)\3\16\4\0\0%\5*\0%\6+\0>\4\3\2:\4,\3\16\4\0\0%\5-\0%\6.\0>\4\3\2:\4/\3\16\4\0\0%\0050\0%\0061\0>\4\3\2:\0042\3\16\4\0\0%\0053\0%\0064\0>\4\3\2:\0045\3\16\4\0\0%\0056\0%\0067\0>\4\3\2:\0048\3\16\4\0\0%\0059\0%\6:\0>\4\3\2:\4;\3\16\4\0\0%\5<\0%\6=\0>\4\3\2:\4>\3\16\4\0\0%\5?\0%\6@\0>\4\3\2:\4A\3\16\4\0\0%\5B\0%\6C\0>\4\3\2:\4D\3\16\4\0\0%\5E\0%\6F\0>\4\3\2:\4G\3\16\4\0\0%\5H\0%\6I\0>\4\3\2:\4J\3:\3K\2>\1\2\1G\0\1\0\15symbol_map\tText\ttext\bî˜’\vFolder\vfolder\bî—¾\tFile\tfile\bïƒ¶\nColor\ncolor\bîˆ«\fSnippet\fsnippet\bï™\18TypeParameter\19type parameter\bï‰¸\rOperator\roperator\bï™¯\fKeyword\fkeyword\bï‚„\nValue\nvalue\bï¢£\tUnit\tunit\bï‘µ\vModule\vmodule\bï™§\15EnumMember\16enum member\bï€«\tEnum\tenum\bïµ\14Interface\14interface\bï’’\rFunction\rfunction\bïž”\rVariable\rvariable\bïœ›\rConstant\rconstant\bï£¿\rProperty\rproperty\bïƒƒ\nField\nfield\bîœ–\vMethod\vmethod\bïš¦\16Constructor\16constructor\bîŠš\nClass\nclass\bïƒ¨\vStruct\1\0\0\vstruct\bï­„\1\0\1\14with_text\1\tinit\flspkind\frequire\0\0" },
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\1\2¼\2\0\0\3\0\a\0\v4\0\0\0%\1\1\0>\0\2\0027\1\2\0003\2\3\0>\1\2\0014\1\4\0007\1\5\1%\2\6\0>\1\2\1G\0\1\0É\1    nnoremap <silent><leader>cc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<cr>\n    nnoremap <silent><leader>gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<cr>\n  \bcmd\bvim\1\0\1\29use_saga_diagnostic_sign\1\18init_lsp_saga\flspsaga\frequire\0" },
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  monokai = {
    config = { "\27LJ\1\0027\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0\24colorscheme monokai\bcmd\bvim\0" },
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/monokai"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\1\2K\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\1\16hide_cursor\1\nsetup\14neoscroll\frequire\0" },
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/neoscroll.nvim"
  },
  ["numb.nvim"] = {
    config = { "\27LJ\1\0022\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\tnumb\frequire\0" },
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/numb.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\1\2]\0\1\5\0\6\1\f7\1\0\0\16\2\1\0007\1\1\0017\3\2\0007\4\2\0\20\4\0\4>\1\4\0024\2\3\0007\2\4\0023\3\5\0\16\4\1\0@\2\3\0\1\2\0\0\a{}\17tbl_contains\bvim\bcol\bsub\tline\4+\0\0\1\1\1\0\3+\0\0\0007\0\0\0@\0\1\0\2À\26check_break_line_charˆ\5\1\0\t\0\30\00184\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\0014\0\0\0%\1\3\0>\0\2\0027\0\2\0003\1\4\0003\2\5\0003\3\6\0:\3\a\0024\3\b\0007\3\t\3%\4\n\0%\5\v\0%\6\f\0>\3\4\2:\3\r\2:\2\14\1>\0\2\0014\0\0\0%\1\15\0>\0\2\0023\1\16\0004\2\0\0%\3\3\0>\2\2\0027\3\17\0022\4\3\0\16\5\0\0%\6\18\0%\a\18\0\16\b\1\0>\5\4\2\16\6\5\0007\5\19\0051\a\20\0>\5\3\0<\5\0\0>\3\2\0014\3\21\0001\4\23\0:\4\22\0034\3\0\0%\4\24\0>\3\2\0027\3\25\3%\4\26\0%\5\27\0%\6\28\0003\a\29\0>\3\5\0010\0\0€G\0\1\0\1\0\2\texpr\2\fnoremap\2\20v:lua.confirm()\t<cr>\6i\bmap\15main.utils\0\fconfirm\a_G\0\14with_pair\6 \14add_rules\1\5\0\0\15javascript\15typescript\20javascriptreact\20typescriptreact\24nvim-autopairs.rule\14fast_wrap\fpattern\5\b%s+\25 [%'%\"%)%>%]%)%}%,] \tgsub\vstring\nchars\1\6\0\0\6{\6[\6(\6\"\6'\1\0\5\fend_key\6$\bmap\n<M-e>\15hightlight\vSearch\tkeys\31qwertyuiopzxcvbnmasdfghjkl\16check_comma\2\1\0\3\17map_complete\2\rcheck_ts\2\vmap_cr\2\19nvim-autopairs\nsetup\20nvim-ts-autotag\frequire\3€€À™\4\0" },
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-compe"] = {
    after_files = { "/home/snio/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe.vim" },
    config = { "\27LJ\1\2ñ\1\0\1\n\1\t\3$7\1\0\0\14\0\1\0T\2\1€2\1\0\0007\2\1\1\14\0\2\0T\3\1€\16\2\1\0004\3\2\0\16\4\2\0>\3\2\4T\6\18€7\b\3\a\v\b\0\0T\b\15€7\b\4\a\b\b\0\0T\b\6€7\b\4\a\b\b\1\0T\b\3€7\b\4\a\t\b\2\0T\b\6€7\b\5\a%\t\6\0$\b\t\b:\b\3\a'\b\2\0:\b\a\aA\6\3\3N\6ì+\3\0\0007\3\b\3\16\4\0\0@\3\2\0\0À\21convert_lsp_orig\21insertTextFormat\v(${1})\nlabel\tkind\15insertText\vipairs\nitems\rresponse\4\6\b…\3\1\0\4\0\21\0\0294\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\5\0003\3\4\0:\3\6\0023\3\a\0:\3\b\0023\3\t\0:\3\n\0023\3\v\0:\3\f\2:\2\r\1>\0\2\0014\0\14\0007\0\15\0%\1\16\0>\0\2\0014\0\0\0%\1\17\0>\0\2\0027\1\19\0:\1\18\0001\1\20\0:\1\19\0000\0\0€G\0\1\0\0\16convert_lsp\21convert_lsp_orig\17compe.helper:autocmd User CompeConfirmDone :Lspsaga signature_help\bcmd\bvim\vsource\nvsnip\1\0\2\tkind\bï¬Œ\rpriority\3\3\rnvim_lsp\1\0\1\rpriority\3\2\tpath\1\0\1\rpriority\3\1\vbuffer\1\0\1\rnvim_lua\2\1\0\2\tkind\bï¬˜\rpriority\3\0\1\0\1\14preselect\valways\nsetup\ncompe\frequire\0" },
    loaded = true,
    needs_bufread = false,
    path = "/home/snio/.local/share/nvim/site/pack/packer/opt/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\1\2Â\n\0\2\n\0'\0f3\2\0\0:\1\1\0027\3\2\0007\3\3\3\15\0\3\0T\4\20€4\3\4\0007\3\5\0037\3\6\3%\4\a\0>\3\2\0014\3\4\0007\3\5\0037\3\6\3%\4\b\0>\3\2\0014\3\4\0007\3\5\0037\3\6\3%\4\t\0>\3\2\0014\3\4\0007\3\5\0037\3\6\3%\4\n\0>\3\2\0017\3\2\0007\3\v\3\15\0\3\0T\4\6€4\3\4\0007\3\5\0037\3\f\3%\4\r\0)\5\1\0>\3\3\0014\3\14\0%\4\15\0>\3\2\0027\3\16\0033\4\17\0\16\5\3\0%\6\18\0%\a\19\0%\b\20\0\16\t\4\0>\5\5\1\16\5\3\0%\6\18\0%\a\21\0%\b\22\0\16\t\4\0>\5\5\1\16\5\3\0%\6\18\0%\a\23\0%\b\24\0\16\t\4\0>\5\5\1\16\5\3\0%\6\18\0%\a\25\0%\b\26\0\16\t\4\0>\5\5\1\16\5\3\0%\6\18\0%\a\27\0%\b\28\0\16\t\4\0>\5\5\1\16\5\3\0%\6\18\0%\a\29\0%\b\30\0\16\t\4\0>\5\5\1\16\5\3\0%\6\18\0%\a\31\0%\b \0\16\t\4\0>\5\5\1\16\5\3\0%\6\18\0%\a!\0%\b\"\0\16\t\4\0>\5\5\1\16\5\3\0%\6\18\0%\a#\0%\b$\0\16\t\4\0>\5\5\1\16\5\3\0%\6\18\0%\a%\0%\b&\0\16\t\4\0>\5\5\1G\0\1\0\30<cmd>LspTroubleToggle<cr>\r<space>q*<cmd>lua vim.lsp.buf.references()<cr>\agr+<cmd>lua vim.lsp.buf.code_action()<cr>\14<space>ca&<cmd>lua vim.lsp.buf.rename()<cr>\14<space>rn/<cmd>lua vim.lsp.buf.type_definition()<cr>\r<space>D.<cmd>lua vim.lsp.buf.signature_help()<cr>\n<C-k>%<cmd>lua vim.lsp.buf.hover()<cr>\6K.<cmd>lua vim.lsp.buf.implementation()<cr>\agi*<cmd>lua vim.lsp.buf.definition()<cr>\agd+<cmd>lua vim.lsp.buf.declaration()<cr>\agD\6n\1\0\2\fnoremap\2\vsilent\2\bmap\15main.utils\frequireù\1        augroup lsp_document_highlight\n          autocmd! * <buffer>\n          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()\n          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()\n        augroup END\n      \14nvim_exec\23document_highlight\16augroup END?autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()\24autocmd! * <buffer>\19augroup Format\17nvim_command\bapi\bvim\24document_formatting\26resolved_capabilities\vbuffer\1\0\0¥\2\0\0\4\1\15\0\0224\0\0\0007\0\1\0007\0\2\0007\0\3\0>\0\1\0027\1\4\0007\1\5\0017\1\6\1)\2\2\0:\2\a\0017\1\4\0007\1\5\0017\1\6\0013\2\n\0003\3\t\0:\3\v\2:\2\b\0013\1\f\0:\0\r\1+\2\0\0:\2\14\1H\1\2\0\0À\14on_attach\17capabilities\1\0\0\15properties\1\0\0\1\4\0\0\18documentation\vdetail\24additionalTextEdits\19resolveSupport\19snippetSupport\19completionItem\15completion\17textDocument\29make_client_capabilities\rprotocol\blsp\bvim¢\1\0\1\4\0\a\0\21\16\2\0\0007\1\0\0%\3\1\0>\1\3\2\n\1\0\0T\1\2€)\1\0\0H\1\2\0004\1\2\0%\2\3\0>\1\2\0027\2\4\1\16\3\0\0>\2\2\2\14\0\2\0T\3\4€7\2\5\0017\2\6\2\16\3\0\0>\2\2\2H\2\2\0\fdirname\tpath\22find_git_ancestor\19lspconfig/util\frequire\15lush_theme\nmatchA\0\1\3\0\2\0\0047\1\0\0)\2\1\0:\2\1\1G\0\1\0\24document_formatting\26resolved_capabilitiesú\2\1\0\r\1\19\00014\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\0014\0\0\0%\1\3\0>\0\2\0024\1\0\0%\2\1\0>\1\2\0027\1\4\1>\1\1\0024\2\5\0\16\3\1\0>\2\2\4D\5\29€+\a\0\0>\a\1\2\a\6\6\0T\b\6€4\b\0\0%\t\a\0>\b\2\2:\b\b\a1\t\n\0:\t\t\a\a\6\v\0T\b\t€4\b\f\0007\b\r\b%\t\14\0\16\n\a\0004\v\0\0%\f\15\0>\v\2\0=\b\2\2\16\a\b\0\a\6\16\0T\b\2€1\b\18\0:\b\17\a6\b\6\0007\b\2\b\16\t\a\0>\b\2\1B\5\3\3N\5áG\0\1\0\1À\0\14on_attach\15typescript\24specs.lspconfig.efm\nforce\15tbl_extend\bvim\befm\0\rroot_dir\rsettings\28specs.lspconfig.luaconf\blua\npairs\22installed_servers\14lspconfig\nsetup\15lspinstall\frequire5\0\0\2\1\3\0\a+\0\0\0>\0\1\0014\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0\2À\fbufdo e\bcmd\bvim`\1\0\5\0\a\0\f1\0\0\0001\1\1\0001\2\2\0\16\3\2\0>\3\1\0014\3\3\0%\4\4\0>\3\2\0021\4\6\0:\4\5\0030\0\0€G\0\1\0\0\22post_install_hook\15lspinstall\frequire\0\0\0\0" },
    loaded = true,
    needs_bufread = false,
    path = "/home/snio/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\1\2¨\1\0\0\6\0\n\0\0174\0\0\0%\1\1\0>\0\2\0027\1\2\0>\1\1\2\15\0\1\0T\2\t€4\2\3\0007\2\4\0027\2\5\2%\3\6\0007\4\a\1%\5\b\0$\3\5\0033\4\t\0>\2\3\1G\0\1\0\1\0\1\vdetach\2\b' &\18absolute_path\vopen '\rjobstart\afn\bvim\23get_node_at_cursor\18nvim-tree.lib\frequirel\0\0\2\0\5\0\f4\0\0\0%\1\1\0>\0\2\0027\0\2\0'\1\26\0>\0\2\0014\0\0\0%\1\3\0>\0\2\0027\0\4\0>\0\1\1G\0\1\0\vtoggle\14nvim-tree\15set_offset\21bufferline.state\frequirek\0\0\2\0\5\0\f4\0\0\0%\1\1\0>\0\2\0027\0\2\0'\1\0\0>\0\2\0014\0\0\0%\1\3\0>\0\2\0027\0\4\0>\0\1\1G\0\1\0\nclose\14nvim-tree\15set_offset\21bufferline.state\frequire¼\1\1\0\5\0\n\1\0261\0\0\0001\1\1\0004\2\2\0%\3\3\0>\2\2\0024\3\2\0%\4\4\0>\3\2\0027\4\5\2>\4\1\2\15\0\4\0T\5\3€\16\4\1\0>\4\1\1T\4\n€4\4\6\0007\4\a\0047\4\b\4\t\4\0\0T\4\3€\16\4\0\0>\4\1\1T\4\2€7\4\t\3>\4\1\1G\0\1\0\topen\21nvim_tree_follow\6g\bvim\rwin_open\18nvim-tree.lib\19nvim-tree.view\frequire\0\0\2¨\1\0\0\6\0\n\0\0174\0\0\0%\1\1\0>\0\2\0027\1\2\0>\1\1\2\15\0\1\0T\2\t€4\2\3\0007\2\4\0027\2\5\2%\3\6\0007\4\a\1%\5\b\0$\3\5\0033\4\t\0>\2\3\1G\0\1\0\1\0\1\vdetach\2\b' &\18absolute_path\vopen '\rjobstart\afn\bvim\23get_node_at_cursor\18nvim-tree.lib\frequire‚\1\0\0\4\0\a\0\0154\0\0\0007\0\1\0007\0\2\0>\0\1\0024\1\0\0007\1\1\0017\1\3\1\16\2\0\0%\3\4\0>\1\3\2\a\1\5\0T\1\2€%\1\6\0H\1\2\0G\0\1\0\6 \rNvimTree\aft\24nvim_buf_get_option\25nvim_get_current_buf\bapi\bvimÂ\23\1\0\6\0z\0ž\0024\0\0\0007\0\1\0004\1\2\0%\2\3\0>\1\2\0027\1\4\1%\2\6\0:\2\5\0'\2\25\0:\2\a\0'\2\1\0:\2\b\0003\2\n\0:\2\t\0003\2\f\0:\2\v\0'\2\0\0:\2\r\0'\2\0\0:\2\14\0'\2\0\0:\2\15\0'\2\1\0:\2\16\0'\2\1\0:\2\17\0'\2\0\0:\2\18\0'\2\1\0:\2\19\0'\2\0\0:\2\20\0%\2\22\0:\2\21\0'\2\0\0:\2\23\0'\2\1\0:\2\24\0'\2\0\0:\2\25\0'\2\1\0:\2\26\0'\2\0\0:\2\27\0'\2\1\0:\2\28\0003\2\30\0:\2\29\0003\2 \0003\3!\0:\3\"\2:\2\31\0001\2#\0005\2$\0002\2 \0003\3'\0003\4&\0:\4(\3\16\4\1\0%\5)\0>\4\2\2:\4*\3;\3\1\0023\3,\0003\4+\0:\4(\3\16\4\1\0%\5-\0>\4\2\2:\4*\3;\3\2\0023\3.\0\16\4\1\0%\5/\0>\4\2\2:\4*\3;\3\3\0023\0030\0\16\4\1\0%\0051\0>\4\2\2:\4*\3;\3\4\0023\0032\0\16\4\1\0%\0053\0>\4\2\2:\4*\3;\3\5\0023\0034\0\16\4\1\0%\0055\0>\4\2\2:\4*\3;\3\6\0023\0036\0\16\4\1\0%\0057\0>\4\2\2:\4*\3;\3\a\0023\0038\0\16\4\1\0%\0059\0>\4\2\2:\4*\3;\3\b\0023\3:\0\16\4\1\0%\5;\0>\4\2\2:\4*\3;\3\t\0023\3<\0\16\4\1\0%\5;\0>\4\2\2:\4*\3;\3\n\0023\3=\0\16\4\1\0%\5>\0>\4\2\2:\4*\3;\3\v\0023\3?\0\16\4\1\0%\5@\0>\4\2\2:\4*\3;\3\f\0023\3A\0\16\4\1\0%\5B\0>\4\2\2:\4*\3;\3\r\0023\3C\0\16\4\1\0%\5D\0>\4\2\2:\4*\3;\3\14\0023\3E\0\16\4\1\0%\5F\0>\4\2\2:\4*\3;\3\15\0023\3G\0\16\4\1\0%\5H\0>\4\2\2:\4*\3;\3\16\0023\3I\0\16\4\1\0%\5J\0>\4\2\2:\4*\3;\3\17\0023\3K\0\16\4\1\0%\5L\0>\4\2\2:\4*\3;\3\18\0023\3M\0\16\4\1\0%\5N\0>\4\2\2:\4*\3;\3\19\0023\3O\0\16\4\1\0%\5P\0>\4\2\2:\4*\3;\3\20\0023\3Q\0\16\4\1\0%\5R\0>\4\2\2:\4*\3;\3\21\0023\3S\0\16\4\1\0%\5T\0>\4\2\2:\4*\3;\3\22\0023\3U\0\16\4\1\0%\5V\0>\4\2\2:\4*\3;\3\23\0023\3W\0\16\4\1\0%\5X\0>\4\2\2:\4*\3;\3\24\0023\3Y\0\16\4\1\0%\5Z\0>\4\2\2:\4*\3;\3\25\0023\3[\0\16\4\1\0%\5\\\0>\4\2\2:\4*\3;\3\26\0023\3]\0\16\4\1\0%\5^\0>\4\2\2:\4*\3;\3\27\0023\3_\0\16\4\1\0%\5`\0>\4\2\2:\4*\3;\3\28\0023\3a\0\16\4\1\0%\5b\0>\4\2\2:\4*\3;\3\29\0023\3c\0\16\4\1\0%\5d\0>\4\2\2:\4*\3;\3\30\0023\3e\0\16\4\1\0%\5f\0>\4\2\2:\4*\3;\3\31\2:\2%\0002\2\0\0005\2g\0004\2g\0001\3i\0:\3h\0024\2g\0001\3k\0:\3j\0024\2g\0001\3m\0:\3l\0024\2\0\0007\2n\0027\2o\2%\3p\0)\4\1\0>\2\3\0014\2\2\0%\3q\0>\2\2\0027\2r\2%\3s\0%\4t\0%\5u\0>\2\4\0014\2\2\0%\3q\0>\2\2\0027\2r\2%\3s\0%\4v\0%\5w\0>\2\4\0014\2\2\0%\3q\0>\2\2\0027\2x\0023\3y\0>\2\2\1G\0\1\0\1\0\3\aet*<cmd>lua MUtils.toggle_nvimtree()<cr>\aef\30<cmd>NvimTreeFindFile<cr>\aer\29<cmd>NvimTreeRefresh<cr>\20map_leader_keys*<cmd>lua MUtils.nvimtree_osopen()<cr>\n<A-o>*<cmd>lua MUtils.toggle_nvimtree()<cr>\n<A-b>\6n\bmap\15main.utilsŠ\1\t\tau BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == \"NvimTree\" | set laststatus=0 | else | set laststatus=2 | endif\n\t\14nvim_exec\bapi\0\31update_nvimtree_statusline\0\20nvimtree_osopen\0\20toggle_nvimtree\vMUtils\16toggle_help\1\0\1\bkey\ag?\nclose\1\0\1\bkey\6q\vdir_up\1\0\1\bkey\6-\18next_git_item\1\0\1\bkey\a}c\18prev_git_item\1\0\1\bkey\a[c\23copy_absolute_path\1\0\1\bkey\agy\14copy_path\1\0\1\bkey\6Y\14copy_name\1\0\1\bkey\6y\npaste\1\0\1\bkey\6p\tcopy\1\0\1\bkey\6c\bcut\1\0\1\bkey\6x\16full_rename\1\0\1\bkey\t<C->\vrename\1\0\1\bkey\6r\vremove\1\0\1\bkey\6d\vcreate\1\0\1\bkey\6a\frefresh\1\0\1\bkey\6R\20toggle_dotfiles\1\0\1\bkey\6H\19toggle_ignored\1\0\1\bkey\6I\17last_sibling\1\0\1\bkey\6J\18first_sibling\1\0\1\bkey\6K\fpreview\1\0\1\bkey\n<Tab>\1\0\1\bkey\v<S-CR>\15close_node\1\0\1\bkey\t<BS>\16parent_node\1\0\1\bkey\6P\17next_sibling\1\0\1\bkey\6>\17prev_sibling\1\0\1\bkey\6<\vtabnew\1\0\1\bkey\n<C-t>\nsplit\1\0\1\bkey\n<C-x>\vvsplit\1\0\1\bkey\n<C-v>\acd\1\0\0\1\3\0\0\19<2-RightMouse>\n<C-}>\acb\tedit\bkey\1\0\0\1\6\0\0\t<CR>\6o\18<2-LeftMouse>\6l\6h\23nvim_tree_bindings\19NvimTreeOSOpen\0\vfolder\1\0\6\fdefault\bî—¿\15empty_open\bï„•\topen\bî—¾\nempty\bï„”\fsymlink\bï’‚\17symlink_open\bî—¾\1\0\2\fdefault\bî˜’\fsymlink\bï’\20nvim_tree_icons\1\0\3\ffolders\3\1\nfiles\3\1\bgit\3\0\25nvim_tree_show_icons\25nvim_tree_update_cwd\27nvim_tree_hijack_netrw\28nvim_tree_disable_netrw\27nvim_tree_add_trailing\27nvim_tree_allow_resize\23nvim_tree_tab_open\a:t#nvim_tree_root_folder_modifier%nvim_tree_highlight_opened_files\21nvim_tree_git_hl\28nvim_tree_hide_dotfiles\29nvim_tree_indent_markers\21nvim_tree_follow\27nvim_tree_quit_on_open\25nvim_tree_auto_close\24nvim_tree_auto_open\1\2\0\0\14dashboard\29nvim_tree_auto_ignore_ft\1\6\0\0\t.git\17node_modules\tdist\16Session.vim\r.undodir\21nvim_tree_ignore\24nvim_tree_gitignore\20nvim_tree_width\tleft\19nvim_tree_side\23nvim_tree_callback\21nvim-tree.config\frequire\6g\bvim\0" },
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "vim-commentary" },
    loaded = true,
    only_config = true
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\1\2ë\r\0\0\6\0L\0€\0013\0\0\0004\1\1\0%\2\2\0>\1\2\0027\1\3\0013\2J\0003\3\a\0003\4\4\0007\5\5\0:\5\6\4:\4\b\0033\4\t\0007\5\n\0:\5\6\4:\4\v\0033\4\f\0007\5\r\0:\5\6\4:\4\14\0033\4\15\0007\5\n\0:\5\6\4:\4\16\0033\4\17\0007\5\5\0:\5\6\4:\4\18\0033\4\19\0007\5\20\0:\5\6\4:\4\21\0033\4\22\0007\5\20\0:\5\6\4:\4\23\0033\4\24\0:\4\25\0033\4\26\0007\5\27\0:\5\6\4:\4\28\0033\4\29\0007\5\27\0:\5\6\4:\4\30\0033\4\31\0007\5\27\0:\5\6\4:\4 \0033\4!\0007\5\n\0:\5\6\4:\4\"\0033\4#\0007\5\n\0:\5\6\4:\4$\0033\4%\0007\5&\0:\5\6\4:\4'\0033\4(\0007\5&\0:\5\6\4:\4)\0033\4*\0007\5+\0:\5\6\4:\4,\0033\4-\0007\5+\0:\5\6\4:\4.\0033\4/\0007\5\n\0:\5\6\4:\0040\0033\0041\0007\5&\0:\5\6\4:\0042\0033\0043\0007\5\5\0:\5\6\4:\0044\0033\0045\0007\5\5\0:\5\6\4:\0046\0033\0047\0007\0058\0:\5\6\4:\0049\0033\4:\0007\5\5\0:\5\6\4:\4;\0033\4<\0007\5\n\0:\5\6\4:\4=\0033\4>\0007\5+\0:\5\6\4:\4?\0033\4@\0007\5+\0:\5\6\4:\4A\0033\4B\0007\5+\0:\5\6\4:\4C\0033\4D\0007\5+\0:\5\6\4:\4E\0033\4F\0007\5\5\0:\5\6\4:\4G\0033\4H\0007\5\r\0:\5\6\4:\4I\3:\3K\2>\1\2\1G\0\1\0\roverride\1\0\0\tjson\1\0\2\ticon\bï¬¥\tname\tjson\15.gitignore\1\0\2\ticon\bîœ‚\tname\14gitignore\bmdx\1\0\2\ticon\bï’Š\tname\bmdx\rmarkdown\1\0\2\ticon\bï’Š\tname\rmarkdown\amd\1\0\2\ticon\bï’Š\tname\amd\ash\1\0\2\ticon\bîž•\tname\ash\blua\1\0\2\ticon\bî˜ \tname\blua\brpm\1\0\2\ticon\bïŒ–\tname\brpm\bdeb\tcyan\1\0\2\ticon\bïŒ†\tname\bdeb\axz\1\0\2\ticon\bï‡†\tname\axz\bzip\1\0\2\ticon\bï‡†\tname\bzip\tlock\1\0\2\ticon\bï ½\tname\tlock\ttoml\1\0\2\ticon\bï€“\tname\ttoml\apy\1\0\2\ticon\bî˜†\tname\apy\bvue\ngreen\1\0\2\ticon\bïµ‚\tname\bvue\aru\1\0\2\ticon\bï»\tname\aru\arb\bred\1\0\2\ticon\bï»\tname\arb\15dockerfile\1\0\2\ticon\bïŒˆ\tname\15Dockerfile\15Dockerfile\1\0\2\ticon\bïŒˆ\tname\15Dockerfile\bout\1\0\2\ticon\bî˜’\tname\bout\bmp4\1\0\2\ticon\bï…„\tname\bmp4\bmp3\nwhite\1\0\2\ticon\bï¢…\tname\bmp3\tjpeg\1\0\3\ncolor\18colors.purple\ticon\bïŽ\tname\tjpeg\bjpg\1\0\2\ticon\bïŽ\tname\bjpg\bpng\vpurple\1\0\2\ticon\bïŽ\tname\bpng\akt\1\0\2\ticon\tó±ˆ™\tname\akt\ats\1\0\2\ticon\bï¯¤\tname\ats\ajs\vyellow\1\0\2\ticon\bï \tname\ajs\bcss\tblue\1\0\2\ticon\bî‰\tname\bcss\thtml\1\0\0\ncolor\vorange\1\0\2\ticon\bï„»\tname\thtml\nsetup\22nvim-web-devicons\frequire\1\0\21\fpurple2\f#C678DD\ngrey3\f#565357\ngrey1\f#383539\vyellow\f#FFD866\16white_dark4\f#ABB2BF\16white_dark5\f#747474\ngrey2\f#403E41\vorange\f#FC9867\16white_dark3\f#939293\bred\f#E06C75\15grey_dark2\f#221F22\16white_dark1\f#5B595C\nwhite\f#FCFCFA\tblue\f#78DCE8\nblack\f#2D2A2E\16white_dark2\f#727072\ngreen\f#A9DC76\tpink\f#FF6188\15grey_dark1\f#19181A\tcyan\f#18FF9E\vpurple\f#AB9DF2\0" },
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    config = { "\27LJ\1\2­\1\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\4\api\27<cmd>PackerInstall<cr>\apu\26<cmd>PackerUpdate<cr>\apc\27<cmd>PackerCompile<cr>\aps\24<cmd>PackerSync<cr>\20map_leader_keys\15main.utils\frequire\0" },
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["sanity-snippets"] = {
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/sanity-snippets"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\1\2®\n\0\0\5\0+\0H4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1 \0003\2\4\0003\3\3\0:\3\5\0023\3\a\0003\4\6\0:\4\b\0033\4\t\0:\4\n\3:\3\v\0024\3\0\0%\4\f\0>\3\2\0027\3\r\3:\3\14\0022\3\0\0:\3\15\0024\3\0\0%\4\f\0>\3\2\0027\3\16\3:\3\17\0022\3\0\0:\3\18\0023\3\19\0:\3\20\0023\3\21\0:\3\22\0024\3\0\0%\4\23\0>\3\2\0027\3\24\0037\3\25\3:\3\26\0024\3\0\0%\4\23\0>\3\2\0027\3\27\0037\3\25\3:\3\28\0024\3\0\0%\4\23\0>\3\2\0027\3\29\0037\3\25\3:\3\30\0024\3\0\0%\4\23\0>\3\2\0027\3\31\3:\3\31\2:\2!\0013\2#\0003\3\"\0:\3$\0023\3&\0003\4%\0:\4'\3:\3(\2:\2)\1>\0\2\0014\0\0\0%\1\1\0>\0\2\0027\0*\0%\1$\0>\0\2\1G\0\1\0\19load_extension\15extensions\16media_files\14filetypes\1\0\1\rfind_cmd\arg\1\5\0\0\bpng\twebp\bjpg\tjpeg\bfzf\1\0\0\1\0\4\28override_generic_sorter\1\14case_mode\15smart_case\25override_file_sorter\2\nfuzzy\2\rdefaults\1\0\0\27buffer_previewer_maker\21qflist_previewer\22vim_buffer_qflist\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\fset_env\1\0\1\14COLORTERM\14truecolor\16borderchars\1\t\0\0\bâ”€\bâ”‚\bâ”€\bâ”‚\bâ”Œ\bâ”\bâ”˜\bâ””\vborder\19generic_sorter\29get_generic_fuzzy_sorter\25file_ignore_patterns\16file_sorter\19get_fuzzy_file\22telescope.sorters\18layout_config\rvertical\1\0\1\vmirror\2\15horizontal\1\0\3\vheight\4š³æÌ\t™³¦ÿ\3\19preview_cutoff\3x\nwidth\4×ÇÂë\3Š®¯ÿ\3\1\0\3\18preview_width\4š³æÌ\t™³†ÿ\3\20prompt_position\btop\18results_width\4š³æÌ\t™³¦ÿ\3\22vimgrep_arguments\1\0\v\23selection_strategy\nreset\20layout_strategy\15horizontal\ruse_less\2\17entry_prefix\a  \21sorting_strategy\14ascending\18prompt_prefix\v ï€‚  \17initial_mode\vinsert\rwinblend\3\0\17path_display\2\19color_devicons\2\20selection_caret\a  \1\b\0\0\arg\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\1\0029\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ["vim-commentary"] = {
    config = { "\27LJ\1\2\v\0\0\1\0\0\0\1G\0\1\0\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/snio/.local/share/nvim/site/pack/packer/opt/vim-commentary"
  },
  ["vim-easydir"] = {
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/vim-easydir"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/vim-eunuch"
  },
  ["vim-gtfo"] = {
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/vim-gtfo"
  },
  ["vim-move"] = {
    config = { "\27LJ\1\0022\0\0\2\0\3\0\0054\0\0\0007\0\1\0'\1\1\0:\1\2\0G\0\1\0\21move_auto_indent\6g\bvim\0" },
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/vim-move"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-textobj-line"] = {
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/vim-textobj-line"
  },
  ["vim-textobj-parameter"] = {
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/vim-textobj-parameter"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/vim-textobj-user"
  },
  ["vim-tmux-navigator"] = {
    config = { "\27LJ\1\2D\0\0\2\0\3\0\0054\0\0\0007\0\1\0'\1\1\0:\1\2\0G\0\1\0'tmux_navigator_disable_when_zoomed\6g\bvim\0" },
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  ["vim-vsnip"] = {
    config = { "\27LJ\1\2ô\4\0\0\a\0\21\0=3\0\0\0004\1\1\0007\1\2\0017\1\3\1\16\2\1\0%\3\4\0%\4\5\0%\5\6\0\16\6\0\0>\2\5\1\16\2\1\0%\3\a\0%\4\5\0%\5\6\0\16\6\0\0>\2\5\1\16\2\1\0%\3\4\0%\4\b\0%\5\t\0\16\6\0\0>\2\5\1\16\2\1\0%\3\a\0%\4\b\0%\5\t\0\16\6\0\0>\2\5\1\16\2\1\0%\3\4\0%\4\n\0%\5\v\0\16\6\0\0>\2\5\1\16\2\1\0%\3\a\0%\4\n\0%\5\v\0\16\6\0\0>\2\5\1\16\2\1\0%\3\4\0%\4\f\0%\5\r\0\16\6\0\0>\2\5\1\16\2\1\0%\3\a\0%\4\f\0%\5\r\0\16\6\0\0>\2\5\0014\2\1\0007\2\14\0023\3\17\0003\4\16\0:\4\18\0033\4\19\0:\4\20\3:\3\15\2G\0\1\0\20typescriptreact\1\2\0\0\15typescript\20javascriptreact\1\0\0\1\2\0\0\15javascript\20vsnip_filetypes\6g?vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'\f<S-Tab><vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'\n<Tab>Bvsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'\n<C-l>\6s:vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>'\n<C-j>\6i\20nvim_set_keymap\bapi\bvim\1\0\1\texpr\2\0" },
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  },
  ["vscode-javascript"] = {
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/vscode-javascript"
  },
  winresizer = {
    config = { "\27LJ\1\2>\0\0\2\0\4\0\0054\0\0\0007\0\1\0%\1\3\0:\1\2\0G\0\1\0\f<C-A-r>\25winresizer_start_key\6g\bvim\0" },
    loaded = true,
    path = "/home/snio/.local/share/nvim/site/pack/packer/start/winresizer"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: nvim-lspconfig
time([[Setup for nvim-lspconfig]], true)
try_loadstring("\27LJ\1\2º\1\0\0\4\0\b\0\0144\0\0\0007\0\1\0007\0\2\0004\1\0\0007\1\1\0017\1\4\0014\2\0\0007\2\1\0027\2\5\0027\2\6\0023\3\a\0>\1\3\2:\1\3\0G\0\1\0\1\0\3\17virtual_text\1\nsigns\1\14underline\2\27on_publish_diagnostics\15diagnostic\twith$textDocument/publishDiagnostics\rhandlers\blsp\bvim\0", "setup", "nvim-lspconfig")
time([[Setup for nvim-lspconfig]], false)
time([[packadd for nvim-lspconfig]], true)
vim.cmd [[packadd nvim-lspconfig]]
time([[packadd for nvim-lspconfig]], false)
-- Setup for: dashboard-nvim
time([[Setup for dashboard-nvim]], true)
try_loadstring("\27LJ\1\2ø\r\0\0\4\0\31\0'4\0\0\0007\0\1\0'\1\1\0:\1\2\0'\1\1\0:\1\3\0%\1\5\0:\1\4\0003\1\a\0:\1\6\0003\1\f\0003\2\n\0003\3\t\0:\3\v\2:\2\r\0013\2\15\0003\3\14\0:\3\v\2:\2\16\0013\2\18\0003\3\17\0:\3\v\2:\2\19\0013\2\21\0003\3\20\0:\3\v\2:\2\22\0013\2\24\0003\3\23\0:\3\v\2:\2\25\0013\2\27\0003\3\26\0:\3\v\2:\2\28\1:\1\b\0003\1\30\0:\1\29\0G\0\1\0\1\3\0\0\b   \18snio.dev v0.1\28dashboard_custom_footer\6f\1\0\1\fcommand\16SessionLoad\1\2\0\0+ï€ž  Load Last Session         SPC s l\6e\1\0\1\fcommand\nMarks\1\2\0\0+ï€®  Bookmarks                 SPC b m\6d\1\0\1\fcommand\21DashboardNewFile\1\2\0\0*ï¤• New File                  SPC f n\6c\1\0\1\fcommand\aAg\1\2\0\0+ïœ¬  Find Word                 SPC f w\6b\1\0\1\fcommand\fHistory\1\2\0\0+ïœ™  Recents                   SPC f o\6a\1\0\0\16description\1\0\1\fcommand\nFiles\1\2\0\0+ï€‚  Find File                 CTRL+P \29dashboard_custom_section\1\16\0\0(                                   (                                   (                                   I   â£´â£¶â£¤â¡¤â ¦â£¤â£€â£¤â †     â£ˆâ£­â£¿â£¶â£¿â£¦â£¼â£†         X    â ‰â »â¢¿â£¿â ¿â£¿â£¿â£¶â£¦â ¤â „â¡ â¢¾â£¿â£¿â¡¿â ‹â ‰â ‰â »â£¿â£¿â¡›â£¦       F          â ˆâ¢¿â£¿â£Ÿâ ¦ â£¾â£¿â£¿â£·    â »â ¿â¢¿â£¿â£§â£„     N           â£¸â£¿â£¿â¢§ â¢»â »â£¿â£¿â£·â£„â£€â „â ¢â£€â¡€â ˆâ ™â ¿â „    L          â¢ â£¿â£¿â£¿â ˆ    â£»â£¿â£¿â£¿â£¿â£¿â£¿â£¿â£›â£³â£¤â£€â£€   ^   â¢ â£§â£¶â£¥â¡¤â¢„ â£¸â£¿â£¿â ˜  â¢€â£´â£¿â£¿â¡¿â ›â£¿â£¿â£§â ˆâ¢¿â ¿â Ÿâ ›â »â ¿â „  X  â£°â£¿â£¿â ›â »â£¿â£¿â¡¦â¢¹â£¿â£·   â¢Šâ£¿â£¿â¡  â¢¸â£¿â£¿â¡‡ â¢€â£ â£„â£¾â „   b â£ â£¿â ¿â › â¢€â£¿â£¿â£·â ˜â¢¿â£¿â£¦â¡€ â¢¸â¢¿â£¿â£¿â£„ â£¸â£¿â£¿â¡‡â£ªâ£¿â¡¿â ¿â£¿â£·â¡„  \\ â ™â ƒ   â£¼â£¿â¡Ÿ  â ˆâ »â£¿â£¿â£¦â£Œâ¡‡â »â£¿â£¿â£·â£¿â£¿â£¿ â£¿â£¿â¡‡ â ›â »â¢·â£„ P    â¢»â£¿â£¿â£„   â ˆâ »â£¿â£¿â£¿â£·â£¿â£¿â£¿â£¿â£¿â¡Ÿ â «â¢¿â£¿â¡†       V       â »â£¿â£¿â£¿â£¿â£¶â£¶â£¾â£¿â£¿â£¿â£¿â£¿â£¿â£¿â£¿â¡Ÿâ¢€â£€â£¤â£¾â¡¿â ƒ     (                                   \28dashboard_custom_header\bfzf dashboard_default_executive!dashboard_disable_statusline\"dashboard_disable_at_vimenter\6g\bvim\0", "setup", "dashboard-nvim")
time([[Setup for dashboard-nvim]], false)
-- Setup for: indent-blankline.nvim
time([[Setup for indent-blankline.nvim]], true)
try_loadstring("\27LJ\1\2©\3\0\0\2\0\r\0\0294\0\0\0007\0\1\0'\1\1\0:\1\2\0004\0\0\0007\0\1\0%\1\4\0:\1\3\0004\0\0\0007\0\1\0003\1\6\0:\1\5\0004\0\0\0007\0\1\0003\1\b\0:\1\a\0004\0\0\0007\0\1\0)\1\1\0:\1\t\0004\0\0\0007\0\1\0)\1\2\0:\1\n\0004\0\0\0007\0\1\0003\1\f\0:\1\v\0G\0\1\0\1\2\0\0\bFg1)indent_blankline_char_highlight_list-indent_blankline_show_first_indent_level4indent_blankline_show_trailing_blankline_indent\1\2\0\0\rterminal%indent_blankline_buftype_exclude\1\5\0\0\thelp\rterminal\14dashboard\rNvimTree&indent_blankline_filetype_exclude\bâ–\26indent_blankline_char\23indentLine_enabled\6g\bvim\0", "setup", "indent-blankline.nvim")
time([[Setup for indent-blankline.nvim]], false)
-- Setup for: nvim-compe
time([[Setup for nvim-compe]], true)
try_loadstring('\27LJ\1\2¢\3\0\0\a\0\19\0+4\0\0\0007\0\1\0004\1\3\0007\1\4\0013\2\5\0%\3\6\0>\1\3\2:\1\2\0003\0\a\0004\1\0\0007\1\b\0017\1\t\1\16\2\1\0%\3\n\0%\4\v\0%\5\f\0\16\6\0\0>\2\5\1\16\2\1\0%\3\n\0%\4\r\0%\5\14\0\16\6\0\0>\2\5\1\16\2\1\0%\3\n\0%\4\15\0%\5\16\0\16\6\0\0>\2\5\1\16\2\1\0%\3\n\0%\4\15\0%\5\17\0\16\6\0\0>\2\5\1\16\2\1\0%\3\n\0%\4\15\0%\5\18\0\16\6\0\0>\2\5\1G\0\1\0"compe#scroll({ "delta": -4 })"compe#scroll({ "delta": +4 })\25compe#close("<C-e">)\n<C-e>\26compe#confirm("<CR>")\t<CR>\21compe#complete()\14<C-Space>\6i\20nvim_set_keymap\bapi\1\0\2\texpr\2\vsilent\2\6,\1\4\0\0\tmenu\fmenuone\rnoselect\vconcat\ntable\16completeopt\6o\bvim\0', "setup", "nvim-compe")
time([[Setup for nvim-compe]], false)
time([[packadd for nvim-compe]], true)
vim.cmd [[packadd nvim-compe]]
time([[packadd for nvim-compe]], false)
-- Setup for: fzf.vim
time([[Setup for fzf.vim]], true)
try_loadstring("\27LJ\1\2…\2\0\0\4\0\14\0\0274\0\0\0007\0\1\0003\1\3\0:\1\2\0004\0\4\0%\1\5\0>\0\2\0027\0\6\0%\1\a\0%\2\b\0%\3\t\0>\0\4\0014\0\4\0%\1\5\0>\0\2\0027\0\6\0%\1\a\0%\2\n\0%\3\v\0>\0\4\0014\0\4\0%\1\5\0>\0\2\0027\0\f\0003\1\r\0>\0\2\1G\0\1\0\1\0\2\afa\16<cmd>Ag<cr>\afr\16<cmd>Rg<cr>\20map_leader_keys\21<cmd>Buffers<cr>\n<C-b>\19<cmd>Files<cr>\n<C-p>\6n\bmap\15main.utils\frequire\1\0\1\aup\t~45%\15fzf_layout\6g\bvim\0", "setup", "fzf.vim")
time([[Setup for fzf.vim]], false)
-- Config for: vim-tmux-navigator
time([[Config for vim-tmux-navigator]], true)
try_loadstring("\27LJ\1\2D\0\0\2\0\3\0\0054\0\0\0007\0\1\0'\1\1\0:\1\2\0G\0\1\0'tmux_navigator_disable_when_zoomed\6g\bvim\0", "config", "vim-tmux-navigator")
time([[Config for vim-tmux-navigator]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\1\2¿\2\0\0\3\0\14\0\0174\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0013\2\6\0:\2\a\0013\2\b\0:\2\t\0013\2\n\0:\2\v\0013\2\f\0:\2\r\1>\0\2\1G\0\1\0\fautotag\1\0\1\venable\2\26context_commentstring\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\1\0\2\21use_languagetree\2\venable\2\21ensure_installed\1\0\0\1\14\0\0\15javascript\15typescript\btsx\bvue\thtml\bcss\tscss\tbash\blua\tjson\tyaml\vpython\ago\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: lsp-colors.nvim
time([[Config for lsp-colors.nvim]], true)
try_loadstring("\27LJ\1\0028\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\15lsp-colors\frequire\0", "config", "lsp-colors.nvim")
time([[Config for lsp-colors.nvim]], false)
-- Config for: barbar.nvim
time([[Config for barbar.nvim]], true)
try_loadstring("\27LJ\1\2¬\a\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0Œ\a    let bufferline = get(g:, 'bufferline', {})\n    let bufferline.icons = 'numbers'\n    let bufferline.maximum_padding = 2\n    let bufferline.no_name_title = '[Untitled]'\n\n    nnoremap <silent>    <A-w> :BufferClose<cr>\n    nnoremap <silent>    <A-a> :BufferPrevious<cr>\n    nnoremap <silent>    <A-s> :BufferNext<cr>\n\n    nnoremap <silent>    <A-<> :BufferMovePrevious<cr>\n    nnoremap <silent>    <A->> :BufferMoveNext<cr>\n\n    nnoremap <silent>    <leader>1 :BufferGoto 1<cr>\n    nnoremap <silent>    <leader>2 :BufferGoto 2<cr>\n    nnoremap <silent>    <leader>3 :BufferGoto 3<cr>\n    nnoremap <silent>    <leader>4 :BufferGoto 4<cr>\n    nnoremap <silent>    <leader>5 :BufferGoto 5<cr>\n    nnoremap <silent>    <leader>6 :BufferGoto 6<cr>\n    nnoremap <silent>    <leader>7 :BufferGoto 7<cr>\n    nnoremap <silent>    <leader>8 :BufferGoto 8<cr>\n    nnoremap <silent>    <leader>9 :BufferLast<cr>\n  \bcmd\bvim\0", "config", "barbar.nvim")
time([[Config for barbar.nvim]], false)
-- Config for: diffview.nvim
time([[Config for diffview.nvim]], true)
try_loadstring("\27LJ\1\2‚\6\0\0\a\0'\0_4\0\0\0%\1\1\0>\0\2\0027\0\2\0004\1\0\0%\2\3\0>\1\2\0027\1\4\0013\2\5\0003\3\6\0:\3\a\0023\3\b\0003\4\n\0\16\5\0\0%\6\t\0>\5\2\2:\5\v\4\16\5\0\0%\6\f\0>\5\2\2:\5\r\4\16\5\0\0%\6\14\0>\5\2\2:\5\15\4\16\5\0\0%\6\16\0>\5\2\2:\5\17\4:\4\18\0033\4\20\0\16\5\0\0%\6\19\0>\5\2\2:\5\21\4\16\5\0\0%\6\19\0>\5\2\2:\5\22\4\16\5\0\0%\6\23\0>\5\2\2:\5\24\4\16\5\0\0%\6\23\0>\5\2\2:\5\25\4\16\5\0\0%\6\26\0>\5\2\2:\5\27\4\16\5\0\0%\6\26\0>\5\2\2:\5\28\4\16\5\0\0%\6\26\0>\5\2\2:\5\29\4\16\5\0\0%\6\30\0>\5\2\2:\5\31\4\16\5\0\0%\6 \0>\5\2\2:\5!\4\16\5\0\0%\6\"\0>\5\2\2:\5#\4\16\5\0\0%\6$\0>\5\2\2:\5%\4\16\5\0\0%\6\t\0>\5\2\2:\5\v\4\16\5\0\0%\6\f\0>\5\2\2:\5\r\4\16\5\0\0%\6\14\0>\5\2\2:\5\15\4\16\5\0\0%\6\16\0>\5\2\2:\5\17\4:\4\a\3:\3&\2>\1\2\1G\0\1\0\17key_bindings\6R\18refresh_files\6U\16unstage_all\6S\14stage_all\6-\23toggle_stage_entry\18<2-LeftMouse>\6o\t<cr>\17select_entry\t<up>\6k\15prev_entry\v<down>\6j\1\0\0\15next_entry\tview\14<leader>b\17toggle_files\14<leader>e\16focus_files\f<s-tab>\22select_prev_entry\n<tab>\1\0\0\22select_next_entry\1\0\1\21disable_defaults\1\15file_panel\1\0\2\nwidth\3\25\14use_icons\2\1\0\1\18diff_binaries\1\nsetup\rdiffview\22diffview_callback\20diffview.config\frequire\0", "config", "diffview.nvim")
time([[Config for diffview.nvim]], false)
-- Config for: numb.nvim
time([[Config for numb.nvim]], true)
try_loadstring("\27LJ\1\0022\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\tnumb\frequire\0", "config", "numb.nvim")
time([[Config for numb.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\1\0029\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: winresizer
time([[Config for winresizer]], true)
try_loadstring("\27LJ\1\2>\0\0\2\0\4\0\0054\0\0\0007\0\1\0%\1\3\0:\1\2\0G\0\1\0\f<C-A-r>\25winresizer_start_key\6g\bvim\0", "config", "winresizer")
time([[Config for winresizer]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\1\2¼\2\0\0\3\0\a\0\v4\0\0\0%\1\1\0>\0\2\0027\1\2\0003\2\3\0>\1\2\0014\1\4\0007\1\5\1%\2\6\0>\1\2\1G\0\1\0É\1    nnoremap <silent><leader>cc <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<cr>\n    nnoremap <silent><leader>gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<cr>\n  \bcmd\bvim\1\0\1\29use_saga_diagnostic_sign\1\18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: packer.nvim
time([[Config for packer.nvim]], true)
try_loadstring("\27LJ\1\2­\1\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\4\api\27<cmd>PackerInstall<cr>\apu\26<cmd>PackerUpdate<cr>\apc\27<cmd>PackerCompile<cr>\aps\24<cmd>PackerSync<cr>\20map_leader_keys\15main.utils\frequire\0", "config", "packer.nvim")
time([[Config for packer.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\1\2]\0\1\5\0\6\1\f7\1\0\0\16\2\1\0007\1\1\0017\3\2\0007\4\2\0\20\4\0\4>\1\4\0024\2\3\0007\2\4\0023\3\5\0\16\4\1\0@\2\3\0\1\2\0\0\a{}\17tbl_contains\bvim\bcol\bsub\tline\4+\0\0\1\1\1\0\3+\0\0\0007\0\0\0@\0\1\0\2À\26check_break_line_charˆ\5\1\0\t\0\30\00184\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\0014\0\0\0%\1\3\0>\0\2\0027\0\2\0003\1\4\0003\2\5\0003\3\6\0:\3\a\0024\3\b\0007\3\t\3%\4\n\0%\5\v\0%\6\f\0>\3\4\2:\3\r\2:\2\14\1>\0\2\0014\0\0\0%\1\15\0>\0\2\0023\1\16\0004\2\0\0%\3\3\0>\2\2\0027\3\17\0022\4\3\0\16\5\0\0%\6\18\0%\a\18\0\16\b\1\0>\5\4\2\16\6\5\0007\5\19\0051\a\20\0>\5\3\0<\5\0\0>\3\2\0014\3\21\0001\4\23\0:\4\22\0034\3\0\0%\4\24\0>\3\2\0027\3\25\3%\4\26\0%\5\27\0%\6\28\0003\a\29\0>\3\5\0010\0\0€G\0\1\0\1\0\2\texpr\2\fnoremap\2\20v:lua.confirm()\t<cr>\6i\bmap\15main.utils\0\fconfirm\a_G\0\14with_pair\6 \14add_rules\1\5\0\0\15javascript\15typescript\20javascriptreact\20typescriptreact\24nvim-autopairs.rule\14fast_wrap\fpattern\5\b%s+\25 [%'%\"%)%>%]%)%}%,] \tgsub\vstring\nchars\1\6\0\0\6{\6[\6(\6\"\6'\1\0\5\fend_key\6$\bmap\n<M-e>\15hightlight\vSearch\tkeys\31qwertyuiopzxcvbnmasdfghjkl\16check_comma\2\1\0\3\17map_complete\2\rcheck_ts\2\vmap_cr\2\19nvim-autopairs\nsetup\20nvim-ts-autotag\frequire\3€€À™\4\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: vim-move
time([[Config for vim-move]], true)
try_loadstring("\27LJ\1\0022\0\0\2\0\3\0\0054\0\0\0007\0\1\0'\1\1\0:\1\2\0G\0\1\0\21move_auto_indent\6g\bvim\0", "config", "vim-move")
time([[Config for vim-move]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\1\2¨\1\0\0\6\0\n\0\0174\0\0\0%\1\1\0>\0\2\0027\1\2\0>\1\1\2\15\0\1\0T\2\t€4\2\3\0007\2\4\0027\2\5\2%\3\6\0007\4\a\1%\5\b\0$\3\5\0033\4\t\0>\2\3\1G\0\1\0\1\0\1\vdetach\2\b' &\18absolute_path\vopen '\rjobstart\afn\bvim\23get_node_at_cursor\18nvim-tree.lib\frequirel\0\0\2\0\5\0\f4\0\0\0%\1\1\0>\0\2\0027\0\2\0'\1\26\0>\0\2\0014\0\0\0%\1\3\0>\0\2\0027\0\4\0>\0\1\1G\0\1\0\vtoggle\14nvim-tree\15set_offset\21bufferline.state\frequirek\0\0\2\0\5\0\f4\0\0\0%\1\1\0>\0\2\0027\0\2\0'\1\0\0>\0\2\0014\0\0\0%\1\3\0>\0\2\0027\0\4\0>\0\1\1G\0\1\0\nclose\14nvim-tree\15set_offset\21bufferline.state\frequire¼\1\1\0\5\0\n\1\0261\0\0\0001\1\1\0004\2\2\0%\3\3\0>\2\2\0024\3\2\0%\4\4\0>\3\2\0027\4\5\2>\4\1\2\15\0\4\0T\5\3€\16\4\1\0>\4\1\1T\4\n€4\4\6\0007\4\a\0047\4\b\4\t\4\0\0T\4\3€\16\4\0\0>\4\1\1T\4\2€7\4\t\3>\4\1\1G\0\1\0\topen\21nvim_tree_follow\6g\bvim\rwin_open\18nvim-tree.lib\19nvim-tree.view\frequire\0\0\2¨\1\0\0\6\0\n\0\0174\0\0\0%\1\1\0>\0\2\0027\1\2\0>\1\1\2\15\0\1\0T\2\t€4\2\3\0007\2\4\0027\2\5\2%\3\6\0007\4\a\1%\5\b\0$\3\5\0033\4\t\0>\2\3\1G\0\1\0\1\0\1\vdetach\2\b' &\18absolute_path\vopen '\rjobstart\afn\bvim\23get_node_at_cursor\18nvim-tree.lib\frequire‚\1\0\0\4\0\a\0\0154\0\0\0007\0\1\0007\0\2\0>\0\1\0024\1\0\0007\1\1\0017\1\3\1\16\2\0\0%\3\4\0>\1\3\2\a\1\5\0T\1\2€%\1\6\0H\1\2\0G\0\1\0\6 \rNvimTree\aft\24nvim_buf_get_option\25nvim_get_current_buf\bapi\bvimÂ\23\1\0\6\0z\0ž\0024\0\0\0007\0\1\0004\1\2\0%\2\3\0>\1\2\0027\1\4\1%\2\6\0:\2\5\0'\2\25\0:\2\a\0'\2\1\0:\2\b\0003\2\n\0:\2\t\0003\2\f\0:\2\v\0'\2\0\0:\2\r\0'\2\0\0:\2\14\0'\2\0\0:\2\15\0'\2\1\0:\2\16\0'\2\1\0:\2\17\0'\2\0\0:\2\18\0'\2\1\0:\2\19\0'\2\0\0:\2\20\0%\2\22\0:\2\21\0'\2\0\0:\2\23\0'\2\1\0:\2\24\0'\2\0\0:\2\25\0'\2\1\0:\2\26\0'\2\0\0:\2\27\0'\2\1\0:\2\28\0003\2\30\0:\2\29\0003\2 \0003\3!\0:\3\"\2:\2\31\0001\2#\0005\2$\0002\2 \0003\3'\0003\4&\0:\4(\3\16\4\1\0%\5)\0>\4\2\2:\4*\3;\3\1\0023\3,\0003\4+\0:\4(\3\16\4\1\0%\5-\0>\4\2\2:\4*\3;\3\2\0023\3.\0\16\4\1\0%\5/\0>\4\2\2:\4*\3;\3\3\0023\0030\0\16\4\1\0%\0051\0>\4\2\2:\4*\3;\3\4\0023\0032\0\16\4\1\0%\0053\0>\4\2\2:\4*\3;\3\5\0023\0034\0\16\4\1\0%\0055\0>\4\2\2:\4*\3;\3\6\0023\0036\0\16\4\1\0%\0057\0>\4\2\2:\4*\3;\3\a\0023\0038\0\16\4\1\0%\0059\0>\4\2\2:\4*\3;\3\b\0023\3:\0\16\4\1\0%\5;\0>\4\2\2:\4*\3;\3\t\0023\3<\0\16\4\1\0%\5;\0>\4\2\2:\4*\3;\3\n\0023\3=\0\16\4\1\0%\5>\0>\4\2\2:\4*\3;\3\v\0023\3?\0\16\4\1\0%\5@\0>\4\2\2:\4*\3;\3\f\0023\3A\0\16\4\1\0%\5B\0>\4\2\2:\4*\3;\3\r\0023\3C\0\16\4\1\0%\5D\0>\4\2\2:\4*\3;\3\14\0023\3E\0\16\4\1\0%\5F\0>\4\2\2:\4*\3;\3\15\0023\3G\0\16\4\1\0%\5H\0>\4\2\2:\4*\3;\3\16\0023\3I\0\16\4\1\0%\5J\0>\4\2\2:\4*\3;\3\17\0023\3K\0\16\4\1\0%\5L\0>\4\2\2:\4*\3;\3\18\0023\3M\0\16\4\1\0%\5N\0>\4\2\2:\4*\3;\3\19\0023\3O\0\16\4\1\0%\5P\0>\4\2\2:\4*\3;\3\20\0023\3Q\0\16\4\1\0%\5R\0>\4\2\2:\4*\3;\3\21\0023\3S\0\16\4\1\0%\5T\0>\4\2\2:\4*\3;\3\22\0023\3U\0\16\4\1\0%\5V\0>\4\2\2:\4*\3;\3\23\0023\3W\0\16\4\1\0%\5X\0>\4\2\2:\4*\3;\3\24\0023\3Y\0\16\4\1\0%\5Z\0>\4\2\2:\4*\3;\3\25\0023\3[\0\16\4\1\0%\5\\\0>\4\2\2:\4*\3;\3\26\0023\3]\0\16\4\1\0%\5^\0>\4\2\2:\4*\3;\3\27\0023\3_\0\16\4\1\0%\5`\0>\4\2\2:\4*\3;\3\28\0023\3a\0\16\4\1\0%\5b\0>\4\2\2:\4*\3;\3\29\0023\3c\0\16\4\1\0%\5d\0>\4\2\2:\4*\3;\3\30\0023\3e\0\16\4\1\0%\5f\0>\4\2\2:\4*\3;\3\31\2:\2%\0002\2\0\0005\2g\0004\2g\0001\3i\0:\3h\0024\2g\0001\3k\0:\3j\0024\2g\0001\3m\0:\3l\0024\2\0\0007\2n\0027\2o\2%\3p\0)\4\1\0>\2\3\0014\2\2\0%\3q\0>\2\2\0027\2r\2%\3s\0%\4t\0%\5u\0>\2\4\0014\2\2\0%\3q\0>\2\2\0027\2r\2%\3s\0%\4v\0%\5w\0>\2\4\0014\2\2\0%\3q\0>\2\2\0027\2x\0023\3y\0>\2\2\1G\0\1\0\1\0\3\aet*<cmd>lua MUtils.toggle_nvimtree()<cr>\aef\30<cmd>NvimTreeFindFile<cr>\aer\29<cmd>NvimTreeRefresh<cr>\20map_leader_keys*<cmd>lua MUtils.nvimtree_osopen()<cr>\n<A-o>*<cmd>lua MUtils.toggle_nvimtree()<cr>\n<A-b>\6n\bmap\15main.utilsŠ\1\t\tau BufEnter,BufWinEnter,WinEnter,CmdwinEnter * if bufname('%') == \"NvimTree\" | set laststatus=0 | else | set laststatus=2 | endif\n\t\14nvim_exec\bapi\0\31update_nvimtree_statusline\0\20nvimtree_osopen\0\20toggle_nvimtree\vMUtils\16toggle_help\1\0\1\bkey\ag?\nclose\1\0\1\bkey\6q\vdir_up\1\0\1\bkey\6-\18next_git_item\1\0\1\bkey\a}c\18prev_git_item\1\0\1\bkey\a[c\23copy_absolute_path\1\0\1\bkey\agy\14copy_path\1\0\1\bkey\6Y\14copy_name\1\0\1\bkey\6y\npaste\1\0\1\bkey\6p\tcopy\1\0\1\bkey\6c\bcut\1\0\1\bkey\6x\16full_rename\1\0\1\bkey\t<C->\vrename\1\0\1\bkey\6r\vremove\1\0\1\bkey\6d\vcreate\1\0\1\bkey\6a\frefresh\1\0\1\bkey\6R\20toggle_dotfiles\1\0\1\bkey\6H\19toggle_ignored\1\0\1\bkey\6I\17last_sibling\1\0\1\bkey\6J\18first_sibling\1\0\1\bkey\6K\fpreview\1\0\1\bkey\n<Tab>\1\0\1\bkey\v<S-CR>\15close_node\1\0\1\bkey\t<BS>\16parent_node\1\0\1\bkey\6P\17next_sibling\1\0\1\bkey\6>\17prev_sibling\1\0\1\bkey\6<\vtabnew\1\0\1\bkey\n<C-t>\nsplit\1\0\1\bkey\n<C-x>\vvsplit\1\0\1\bkey\n<C-v>\acd\1\0\0\1\3\0\0\19<2-RightMouse>\n<C-}>\acb\tedit\bkey\1\0\0\1\6\0\0\t<CR>\6o\18<2-LeftMouse>\6l\6h\23nvim_tree_bindings\19NvimTreeOSOpen\0\vfolder\1\0\6\fdefault\bî—¿\15empty_open\bï„•\topen\bî—¾\nempty\bï„”\fsymlink\bï’‚\17symlink_open\bî—¾\1\0\2\fdefault\bî˜’\fsymlink\bï’\20nvim_tree_icons\1\0\3\ffolders\3\1\nfiles\3\1\bgit\3\0\25nvim_tree_show_icons\25nvim_tree_update_cwd\27nvim_tree_hijack_netrw\28nvim_tree_disable_netrw\27nvim_tree_add_trailing\27nvim_tree_allow_resize\23nvim_tree_tab_open\a:t#nvim_tree_root_folder_modifier%nvim_tree_highlight_opened_files\21nvim_tree_git_hl\28nvim_tree_hide_dotfiles\29nvim_tree_indent_markers\21nvim_tree_follow\27nvim_tree_quit_on_open\25nvim_tree_auto_close\24nvim_tree_auto_open\1\2\0\0\14dashboard\29nvim_tree_auto_ignore_ft\1\6\0\0\t.git\17node_modules\tdist\16Session.vim\r.undodir\21nvim_tree_ignore\24nvim_tree_gitignore\20nvim_tree_width\tleft\19nvim_tree_side\23nvim_tree_callback\21nvim-tree.config\frequire\6g\bvim\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
try_loadstring("\27LJ\1\2K\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\1\16hide_cursor\1\nsetup\14neoscroll\frequire\0", "config", "neoscroll.nvim")
time([[Config for neoscroll.nvim]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
try_loadstring("\27LJ\1\2ñ\1\0\1\n\1\t\3$7\1\0\0\14\0\1\0T\2\1€2\1\0\0007\2\1\1\14\0\2\0T\3\1€\16\2\1\0004\3\2\0\16\4\2\0>\3\2\4T\6\18€7\b\3\a\v\b\0\0T\b\15€7\b\4\a\b\b\0\0T\b\6€7\b\4\a\b\b\1\0T\b\3€7\b\4\a\t\b\2\0T\b\6€7\b\5\a%\t\6\0$\b\t\b:\b\3\a'\b\2\0:\b\a\aA\6\3\3N\6ì+\3\0\0007\3\b\3\16\4\0\0@\3\2\0\0À\21convert_lsp_orig\21insertTextFormat\v(${1})\nlabel\tkind\15insertText\vipairs\nitems\rresponse\4\6\b…\3\1\0\4\0\21\0\0294\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\5\0003\3\4\0:\3\6\0023\3\a\0:\3\b\0023\3\t\0:\3\n\0023\3\v\0:\3\f\2:\2\r\1>\0\2\0014\0\14\0007\0\15\0%\1\16\0>\0\2\0014\0\0\0%\1\17\0>\0\2\0027\1\19\0:\1\18\0001\1\20\0:\1\19\0000\0\0€G\0\1\0\0\16convert_lsp\21convert_lsp_orig\17compe.helper:autocmd User CompeConfirmDone :Lspsaga signature_help\bcmd\bvim\vsource\nvsnip\1\0\2\tkind\bï¬Œ\rpriority\3\3\rnvim_lsp\1\0\1\rpriority\3\2\tpath\1\0\1\rpriority\3\1\vbuffer\1\0\1\rnvim_lua\2\1\0\2\tkind\bï¬˜\rpriority\3\0\1\0\1\14preselect\valways\nsetup\ncompe\frequire\0", "config", "nvim-compe")
time([[Config for nvim-compe]], false)
-- Config for: lspkind-nvim
time([[Config for lspkind-nvim]], true)
try_loadstring("\27LJ\1\0025\0\2\6\0\3\0\0064\2\0\0007\2\1\2%\3\2\0\16\4\0\0\16\5\1\0@\2\4\0\f%s (%s)\vformat\vstringó\a\1\0\a\0L\0}1\0\0\0004\1\1\0%\2\2\0>\1\2\0027\1\3\0013\2\4\0003\3\a\0\16\4\0\0%\5\5\0%\6\6\0>\4\3\2:\4\b\3\16\4\0\0%\5\t\0%\6\n\0>\4\3\2:\4\v\3\16\4\0\0%\5\f\0%\6\r\0>\4\3\2:\4\14\3\16\4\0\0%\5\15\0%\6\16\0>\4\3\2:\4\17\3\16\4\0\0%\5\18\0%\6\19\0>\4\3\2:\4\20\3\16\4\0\0%\5\21\0%\6\22\0>\4\3\2:\4\23\3\16\4\0\0%\5\24\0%\6\25\0>\4\3\2:\4\26\3\16\4\0\0%\5\27\0%\6\28\0>\4\3\2:\4\29\3\16\4\0\0%\5\30\0%\6\31\0>\4\3\2:\4 \3\16\4\0\0%\5!\0%\6\"\0>\4\3\2:\4#\3\16\4\0\0%\5$\0%\6%\0>\4\3\2:\4&\3\16\4\0\0%\5'\0%\6(\0>\4\3\2:\4)\3\16\4\0\0%\5*\0%\6+\0>\4\3\2:\4,\3\16\4\0\0%\5-\0%\6.\0>\4\3\2:\4/\3\16\4\0\0%\0050\0%\0061\0>\4\3\2:\0042\3\16\4\0\0%\0053\0%\0064\0>\4\3\2:\0045\3\16\4\0\0%\0056\0%\0067\0>\4\3\2:\0048\3\16\4\0\0%\0059\0%\6:\0>\4\3\2:\4;\3\16\4\0\0%\5<\0%\6=\0>\4\3\2:\4>\3\16\4\0\0%\5?\0%\6@\0>\4\3\2:\4A\3\16\4\0\0%\5B\0%\6C\0>\4\3\2:\4D\3\16\4\0\0%\5E\0%\6F\0>\4\3\2:\4G\3\16\4\0\0%\5H\0%\6I\0>\4\3\2:\4J\3:\3K\2>\1\2\1G\0\1\0\15symbol_map\tText\ttext\bî˜’\vFolder\vfolder\bî—¾\tFile\tfile\bïƒ¶\nColor\ncolor\bîˆ«\fSnippet\fsnippet\bï™\18TypeParameter\19type parameter\bï‰¸\rOperator\roperator\bï™¯\fKeyword\fkeyword\bï‚„\nValue\nvalue\bï¢£\tUnit\tunit\bï‘µ\vModule\vmodule\bï™§\15EnumMember\16enum member\bï€«\tEnum\tenum\bïµ\14Interface\14interface\bï’’\rFunction\rfunction\bïž”\rVariable\rvariable\bïœ›\rConstant\rconstant\bï£¿\rProperty\rproperty\bïƒƒ\nField\nfield\bîœ–\vMethod\vmethod\bïš¦\16Constructor\16constructor\bîŠš\nClass\nclass\bïƒ¨\vStruct\1\0\0\vstruct\bï­„\1\0\1\14with_text\1\tinit\flspkind\frequire\0\0", "config", "lspkind-nvim")
time([[Config for lspkind-nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\1\2®\n\0\0\5\0+\0H4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1 \0003\2\4\0003\3\3\0:\3\5\0023\3\a\0003\4\6\0:\4\b\0033\4\t\0:\4\n\3:\3\v\0024\3\0\0%\4\f\0>\3\2\0027\3\r\3:\3\14\0022\3\0\0:\3\15\0024\3\0\0%\4\f\0>\3\2\0027\3\16\3:\3\17\0022\3\0\0:\3\18\0023\3\19\0:\3\20\0023\3\21\0:\3\22\0024\3\0\0%\4\23\0>\3\2\0027\3\24\0037\3\25\3:\3\26\0024\3\0\0%\4\23\0>\3\2\0027\3\27\0037\3\25\3:\3\28\0024\3\0\0%\4\23\0>\3\2\0027\3\29\0037\3\25\3:\3\30\0024\3\0\0%\4\23\0>\3\2\0027\3\31\3:\3\31\2:\2!\0013\2#\0003\3\"\0:\3$\0023\3&\0003\4%\0:\4'\3:\3(\2:\2)\1>\0\2\0014\0\0\0%\1\1\0>\0\2\0027\0*\0%\1$\0>\0\2\1G\0\1\0\19load_extension\15extensions\16media_files\14filetypes\1\0\1\rfind_cmd\arg\1\5\0\0\bpng\twebp\bjpg\tjpeg\bfzf\1\0\0\1\0\4\28override_generic_sorter\1\14case_mode\15smart_case\25override_file_sorter\2\nfuzzy\2\rdefaults\1\0\0\27buffer_previewer_maker\21qflist_previewer\22vim_buffer_qflist\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\fset_env\1\0\1\14COLORTERM\14truecolor\16borderchars\1\t\0\0\bâ”€\bâ”‚\bâ”€\bâ”‚\bâ”Œ\bâ”\bâ”˜\bâ””\vborder\19generic_sorter\29get_generic_fuzzy_sorter\25file_ignore_patterns\16file_sorter\19get_fuzzy_file\22telescope.sorters\18layout_config\rvertical\1\0\1\vmirror\2\15horizontal\1\0\3\vheight\4š³æÌ\t™³¦ÿ\3\19preview_cutoff\3x\nwidth\4×ÇÂë\3Š®¯ÿ\3\1\0\3\18preview_width\4š³æÌ\t™³†ÿ\3\20prompt_position\btop\18results_width\4š³æÌ\t™³¦ÿ\3\22vimgrep_arguments\1\0\v\23selection_strategy\nreset\20layout_strategy\15horizontal\ruse_less\2\17entry_prefix\a  \21sorting_strategy\14ascending\18prompt_prefix\v ï€‚  \17initial_mode\vinsert\rwinblend\3\0\17path_display\2\19color_devicons\2\20selection_caret\a  \1\b\0\0\arg\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\1\2—\4\0\0\4\0\16\0\0194\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\14\0003\2\4\0003\3\3\0:\3\5\0023\3\6\0:\3\a\0023\3\b\0:\3\t\0023\3\n\0:\3\v\0023\3\f\0:\3\r\2:\2\15\1>\0\2\1G\0\1\0\nsigns\1\0\0\17changedelete\1\0\4\ttext\bïƒ—\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\ttext\bïƒ˜\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\ttext\bïƒ—\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\ttext\bâ”ƒ\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\ttext\bâ”ƒ\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: vim-vsnip
time([[Config for vim-vsnip]], true)
try_loadstring("\27LJ\1\2ô\4\0\0\a\0\21\0=3\0\0\0004\1\1\0007\1\2\0017\1\3\1\16\2\1\0%\3\4\0%\4\5\0%\5\6\0\16\6\0\0>\2\5\1\16\2\1\0%\3\a\0%\4\5\0%\5\6\0\16\6\0\0>\2\5\1\16\2\1\0%\3\4\0%\4\b\0%\5\t\0\16\6\0\0>\2\5\1\16\2\1\0%\3\a\0%\4\b\0%\5\t\0\16\6\0\0>\2\5\1\16\2\1\0%\3\4\0%\4\n\0%\5\v\0\16\6\0\0>\2\5\1\16\2\1\0%\3\a\0%\4\n\0%\5\v\0\16\6\0\0>\2\5\1\16\2\1\0%\3\4\0%\4\f\0%\5\r\0\16\6\0\0>\2\5\1\16\2\1\0%\3\a\0%\4\f\0%\5\r\0\16\6\0\0>\2\5\0014\2\1\0007\2\14\0023\3\17\0003\4\16\0:\4\18\0033\4\19\0:\4\20\3:\3\15\2G\0\1\0\20typescriptreact\1\2\0\0\15typescript\20javascriptreact\1\0\0\1\2\0\0\15javascript\20vsnip_filetypes\6g?vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'\f<S-Tab><vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'\n<Tab>Bvsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'\n<C-l>\6s:vsnip#expandable() ? '<Plug>(vsnip-expand)' : '<C-j>'\n<C-j>\6i\20nvim_set_keymap\bapi\bvim\1\0\1\texpr\2\0", "config", "vim-vsnip")
time([[Config for vim-vsnip]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\1\2ë\r\0\0\6\0L\0€\0013\0\0\0004\1\1\0%\2\2\0>\1\2\0027\1\3\0013\2J\0003\3\a\0003\4\4\0007\5\5\0:\5\6\4:\4\b\0033\4\t\0007\5\n\0:\5\6\4:\4\v\0033\4\f\0007\5\r\0:\5\6\4:\4\14\0033\4\15\0007\5\n\0:\5\6\4:\4\16\0033\4\17\0007\5\5\0:\5\6\4:\4\18\0033\4\19\0007\5\20\0:\5\6\4:\4\21\0033\4\22\0007\5\20\0:\5\6\4:\4\23\0033\4\24\0:\4\25\0033\4\26\0007\5\27\0:\5\6\4:\4\28\0033\4\29\0007\5\27\0:\5\6\4:\4\30\0033\4\31\0007\5\27\0:\5\6\4:\4 \0033\4!\0007\5\n\0:\5\6\4:\4\"\0033\4#\0007\5\n\0:\5\6\4:\4$\0033\4%\0007\5&\0:\5\6\4:\4'\0033\4(\0007\5&\0:\5\6\4:\4)\0033\4*\0007\5+\0:\5\6\4:\4,\0033\4-\0007\5+\0:\5\6\4:\4.\0033\4/\0007\5\n\0:\5\6\4:\0040\0033\0041\0007\5&\0:\5\6\4:\0042\0033\0043\0007\5\5\0:\5\6\4:\0044\0033\0045\0007\5\5\0:\5\6\4:\0046\0033\0047\0007\0058\0:\5\6\4:\0049\0033\4:\0007\5\5\0:\5\6\4:\4;\0033\4<\0007\5\n\0:\5\6\4:\4=\0033\4>\0007\5+\0:\5\6\4:\4?\0033\4@\0007\5+\0:\5\6\4:\4A\0033\4B\0007\5+\0:\5\6\4:\4C\0033\4D\0007\5+\0:\5\6\4:\4E\0033\4F\0007\5\5\0:\5\6\4:\4G\0033\4H\0007\5\r\0:\5\6\4:\4I\3:\3K\2>\1\2\1G\0\1\0\roverride\1\0\0\tjson\1\0\2\ticon\bï¬¥\tname\tjson\15.gitignore\1\0\2\ticon\bîœ‚\tname\14gitignore\bmdx\1\0\2\ticon\bï’Š\tname\bmdx\rmarkdown\1\0\2\ticon\bï’Š\tname\rmarkdown\amd\1\0\2\ticon\bï’Š\tname\amd\ash\1\0\2\ticon\bîž•\tname\ash\blua\1\0\2\ticon\bî˜ \tname\blua\brpm\1\0\2\ticon\bïŒ–\tname\brpm\bdeb\tcyan\1\0\2\ticon\bïŒ†\tname\bdeb\axz\1\0\2\ticon\bï‡†\tname\axz\bzip\1\0\2\ticon\bï‡†\tname\bzip\tlock\1\0\2\ticon\bï ½\tname\tlock\ttoml\1\0\2\ticon\bï€“\tname\ttoml\apy\1\0\2\ticon\bî˜†\tname\apy\bvue\ngreen\1\0\2\ticon\bïµ‚\tname\bvue\aru\1\0\2\ticon\bï»\tname\aru\arb\bred\1\0\2\ticon\bï»\tname\arb\15dockerfile\1\0\2\ticon\bïŒˆ\tname\15Dockerfile\15Dockerfile\1\0\2\ticon\bïŒˆ\tname\15Dockerfile\bout\1\0\2\ticon\bî˜’\tname\bout\bmp4\1\0\2\ticon\bï…„\tname\bmp4\bmp3\nwhite\1\0\2\ticon\bï¢…\tname\bmp3\tjpeg\1\0\3\ncolor\18colors.purple\ticon\bïŽ\tname\tjpeg\bjpg\1\0\2\ticon\bïŽ\tname\bjpg\bpng\vpurple\1\0\2\ticon\bïŽ\tname\bpng\akt\1\0\2\ticon\tó±ˆ™\tname\akt\ats\1\0\2\ticon\bï¯¤\tname\ats\ajs\vyellow\1\0\2\ticon\bï \tname\ajs\bcss\tblue\1\0\2\ticon\bî‰\tname\bcss\thtml\1\0\0\ncolor\vorange\1\0\2\ticon\bï„»\tname\thtml\nsetup\22nvim-web-devicons\frequire\1\0\21\fpurple2\f#C678DD\ngrey3\f#565357\ngrey1\f#383539\vyellow\f#FFD866\16white_dark4\f#ABB2BF\16white_dark5\f#747474\ngrey2\f#403E41\vorange\f#FC9867\16white_dark3\f#939293\bred\f#E06C75\15grey_dark2\f#221F22\16white_dark1\f#5B595C\nwhite\f#FCFCFA\tblue\f#78DCE8\nblack\f#2D2A2E\16white_dark2\f#727072\ngreen\f#A9DC76\tpink\f#FF6188\15grey_dark1\f#19181A\tcyan\f#18FF9E\vpurple\f#AB9DF2\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\1\2Â\n\0\2\n\0'\0f3\2\0\0:\1\1\0027\3\2\0007\3\3\3\15\0\3\0T\4\20€4\3\4\0007\3\5\0037\3\6\3%\4\a\0>\3\2\0014\3\4\0007\3\5\0037\3\6\3%\4\b\0>\3\2\0014\3\4\0007\3\5\0037\3\6\3%\4\t\0>\3\2\0014\3\4\0007\3\5\0037\3\6\3%\4\n\0>\3\2\0017\3\2\0007\3\v\3\15\0\3\0T\4\6€4\3\4\0007\3\5\0037\3\f\3%\4\r\0)\5\1\0>\3\3\0014\3\14\0%\4\15\0>\3\2\0027\3\16\0033\4\17\0\16\5\3\0%\6\18\0%\a\19\0%\b\20\0\16\t\4\0>\5\5\1\16\5\3\0%\6\18\0%\a\21\0%\b\22\0\16\t\4\0>\5\5\1\16\5\3\0%\6\18\0%\a\23\0%\b\24\0\16\t\4\0>\5\5\1\16\5\3\0%\6\18\0%\a\25\0%\b\26\0\16\t\4\0>\5\5\1\16\5\3\0%\6\18\0%\a\27\0%\b\28\0\16\t\4\0>\5\5\1\16\5\3\0%\6\18\0%\a\29\0%\b\30\0\16\t\4\0>\5\5\1\16\5\3\0%\6\18\0%\a\31\0%\b \0\16\t\4\0>\5\5\1\16\5\3\0%\6\18\0%\a!\0%\b\"\0\16\t\4\0>\5\5\1\16\5\3\0%\6\18\0%\a#\0%\b$\0\16\t\4\0>\5\5\1\16\5\3\0%\6\18\0%\a%\0%\b&\0\16\t\4\0>\5\5\1G\0\1\0\30<cmd>LspTroubleToggle<cr>\r<space>q*<cmd>lua vim.lsp.buf.references()<cr>\agr+<cmd>lua vim.lsp.buf.code_action()<cr>\14<space>ca&<cmd>lua vim.lsp.buf.rename()<cr>\14<space>rn/<cmd>lua vim.lsp.buf.type_definition()<cr>\r<space>D.<cmd>lua vim.lsp.buf.signature_help()<cr>\n<C-k>%<cmd>lua vim.lsp.buf.hover()<cr>\6K.<cmd>lua vim.lsp.buf.implementation()<cr>\agi*<cmd>lua vim.lsp.buf.definition()<cr>\agd+<cmd>lua vim.lsp.buf.declaration()<cr>\agD\6n\1\0\2\fnoremap\2\vsilent\2\bmap\15main.utils\frequireù\1        augroup lsp_document_highlight\n          autocmd! * <buffer>\n          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()\n          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()\n        augroup END\n      \14nvim_exec\23document_highlight\16augroup END?autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()\24autocmd! * <buffer>\19augroup Format\17nvim_command\bapi\bvim\24document_formatting\26resolved_capabilities\vbuffer\1\0\0¥\2\0\0\4\1\15\0\0224\0\0\0007\0\1\0007\0\2\0007\0\3\0>\0\1\0027\1\4\0007\1\5\0017\1\6\1)\2\2\0:\2\a\0017\1\4\0007\1\5\0017\1\6\0013\2\n\0003\3\t\0:\3\v\2:\2\b\0013\1\f\0:\0\r\1+\2\0\0:\2\14\1H\1\2\0\0À\14on_attach\17capabilities\1\0\0\15properties\1\0\0\1\4\0\0\18documentation\vdetail\24additionalTextEdits\19resolveSupport\19snippetSupport\19completionItem\15completion\17textDocument\29make_client_capabilities\rprotocol\blsp\bvim¢\1\0\1\4\0\a\0\21\16\2\0\0007\1\0\0%\3\1\0>\1\3\2\n\1\0\0T\1\2€)\1\0\0H\1\2\0004\1\2\0%\2\3\0>\1\2\0027\2\4\1\16\3\0\0>\2\2\2\14\0\2\0T\3\4€7\2\5\0017\2\6\2\16\3\0\0>\2\2\2H\2\2\0\fdirname\tpath\22find_git_ancestor\19lspconfig/util\frequire\15lush_theme\nmatchA\0\1\3\0\2\0\0047\1\0\0)\2\1\0:\2\1\1G\0\1\0\24document_formatting\26resolved_capabilitiesú\2\1\0\r\1\19\00014\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\0014\0\0\0%\1\3\0>\0\2\0024\1\0\0%\2\1\0>\1\2\0027\1\4\1>\1\1\0024\2\5\0\16\3\1\0>\2\2\4D\5\29€+\a\0\0>\a\1\2\a\6\6\0T\b\6€4\b\0\0%\t\a\0>\b\2\2:\b\b\a1\t\n\0:\t\t\a\a\6\v\0T\b\t€4\b\f\0007\b\r\b%\t\14\0\16\n\a\0004\v\0\0%\f\15\0>\v\2\0=\b\2\2\16\a\b\0\a\6\16\0T\b\2€1\b\18\0:\b\17\a6\b\6\0007\b\2\b\16\t\a\0>\b\2\1B\5\3\3N\5áG\0\1\0\1À\0\14on_attach\15typescript\24specs.lspconfig.efm\nforce\15tbl_extend\bvim\befm\0\rroot_dir\rsettings\28specs.lspconfig.luaconf\blua\npairs\22installed_servers\14lspconfig\nsetup\15lspinstall\frequire5\0\0\2\1\3\0\a+\0\0\0>\0\1\0014\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0\2À\fbufdo e\bcmd\bvim`\1\0\5\0\a\0\f1\0\0\0001\1\1\0001\2\2\0\16\3\2\0>\3\1\0014\3\3\0%\4\4\0>\3\2\0021\4\6\0:\4\5\0030\0\0€G\0\1\0\0\22post_install_hook\15lspinstall\frequire\0\0\0\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: FTerm.nvim
time([[Config for FTerm.nvim]], true)
try_loadstring('\27LJ\1\2Ü\2\0\0\a\0\14\0\0264\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\0014\0\0\0%\1\6\0>\0\2\0027\0\a\0003\1\b\0\16\2\0\0%\3\t\0%\4\n\0%\5\v\0\16\6\1\0>\2\5\1\16\2\0\0%\3\f\0%\4\n\0%\5\r\0\16\6\1\0>\2\5\1G\0\1\0005<C-\\><C-n><cmd>lua require("FTerm").toggle()<cr>\6t+<cmd>lua require("FTerm").toggle()<cr>\n<A-i>\6n\1\0\2\vsilent\2\fnoremap\2\bmap\15main.utils\15dimensions\1\0\1\vborder\vsingle\1\0\4\6x\4\0€€€ÿ\3\vheight\4š³æÌ\t™³¦ÿ\3\nwidth\4š³æÌ\t™³¦ÿ\3\6y\4\0€€€ÿ\3\nsetup\nFTerm\frequire\0', "config", "FTerm.nvim")
time([[Config for FTerm.nvim]], false)
-- Config for: monokai
time([[Config for monokai]], true)
try_loadstring("\27LJ\1\0027\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0\24colorscheme monokai\bcmd\bvim\0", "config", "monokai")
time([[Config for monokai]], false)
-- Conditional loads
time("Condition for { 'AutoSave.nvim' }", true)
if
try_loadstring("\27LJ\1\2;\0\0\1\0\3\0\t4\0\0\0007\0\1\0007\0\2\0\n\0\2\0T\0\2€)\0\1\0T\1\1€)\0\2\0H\0\2\0\14auto_save\6g\bvim\0", "condition", '{ "AutoSave.nvim" }')
then
time("Condition for { 'AutoSave.nvim' }", false)
time([[packadd for AutoSave.nvim]], true)
		vim.cmd [[packadd AutoSave.nvim]]
	time([[packadd for AutoSave.nvim]], false)
	-- Config for: AutoSave.nvim
	time([[Config for AutoSave.nvim]], true)
	try_loadstring("\27LJ\1\2ß\2\0\0\6\0\18\0\0254\0\0\0%\1\1\0>\0\2\0027\1\2\0003\2\6\0004\3\3\0007\3\4\0037\3\5\3:\3\a\2%\3\b\0004\4\3\0007\4\t\0047\4\n\4%\5\v\0>\4\2\2$\3\4\3:\3\f\0023\3\r\0:\3\14\0023\3\15\0002\4\0\0:\4\16\3:\3\17\2>\1\2\1G\0\1\0\15conditions\20filetype_is_not\1\0\2\15modifiable\2\vexists\2\vevents\1\2\0\0\16InsertLeave\22execution_message\r%H:%M:%S\rstrftime\afn\19autosaved at: \fenabled\1\0\3\22write_all_buffers\1\20on_off_commands\2 clean_command_line_interval\3Ä\19\14auto_save\6g\bvim\nsetup\rautosave\frequire\0", "config", "AutoSave.nvim")
	time([[Config for AutoSave.nvim]], false)
else
time("Condition for { 'AutoSave.nvim' }", false)
end
time("Condition for { 'fzf.vim' }", true)
if
try_loadstring("\27LJ\1\2J\0\0\2\0\4\1\v4\0\0\0007\0\1\0007\0\2\0%\1\3\0>\0\2\2\b\0\0\0T\0\2€)\0\1\0T\1\1€)\0\2\0H\0\2\0\bfzf\15executable\afn\bvim\2\0", "condition", '{ "fzf.vim" }')
then
time("Condition for { 'fzf.vim' }", false)
time([[packadd for fzf.vim]], true)
		vim.cmd [[packadd fzf.vim]]
	time([[packadd for fzf.vim]], false)
else
time("Condition for { 'fzf.vim' }", false)
end
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd vim-commentary ]]

-- Config for: vim-commentary
try_loadstring("\27LJ\1\2\v\0\0\1\0\0\0\1G\0\1\0\0", "config", "vim-commentary")

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file DashboardNewFile lua require("packer.load")({'dashboard-nvim'}, { cmd = "DashboardNewFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file Dashboard lua require("packer.load")({'dashboard-nvim'}, { cmd = "Dashboard", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file SessionSave lua require("packer.load")({'dashboard-nvim'}, { cmd = "SessionSave", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file SessionLoad lua require("packer.load")({'dashboard-nvim'}, { cmd = "SessionLoad", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command! -nargs=* -range -bang -complete=file DashboardJumpMarks lua require("packer.load")({'dashboard-nvim'}, { cmd = "DashboardJumpMarks", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufRead * ++once lua require("packer.load")({'indent-blankline.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
