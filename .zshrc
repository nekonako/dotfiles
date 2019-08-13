export ZSH=$HOME/.oh-my-zsh

export TERM="st-256color"

ZSH_THEME="powerlevel9k"

prompt_context () { }

POWERLEVEL9K_CONTEXT_TEMPLATE=$user_symbol

POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
#POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
#POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%{%F{black}%K{red}%} $user_symbol%{%b%f%k%F{red}%} %{%f%} "
#POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%{%F{white}%K{red}%} $user_symbol%{%b%f%k%F{magenta}%} %{%f%} "

#POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="%{%F{black}%K{red}%} $user_symbol%{%b%f%K{cyan}%F{red}%}%{%F{black}%K{cyan}%} $medsos%{%b%f%k%F{cyan}%} %{%f%} "

#POWERLEVEL9K_COLOR_SCHEME='light'
#POWERLEVEL9K_CUSTOM_TIME_FORMAT="%D{\uf017 %H:%M:%S}"
#POWERLEVEL9K_TIME_FORMAT="%D{\uf017 %H:%M \uf073  %d.%m.%y}"
POWERLEVEL9K_TIME_FORMAT="%D{\uf073  %d.%m.%y}"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon root_indicator dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=( background_jobs time)

source $ZSH/oh-my-zsh.sh

alias merge='xrdb merge ~/.Xresources'

## Golang
export GOROOT=/usr/lib/go
export GOPATH=/home/asuna/Documents/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

export PATH=$PATH:$HOME/.config/composer/vendor/bin
export PATH=$PATH:$HOME/.bin

## Pywal
(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh
