#!/usr/bin/env bash

_fzf() {
   yay +x +s --extract --cycle --ansi --reverse \
   --header='[base : package name : version : installed flag]' "$@"
}

ipcon=$(ip a | awk '/(eno1|wlp4s0)/' | awk '/state UP/' | wc -l)
if [[ "$ipcon" == 0 ]]; then
   echo "fzf-yay: Temporary failure in name resolution"
   exit 1
fi

package=$(yay -Sl | awk '{print "\x1b[35;1m" $1 "\x1b[37;1m " $2 "\x1b[32;1m " $3 "\x1b[36;1m " $4}' | _fzf --multi --preview-window="right:55%:wrap" --preview="yay -Si {2}") || exit 1

[[ "$@" != '' ]] && yay "$@" $(echo "$package" | awk '{print $2}') || echo "$package" | awk '{print $2}'; exit 1