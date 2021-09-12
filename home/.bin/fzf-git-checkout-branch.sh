#!/usr/bin/env bash
# fzf-git-checkout-branch - checkout git branch (including remote branches and tags)
RED="\033[1;31m"
OFF="\033[m"

function fail-msg() {
	if [[ "$1" == '' ]]; then
		echo -e "$RED$2 $OFF"
		exit 1
	fi
}

function _fzf() {
	fzf --cycle --height=80% "$@"
}

## Test if is into a git repository.
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
	echo "fatal: Not a git repo!"
	exit 1
fi

cmd=$1
shift

bopts=$1
shift

## Get all tags.
tags=$(git --no-pager tag \
	| awk '{print "\x1b[31;1mtag\x1b[m\t" $1}') \
	|| exit 1

## Get all branches except the current one.
branches=$(git --no-pager branch "$bopts" \
	--format="%(if)%(HEAD)%(then)%(else)%(if:equals=HEAD)%(refname:strip=3)%(then)%(else)%1B[0;34;1mbranch%09%1B[m%(refname:short)%(end)%(end)" \
	| sed '/^$/d') \
	|| exit 1

case "$cmd" in
	tag)
		# [[ "$tags" == '' ]] && echo "git-fzf-branch: no tags here."; exit 1
		fail-msg "$tags" "fzf-git-checkout-branch: no tags here!"
		t=$tags
		;;
	branch)
		# [[ "$branches" == '' ]] && echo "git-fzf-branch: no branches here."; exit 1
		fail-msg "$branches" "fzf-git-checkout-branch: no branches here!"
		t=$branches
		;;
	checkout)
		fail-msg "$branches$tags" "fzf-git-checkout-branch: no branches or tags beyond the 'master'."
		[[ "$branches" == '' ]] && t=$tags || t=$(echo -ne "$branches\n$tags")
		;;
esac

## Drop all branch and tag names into a FZF list to choose.
# git log format:
# %h - abreviatted commit hash
# %s - subject
# %an - author name
target=$((echo -ne "$t") \
	| _fzf +s -m +e --no-hscroll --ansi -d '\t' -n 2 --preview-window 'right:70%' \
	--preview 'git log --graph --color --pretty=tformat:"%C(yellow)%h %Creset%s - %Cgreen%an%Creset" --date=human {2} -- | head -200') \
	|| exit 1

[[ "$target" != '' && "$cmd" == 'branch' && "$@" == '' ]] && exit 1
[[ "$target" != '' && "$cmd" == 'tag' && "$@" == '' ]] && exit 1
[[ "$target" != '' ]] && git "$cmd" "$@" $(echo "$target" | awk '{print $2}') \
	|| exit 1