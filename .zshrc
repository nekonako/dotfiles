export TERM="st-256color"

# Npm user level
NPM_PREFIX="${HOME}/.local/node"
if [[ -z $(printf $PATH | grep $NPM_PREFIX/bin) ]]; then
    export PATH="$NPM_PREFIX/bin:$PATH"
    fi

# Zgen
source "$HOME/.zgen/zgen.zsh"
zgen oh-my-zsh
zgen oh-my-zsh plugins/git
zgen oh-my-zsh plugins/sudo
zgen oh-my-zsh plugins/zsh-autosuggestions
#zgen oh-my-zsh themes/clean
#gen load subnixr/minimal

# Minimal zsh theme
MNML_USER_CHAR=':'
source "$HOME/.zgen/subnixr/minimal-master/minimal.zsh"
MNML_PROMPT=(mnml_status mnml_git mnml_cwd mnml_keymap)
MNML_RPROMPT=()

# zsh autosuggestion
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=cyan,bold"
ZSH_AUTOSUGGEST_STRATEGY=history

# Load Xresources
alias merge='xrdb merge ~/.Xresources'

# Golang
export GOROOT=/usr/lib/go
export GOPATH=/home/asuna/Documents/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# composer
export PATH=$PATH:$HOME/.config/composer/vendor/bin

# android
export ANDROID_HOME=$HOME/.Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools


# script ( colorpane, colorblock etc. )
export PATH=$PATH:$HOME/.bin
