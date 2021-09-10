#!/usr/bin/env bash
sinokai_black="#282c34"
sinokai_blue="#78DCE8"
sinokai_yellow="#FFD85B"
sinokai_red="#FF443E"
sinokai_white="#ffffff"
sinokai_green="#A9DC76"
sinokai_visual_grey="#555555"
sinokai_comment_grey="#555555"

get() {
   local option=$1
   local default_value=$2
   local option_value="$(tmux show-option -gqv "$option")"

   if [ -z "$option_value" ]; then
      echo "$default_value"
   else
      echo "$option_value"
   fi
}

set() {
   local option=$1
   local value=$2
   tmux set-option -gq "$option" "$value"
}

setw() {
   local option=$1
   local value=$2
   tmux set-window-option -gq "$option" "$value"
}

set "status" "on"
set "status-justify" "left"

set "status-left-length" "100"
set "status-right-length" "100"
set "status-right-attr" "none"

set "message-fg" "$sinokai_white"
set "message-bg" "$sinokai_black"

set "message-command-fg" "$sinokai_white"
set "message-command-bg" "$sinokai_black"

set "status-attr" "none"
set "status-left-attr" "none"

setw "window-status-fg" "$sinokai_black"
setw "window-status-bg" "$sinokai_black"
setw "window-status-attr" "none"

setw "window-status-activity-bg" "$sinokai_black"
setw "window-status-activity-fg" "$sinokai_black"
setw "window-status-activity-attr" "none"

setw "window-status-separator" ""

set "window-style" "fg=$sinokai_comment_grey"
set "window-active-style" "fg=$sinokai_white"

set "pane-border-fg" "$sinokai_white"
set "pane-border-bg" "$sinokai_black"
set "pane-active-border-fg" "$sinokai_green"
set "pane-active-border-bg" "$sinokai_black"

set "display-panes-active-colour" "$sinokai_yellow"
set "display-panes-colour" "$sinokai_blue"

set "status-bg" "$sinokai_black"
set "status-fg" "$sinokai_white"

set "@prefix_highlight_fg" "$sinokai_black"
set "@prefix_highlight_bg" "$sinokai_green"
set "@prefix_highlight_copy_mode_attr" "fg=$sinokai_black,bg=$sinokai_green"
set "@prefix_highlight_output_prefix" " "

status_widgets=$(get "@sinokai_widgets")
zoomed="#[fg=$sinokai_black,bg=$sinokai_green,bold]#{?window_zoomed_flag, Z ,}"
widgets="#[fg=$sinokai_white,bg=$sinokai_visual_grey]${status_widgets}"

set "status-right" "#{prefix_highlight}$zoomed#[fg=$sinokai_visual_grey,bg=$sinokai_visual_grey]$widgets#[fg=$sinokai_green,bg=$sinokai_visual_grey,nobold,nounderscore,noitalics]#[fg=$sinokai_black,bg=$sinokai_green,bold] #h "
set "status-left" "#[fg=$sinokai_black,bg=$sinokai_green,bold] #S #[fg=$sinokai_green,bg=$sinokai_black,nobold,nounderscore,noitalics]"

set "window-status-format" "#[fg=$sinokai_black,bg=$sinokai_black,nobold,nounderscore,noitalics]#[fg=$sinokai_white,bg=$sinokai_black] #I| #W #[fg=$sinokai_black,bg=$sinokai_black,nobold,nounderscore,noitalics]"
set "window-status-current-format" "#[fg=$sinokai_black,bg=$sinokai_visual_grey,nobold,nounderscore,noitalics]#[fg=$sinokai_white,bg=$sinokai_visual_grey,nobold] #I| #W #[fg=$sinokai_visual_grey,bg=$sinokai_black,nobold,nounderscore,noitalics]"
