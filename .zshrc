# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#eval "$(~/.rbenv/bin/rbenv init - zsh)"
#rbenv init

export USE_GKE_GCLOUD_AUTH_PLUGIN=True
eval "$(rbenv init - zsh)"
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

export BAT_PAGER="less -RF"
# Zge
# load zgen
source "${HOME}/.zgen/zgen.zsh"
zgen oh-my-zsh
zgen oh-my-zsh plugins/git
zgen oh-my-zsh plugins/gitfast
zgen oh-my-zsh plugins/sudo
zgen oh-my-zsh plugins/aws
zgen oh-my-zsh plugins/archlinux
#zgen oh-my-zsh plugins/django
zgen oh-my-zsh plugins/docker
zgen oh-my-zsh plugins/kubectl
zgen oh-my-zsh plugins/golang
zgen oh-my-zsh plugins/golang
zgen oh-my-zsh plugins/gem
zgen oh-my-zsh plugins/github
zgen oh-my-zsh plugins/heroku
zgen oh-my-zsh plugins/npm
zgen oh-my-zsh plugins/pep8
zgen oh-my-zsh plugins/python
zgen oh-my-zsh plugins/pip
zgen oh-my-zsh plugins/postgres
zgen oh-my-zsh plugins/pass
zgen oh-my-zsh plugins/ruby
zgen oh-my-zsh plugins/rake
zgen oh-my-zsh plugins/rbenv
zgen oh-my-zsh plugins/systemd
zgen oh-my-zsh plugins/tmux
zgen oh-my-zsh plugins/command-not-found

# zsh theme
#zgen load romkatv/powerlevel10k
#zgen oh-my-zsh themes/agnoster
#zgen load subnixr/minimal
#zgen load romkatv/powerlevel10k powerlevel10k

# Zsh auto suggestiona
zgen load zsh-users/zsh-autosuggestions

# syntax highlight
zgen load zsh-users/zsh-syntax-highlighting

# completions
zgen load zsh-users/zsh-completions src

# Minimal zsh theme
#MNML_USER_CHAR=''
#source "$HOME/.zgen/subnixr/minimal-master/minimal.zsh"
#MNML_PROMPT=(mnml_status mnml_git mnml_cwd mnml_keymap)
#MNML_RPROMPT=()

# zsh autosuggestion config
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=red"
ZSH_AUTOSUGGEST_STRATEGY=history

# Zsh syntax highlighting
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# ALIASES

alias merge='xrdb merge ~/.Xresources'
alias neofetch='neofetch --source ~/.config/neofetch/chess.txt'
alias updategrub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias vimedit='nvim ~/.vimconf'
alias ls='exa'

# Docker
alias docker-enable='systemctl enable docker'
alias docker-disable='systemctl disable docker'
alias docker-start='systemctl start docker'
alias docker-restart='systemctl restart docker'
alias docker-stop='systemctl stop docker'
alias cat='bat'

# youtubeDL
alias ytmp3='youtube-dl -x --audio-format mp3'

# lokasi folder untuk node packages kamu
NPM_PREFIX="${HOME}/.local/share/node"
BAT_THEME="gruvbox-dark"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

eval "$(starship init zsh)"
source ~/.profile
