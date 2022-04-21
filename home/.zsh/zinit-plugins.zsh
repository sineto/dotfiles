## oh-my-zsh plugins
# OMZ libraries
local _ZSHRC_OMZ_LIBS=(
	compfix.zsh
	completion.zsh
	directories.zsh
	functions.zsh
	grep.zsh
	history.zsh
	key-bindings.zsh
	misc.zsh
	spectrum.zsh
	termsupport.zsh
	theme-and-appearance.zsh
)

zinit ice from"gh" pick"lib/git.zsh" nocompletions blockf \
	atload'!local f; for f in ${_ZSHRC_OMZ_LIBS}; do source lib/$f; done' \
	compile"lib/(${(j.|.)_ZSHRC_OMZ_LIBS})"

zinit load robbyrussell/oh-my-zsh
zinit snippet OMZ::plugins/git
zinit snippet OMZ::plugins/vscode
zinit snippet OMZ::plugins/colored-man-pages
zinit snippet OMZ::plugins/common-aliases
zinit snippet OMZ::plugins/archlinux
zinit snippet OMZ::plugins/golang
zinit snippet OMZ::plugins/asdf
zinit snippet OMZ::plugins/terraform

zinit ice as"completion"
zinit snippet OMZ::plugins/httpie

## powerlevel10k prompt
zinit ice depth=1 atload'source ~/.p10k.zsh' lucid
zinit light romkatv/powerlevel10k

## completions
zinit light zsh-users/zsh-completions

## misc
# zdharma/history-search-multi-word
zstyle ":history-search-multi-word" page-size "11"
zinit ice wait"1" lucid
zinit load zdharma/history-search-multi-word

# fast-syntax-highlighting
zinit light zdharma/fast-syntax-highlighting
zinit ice wait"0" lucid atinit"ZPLGM[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay"

# zsh-autosuggestions
zinit ice wait lucid atload"!_zsh_autosuggest_start"
zinit load zsh-users/zsh-autosuggestions

# zsh-autopair
zinit ice wait lucid
zinit load hlissner/zsh-autopair

# Gitignore plugin – commands gii and gi
zinit light Aloxaf/fzf-tab

zinit ice wait"2" lucid
zinit load voronkovich/gitignore.plugin.zsh
zinit light jeffreytse/zsh-vi-mode
zinit light buonomo/yarn-completion
zinit light sineto/web-search
zinit light supercrabtree/k
zinit light rupa/z
zinit light changyuheng/fz
