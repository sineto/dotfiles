" vim:fdm=marker
" Vim Color File
" Name:       monokai-free.vim
" Maintainer: https://github.com/sinetoami/monokai-free.vim/
" License:    The MIT License (MIT)
" Based On:   https://github.com/MaxSt/FlatColor/

highlight clear
if exists("syntax_on")
  syntax reset
endif

set t_Co=256
set background=dark
let g:colors_name="monokai"


""" Set to "256" for 256-color terminals, or
""" set to "16" to use your terminal emulator's native colors
" if !exists("g:monokai_termcolors")
"   let g:monokai_termcolors = 256
" endif


" Not all terminals support italics properly. If yours does, opt-in.
if !exists("g:monokai_italics")
  let g:monokai_italics = 1
endif


""" CONFIGURATION {{{
" This function is based on one from FlatColor: https://github.com/joshdick/onedark.vim
" Which in turn was based on one from FlatColor: https://github.com/MaxSt/FlatColor/
" Which in turn was based on one found in hemisu: https://github.com/noahfrederick/vim-hemisu/

function! s:h(group, style)
  if g:monokai_italics == 0
    if has_key(a:style, "cterm") && a:style["cterm"] == "italic"
      unlet a:style.cterm
    endif
    if has_key(a:style, "gui") && a:style["gui"] == "italic"
      unlet a:style.gui
    endif
  endif

  let l:ctermfg = (has_key(a:style, "fg")   ? a:style.fg.cterm : "NONE")
  let l:ctermbg = (has_key(a:style, "bg")   ? a:style.bg.cterm : "NONE")

  execute "highlight" a:group
        \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
        \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
        \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
        \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
        \ "ctermfg=" . l:ctermfg
        \ "ctermbg=" . l:ctermbg
        \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

""" }}}


""" COLORS {{{

let s:colors = monokai#palette(get(g:, 'monokai_theme', 'default'))

let s:white   = s:colors.white
let s:black   = s:colors.black
let s:red     = s:colors.red
let s:pink    = s:colors.pink
let s:orange  = s:colors.orange
let s:yellow  = s:colors.yellow
let s:green   = s:colors.green
let s:blue    = s:colors.blue
let s:purple  = s:colors.purple
let s:cyan    = s:colors.cyan

let s:fg      = s:white
let s:bg      = s:black

let s:fg1     = s:colors.white_dark1 " LineNr
let s:fg2     = s:colors.white_dark2 " Comment
let s:fg3     = s:colors.white_dark3 " Braces/Brackets/Parens
let s:fg4     = s:colors.white_dark4
let s:fg5     = s:colors.white_dark5

let s:bg1     = s:colors.grey1 " CursorLine
let s:bg2     = s:colors.grey2 " Search
let s:bg3     = s:colors.grey3

let s:bg_dark1 = s:colors.grey_dark1
let s:bg_dark2 = s:colors.grey_dark2

let s:purple2 = s:colors.purple2

let g:terminal_ansi_colors = [
  \ s:black.gui, s:red.gui, s:green.gui, s:yellow.gui,
  \ s:blue.gui, s:purple.gui, s:cyan.gui, s:white.gui
\]
""" }}}


""" {{{ DEFAULT HIGHLIGHT
call monokai#highlight('Fg', { 'fg': s:fg })
call monokai#highlight('Fg1', { 'fg': s:fg1 })
call monokai#highlight('Fg4', { 'fg': s:fg4 })
call monokai#highlight('Black', { 'fg': s:black })
call monokai#highlight('Red', { 'fg': s:red })
call monokai#highlight('Pink', { 'fg': s:pink })
call monokai#highlight('Orange', { 'fg': s:orange })
call monokai#highlight('Yellow', { 'fg': s:yellow })
call monokai#highlight('Green', { 'fg': s:green })
call monokai#highlight('Blue', { 'fg': s:blue })
call monokai#highlight('Purple', { 'fg': s:purple })
call monokai#highlight('Cyan', { 'fg': s:cyan })

call monokai#highlight('FgItalic', { 'fg': s:fg, 'gui': 'italic' })
call monokai#highlight('Fg4Italic', { 'fg': s:fg4, 'gui': 'italic' })
call monokai#highlight('BlackItalic', { 'fg': s:black, 'gui': 'italic' })
call monokai#highlight('RedItalic', { 'fg': s:red, 'gui': 'italic' })
call monokai#highlight('PinkItalic', { 'fg': s:pink, 'gui': 'italic' })
call monokai#highlight('OrangeItalic', { 'fg': s:orange, 'gui': 'italic' })
call monokai#highlight('YellowItalic', { 'fg': s:yellow, 'gui': 'italic' })
call monokai#highlight('GreenItalic', { 'fg': s:green, 'gui': 'italic' })
call monokai#highlight('BlueItalic', { 'fg': s:blue, 'gui': 'italic' })
call monokai#highlight('PurpleItalic', { 'fg': s:purple, 'gui': 'italic' })
call monokai#highlight('CyanItalic', { 'fg': s:cyan, 'gui': 'italic' })
""" }}}


""" USER INTERFACE HIGHLIGHT GROUPS {{{
call monokai#highlight("Normal", { "fg": s:fg, "bg": s:bg })            " normal text
call monokai#highlight("NonText", { "fg": s:bg, "bg": s:bg })          " '~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).

call monokai#highlight("Cursor", { "fg": s:bg, "bg": s:fg })            " the character under the cursor
call monokai#highlight("CursorColumn", { "fg": s:bg1, "bg": s:bg })     " the screen column that the cursor is in when 'cursorcolumn' is set
call monokai#highlight("CursorLine", { "bg": s:bg1 })                   " the screen line that the cursor is in when 'cursorline' is set

call monokai#highlight("LineNr", { "fg": s:fg1, "bg": s:bg })           " Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
call monokai#highlight("CursorLineNr", { "fg": s:yellow, "bg": s:bg , "gui": "bold"}) " Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.

call monokai#highlight("DiffAdd", { "fg": s:green, "bg": s:bg })        " diff mode: Added line
call monokai#highlight("DiffChange", { "fg": s:yellow, "bg": s:bg })    " diff mode: Changed line
call monokai#highlight("DiffDelete", { "fg": s:red, "bg": s:bg })       " diff mode: Deleted line
call monokai#highlight("DiffText", { "fg": s:yellow, "bg": s:bg })      " diff mode: Changed text within a changed line

call monokai#highlight("IncSearch", { "bg": s:bg3 })                    " 'incsearch' highlighting; also used for the text replaced with ":s///c"
call monokai#highlight("Search", { "bg": s:bg3 })                       " Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.

call monokai#highlight("ErrorMsg", { "fg": s:red })                     " error messages on the command line
call monokai#highlight("ModeMsg", { "fg": s:fg, "gui": "bold" })        " 'showmode' message (e.g., "-- INSERT --")
call monokai#highlight("MoreMsg", { "fg": s:green, "gui": "bold" })       " more-prompt
call monokai#highlight("WarningMsg", { "fg": s:yellow })                " warning messages
call monokai#highlight("Question", { "fg": s:purple })                  " hit-enter prompt and yes/no questions

call monokai#highlight("Pmenu", { "fg": s:fg3,"bg": s:bg_dark2 })            " Popup menu: normal item.
call monokai#highlight("PmenuSel", { "fg": s:fg,"bg": s:bg, "gui": "bold" }) " Popup menu: selected item.
call monokai#highlight("PmenuSbar", { "bg": s:bg_dark2 })                    " Popup menu: scrollbar.
call monokai#highlight("PmenuThumb", { "bg": s:bg2 })                   " Popup menu: Thumb of the scrollbar.

call monokai#highlight("SpellBad", { "fg": s:red, "gui": "bold" })      " Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
call monokai#highlight("SpellCap", { "fg": s:yellow })                  " Word that should start with a capital. This will be combined with the highlighting used otherwise.
call monokai#highlight("SpellLocal", { "fg": s:yellow })
call monokai#highlight("SpellRare", { "fg": s:yellow })

call monokai#highlight("StatusLine", { "fg": s:fg3, "bg": s:bg_dark2 }) " status line of current window
call monokai#highlight("StatusLineNC", { "fg": s:fg2, "bg": s:bg_dark1 }) " status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
" call monokai#highlight("TabLine", { "fg":, "bg": }) " tab pages line, not active tab page label
" call monokai#highlight("TabLineFill", s:comment_fg, s:cursor_line, "") " tab pages line, where there are no labels
" call monokai#highlight("TabLineSel", s:fg, s:bg, "") " tab pages line, active tab page label

call monokai#highlight("Visual", { "bg": s:bg2 })
call monokai#highlight("VisualNOS", { "bg": s:bg2 })

call monokai#highlight("ColorColumn", { "bg": s:bg1 })
call monokai#highlight("SignColumn", { "bg": s:bg }) " backaground from where gutters are stayed
" call monokai#highlight("Conceal", s:fg, "", "")
" call monokai#highlight("Directory", s:blue, "", "")
call monokai#highlight("VertSplit", { "fg": s:bg_dark1 })
call monokai#highlight("Folded", { "fg": s:fg2 })
" call monokai#highlight("FoldColumn", s:fg, "", "")
" call monokai#highlight("SignColumn", s:fg, "", "")

call monokai#highlight("MatchParen", { "fg": s:fg, "bg": s:bg3, "gui": "bold" })
call monokai#highlight("SpecialKey", { "fg": s:purple, "gui": "italic" }) " text used to show unprintable characters in the tex
call monokai#highlight("Title", { "fg": s:yellow }) " titles for output from ":set all", ":autocmd" etc.
" call monokai#highlight("WildMenu", s:fg, "", "")
""" }}}


""" SYNTAX GROUPS {{{
call monokai#highlight("Comment", { "fg": s:fg2, "gui": "italic" })
call monokai#highlight("Constant", { "fg": s:purple })
call monokai#highlight("String", { "fg": s:yellow })
call monokai#highlight("Character", { "fg": s:pink })
call monokai#highlight("Number", { "fg": s:purple })
call monokai#highlight("Boolean", { "fg": s:purple })
call monokai#highlight("Float", { "fg": s:purple })

call monokai#highlight("Identifier", { "fg": s:blue })
call monokai#highlight("Function", { "fg": s:green })
call monokai#highlight("Statement", { "fg": s:pink })

call monokai#highlight("Conditional", { "fg": s:pink })
call monokai#highlight("Repeat", { "fg": s:pink })
call monokai#highlight("Label", { "fg": s:purple })
call monokai#highlight("Operator", { "fg": s:pink })
call monokai#highlight("Keyword", { "fg": s:pink })
call monokai#highlight("Exception", { "fg": s:pink })

call monokai#highlight("PreProc", { "fg": s:fg3 })
call monokai#highlight("Include", { "fg": s:pink })
call monokai#highlight("Define", { "fg": s:pink })
call monokai#highlight("Macro", { "fg": s:pink })
call monokai#highlight("PreCondit", { "fg": s:yellow })

call monokai#highlight("Type", { "fg": s:blue })
call monokai#highlight("StorageClass", { "fg": s:pink })
call monokai#highlight("Structure", { "fg": s:pink })
call monokai#highlight("Typedef", { "fg": s:pink })

call monokai#highlight("Brackets", { "fg": s:fg3 })
call monokai#highlight("Special", { "fg": s:purple2 })
call monokai#highlight("SpecialChar", { "fg": s:purple2 })
call monokai#highlight("Tag", { "fg": s:orange })
call monokai#highlight("Delimiter", { "fg": s:fg3 })
call monokai#highlight("SpecialComment", { "fg": s:fg2 })
call monokai#highlight("Debug", { "fg": s:red })
call monokai#highlight("Underlined", { "fg": s:fg, "gui": "underline" })
call monokai#highlight("Ignore", { "fg": s:fg })
call monokai#highlight("Error", { "fg": s:red })
call monokai#highlight("Todo", { "fg": s:fg2, "gui": "bold" })
""" }}}


""" NVIM-TREESITTER {{{
hi! link TSProperty Fg
hi! link TSParameter OrangeItalic
hi! link TSConstructor Fg
hi! link TSNamespace Fg
""" }}}


""" NVIM-LSPCONFIG {{{
hi! link LspDiagnosticsSignError Red
hi! link LspDiagnosticsSignWarning Orange
hi! link LspDiagnosticsSignInformation Yellow
call monokai#highlight('LspDiagnosticsSignHint', { 'fg': s:fg3 })
""" }}}


""" BARBAR.NVIM {{{
call monokai#highlight('BufferActive', { 'fg': s:yellow, 'bg': s:bg })
call monokai#highlight('BufferInactive', { 'fg': s:fg2, 'bg': s:bg_dark2 })
call monokai#highlight('BufferTabpages', { 'fg': s:bg_dark1, 'bg': s:bg_dark2 })

call monokai#highlight('BufferSignActive', { 'fg': s:bg_dark1, 'bg': s:bg })
call monokai#highlight('BufferSignInactive', { 'fg': s:bg_dark1, 'bg': s:bg_dark2 })

hi! link BufferCurrent BufferActive
hi! link BufferCurrentSign BufferSignActive
hi! link BufferCurrentIndex BufferActive
hi! link BufferCurrentMod BufferActive

hi! link BufferVisible BufferInactive
hi! link BufferVisibleSign BufferSignInactive
hi! link BufferVisibleIndex BufferInactive
hi! link BufferVisibleMod BufferInactive

hi! link BufferInactive BufferInactive
hi! link BufferInactiveSign BufferSignInactive
hi! link BufferInactiveIndex BufferInactive
hi! link BufferInactiveMod BufferInactive

hi! link BufferTabpages BufferTabpages
hi! link BufferTabpageFill BufferTabpages
""" }}}


""" NVIM-TREE.LUA {{{
call monokai#highlight('NvimTreeFolderName', { 'fg': s:fg3 })
call monokai#highlight('NvimTreeIndentMarker', { 'fg': s:fg1 })
call monokai#highlight('NvimTreeNormal', { 'fg': s:fg3, 'bg': s:bg_dark2 })
call monokai#highlight('NvimTreeVertSplit', { 'fg': s:bg_dark2, 'bg': s:bg_dark2 })
call monokai#highlight('NvimTreeEndOfBuffer', { 'fg': s:bg_dark2, 'bg': s:bg_dark2 })
call monokai#highlight('NvimTreeStatusLineNC', { 'fg': s:bg_dark2, 'bg': s:bg_dark2 })

hi! link NvimTreeFolderIcon NvimTreeFolderName
hi! link NvimTreeOpenedFolderName NvimTreeFolderName
hi! link NvimTreeEmptyFolderName NvimTreeFolderName
""" }}}


call monokai#highlight('NERDTreeCWD', { 'fg': s:fg2 })
call monokai#highlight('NERDTreeDir', { 'fg': s:fg3 })
call monokai#highlight('NERDTreeCurrentNode', { 'fg': s:red })
hi! link NERDTreeFile NERDTreeDir
hi! link NERDTreeDirSlash NERDTreeDir
hi! link NERDTreeOpenable NERDTreeDir
hi! link NERDTreeClosable NERDTreeDir
" hi! link NERDTreeCurrentNode NERDTreeDir

""" VIM-GITGUTTER {{{
call monokai#highlight('GitGutterAdd', { 'fg': s:green })
call monokai#highlight('GitGutterChange', { 'fg': s:yellow })
call monokai#highlight('GitGutterDelete', { 'fg': s:red })
""" }}}

""" GRAPHQL {{{

""" }}}


""" GOLANG {{{

""" }}}


""" JAVASCRIPT {{{

"" pangloss/vim-javascript

"" maxmellon/vim-jsx-pretty

""" }}}


""" TYPESCRIPT {{{

""" }}}


""" HTML {{{

""" }}}


""" CSS {{{

""" }}}


""" SCSS {{{

""" }}}


""" VIML {{{

""" }}}


""" SHELL SCRIPT {{{

""" }}}


""" ZSH {{{

""" }}}




""" NEOVIM TERMINAL COLORS {{{
if has("nvim")
  let g:terminal_color_0  = s:black.gui
  let g:terminal_color_1  = s:red.gui
  let g:terminal_color_2  = s:green.gui
  let g:terminal_color_3  = s:yellow.gui
  let g:terminal_color_4  = s:blue.gui
  let g:terminal_color_5  = s:purple.gui
  let g:terminal_color_6  = s:cyan.gui
  let g:terminal_color_7  = s:white.gui

  let g:terminal_color_8  = s:black.gui
  let g:terminal_color_9  = s:red.gui
  let g:terminal_color_10 = s:green.gui
  let g:terminal_color_11 = s:yellow.gui
  let g:terminal_color_12 = s:blue.gui
  let g:terminal_color_13 = s:purple.gui
  let g:terminal_color_14 = s:cyan.gui
  let g:terminal_color_15 = s:white.gui

  let g:terminal_color_background = g:terminal_color_0
  let g:terminal_color_foreground = g:terminal_color_7
endif
""" }}}
