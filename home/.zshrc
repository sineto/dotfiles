# Enable Powerlevel10k instant prompt. Should stay at the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### powerlevel10k prompt
# source ~/.powerlevel10k/powerlevel10k.zsh-theme
# source ~/.p10k.zsh

export ZSH=$HOME/.zsh
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
HISTIGNORE="&:ls:ll:la:l.:pwd:exit:clear:clr:[bf]g"

if [[ -f /home/snio/.zsh/zsh-config ]]; then
  files=(aliases)
  source /home/snio/.zsh/zsh-config

  if [[ ! -f "$HOME/.zinit/bin/zinit.zsh" ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
  fi
fi

## FZF completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## Powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk
