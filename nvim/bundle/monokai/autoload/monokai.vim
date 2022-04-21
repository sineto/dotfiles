let s:overrides = get(g:, "monokai_palette_overrides", {})

" pink - #FF6188
" orange - #FC9867
" yellow - #FFD866
" green - #A9DC76
" blue - #78DCE8
" purple - #AB9DF2

" #747474
" #5B595C                    " linern
" #727072                    " comment
" #939293                    " braces
" background1 - #2D2A2E      " code background
" background2 - #383539
" background3 - #403E41
" background4 - #565357
" background-dark1 - #19181A " tasksidebar (where have icons to extensions, files, search, etc)
" background-dark2 - #221F22 " sidebar, statusbar

"" TODO: better palette structure of colors
"" TODO: place here the highlight group function

let s:default_colors = {
  \ "white": get(s:overrides, "white", { "gui": "#FCFCFA", "cterm": "255" }),
  \ "black": get(s:overrides, "black", { "gui": "#2D2A2E", "cterm": "204" }),
  \ "red": get(s:overrides, "red", { "gui": "#E06C75", "cterm": "204" }),
  \ "pink": get(s:overrides, "pink", { "gui": "#FF6188", "cterm": "204" }),
  \ "orange": get(s:overrides, "orange", { "gui": "#FC9867", "cterm": "204" }),
  \ "yellow": get(s:overrides, "yellow", { "gui": "#FFD866", "cterm": "204" }),
  \ "green": get(s:overrides, "green", { "gui": "#A9DC76", "cterm": "204" }),
  \ "blue": get(s:overrides, "blue", { "gui": "#78DCE8", "cterm": "204" }),
  \ "purple": get(s:overrides, "purple", { "gui": "#AB9DF2", "cterm": "204" }),
  \ "cyan": get(s:overrides, "cyan", { "gui": "#18FF9E", "cterm": "204" }),
  \ "grey1": get(s:overrides, "grey1", { "gui": "#383539", "cterm": "204" }),
  \ "grey2": get(s:overrides, "grey2", { "gui": "#403E41", "cterm": "204" }),
  \ "grey3": get(s:overrides, "grey3", { "gui": "#565357", "cterm": "204" }),
  \ "white_dark1": get(s:overrides, "white_dark1", { "gui": "#5B595C", "cterm": "255" }),
  \ "white_dark2": get(s:overrides, "white_dark2", { "gui": "#727072", "cterm": "255" }),
  \ "white_dark3": get(s:overrides, "white_dark3", { "gui": "#939293", "cterm": "255" }),
  \ "white_dark4": get(s:overrides, "white_dark4", { "gui": "#ABB2BF", "cterm": "255" }),
  \ "white_dark5": get(s:overrides, "white_dark5", { "gui": "#747474", "cterm": "255" }),
  \ "grey_dark1": get(s:overrides, "grey_dark1", { "gui": "#19181A", "cterm": "204" }),
  \ "grey_dark2": get(s:overrides, "grey_dark2", { "gui": "#221F22", "cterm": "204" }),
  \ "purple2": get(s:overrides, "purple2", { "gui": "#C678DD", "cterm": "170", "cterm16": "5" }),
\}

let s:machine_colors = {
  \ "white": get(s:overrides, "white", { "gui": "#FCFCFA", "cterm": "255" }),
  \ "black": get(s:overrides, "black", { "gui": "#2D2A2E", "cterm": "204" }),
  \ "red": get(s:overrides, "red", { "gui": "#E06C75", "cterm": "204" }),
  \ "pink": get(s:overrides, "pink", { "gui": "#FFFFFF", "cterm": "204" }),
  \ "orange": get(s:overrides, "orange", { "gui": "#FC9867", "cterm": "204" }),
  \ "yellow": get(s:overrides, "yellow", { "gui": "#FFD866", "cterm": "204" }),
  \ "green": get(s:overrides, "green", { "gui": "#A9DC76", "cterm": "204" }),
  \ "blue": get(s:overrides, "blue", { "gui": "#78DCE8", "cterm": "204" }),
  \ "purple": get(s:overrides, "purple", { "gui": "#AB9DF2", "cterm": "204" }),
  \ "cyan": get(s:overrides, "cyan", { "gui": "#18FF9E", "cterm": "204" }),
  \ "grey1": get(s:overrides, "grey1", { "gui": "#383539", "cterm": "204" }),
  \ "grey2": get(s:overrides, "grey2", { "gui": "#403E41", "cterm": "204" }),
  \ "grey3": get(s:overrides, "grey3", { "gui": "#565357", "cterm": "204" }),
  \ "white_dark1": get(s:overrides, "white_dark1", { "gui": "#5B595C", "cterm": "255" }),
  \ "white_dark2": get(s:overrides, "white_dark2", { "gui": "#727072", "cterm": "255" }),
  \ "white_dark3": get(s:overrides, "white_dark3", { "gui": "#939293", "cterm": "255" }),
  \ "white_dark4": get(s:overrides, "white_dark4", { "gui": "#ABB2BF", "cterm": "255" }),
  \ "grey_dark1": get(s:overrides, "grey_dark1", { "gui": "#19181A", "cterm": "204" }),
  \ "grey_dark2": get(s:overrides, "grey_dark2", { "gui": "#221F22", "cterm": "204" }),
  \ "purple2": get(s:overrides, "purple2", { "gui": "#C678DD", "cterm": "170", "cterm16": "5" }),
\}

function! monokai#palette(style)
  if a:style ==# 'default'
    return s:default_colors
  elseif a:style ==# 'machine'
    return s:machine_colors
  endif
endfunction

function! monokai#highlight(group, style)
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