# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export TERM="xterm-256color"
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
zgen oh-my-zsh plugins/django
zgen oh-my-zsh plugins/docker
#zgen oh-my-zsh plugins/kubectl
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
zgen load romkatv/powerlevel10k
source ~/.zgen/romkatv/powerlevel10k-master/powerlevel10k.zsh-theme

# Zsh auto suggestiona
zgen load zsh-users/zsh-autosuggestions

# syntax highlight
zgen load zsh-users/zsh-syntax-highlighting

# completions
zgen load zsh-users/zsh-completions src

# Minimal zsh theme
MNML_USER_CHAR=''
#source "$HOME/.zgen/subnixr/minimal-master/minimal.zsh"
MNML_PROMPT=(mnml_status mnml_git mnml_cwd mnml_keymap)
MNML_RPROMPT=()
#source "$HOME/.zgen/romkatv/powerlevel10k-master/powerlevel10k.zsh-theme"
#source "$HOME/.zsh-theme-gruvbox-mix-dark"

# zsh autosuggestion config
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=red"
ZSH_AUTOSUGGEST_STRATEGY=history

# Zsh syntax highlighting
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none


# aliases
alias merge='xrdb merge ~/.Xresources'
alias neofetch='neofetch --source ~/.config/neofetch/block.txt'
alias updategrub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias vimedit='nvim ~/.vimconf'
alias ytmp3='youtube-dl -x --audio-format mp3'
alias ls='exa'

# Golang
export GOROOT=/usr/lib/go
export GOPATH=/home/nako/Documents/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# composer
export PATH=$PATH:$HOME/.config/composer/vendor/bin

# Android
export ANDROID_HOME=$HOME/.Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# flutter
export PATH=$PATH:$HOME/.Flutter/bin

# JAVA
export JDK_HOME=/usr/lib/jvm/java-11-openjdk/
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk/
export PATH="$JAVA_HOME/bin:$PATH"
export PATH=$PATH:$HOME/.local/lsp/server/bin/

# script ( colorpane, colorblock etc. )
export PATH=$PATH:$HOME/.local/bin

# lokasi folder untuk node packages kamu
NPM_PREFIX="${HOME}/.local/share/node"

# mencegah duplikat lokasi node packages
if [[ -z $(printf $PATH | grep $NPM_PREFIX/bin) ]]; then
    export PATH="$NPM_PREFIX/bin:$PATH"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

case $TERM in
    st*)
        precmd () {
            print -Pn "\e]0;st:%~\a"
        }
    preexec () {
        print -Pn "\e]0;st:$1\a"
    }
;;
esac
