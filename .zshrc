export TERM="xterm-256color"

# Npm user level
	NPM_PREFIX="${HOME}/.local/node"
	 if [[ -z $(printf $PATH | grep $NPM_PREFIX/bin) ]]; then
    	   export PATH="$NPM_PREFIX/bin:$PATH"
   	 fi

# Zgen
# load zgen
	source "${HOME}/.zgen/zgen.zsh"
	zgen oh-my-zsh
	zgen oh-my-zsh plugins/git
	zgen oh-my-zsh plugins/sudo
	zgen oh-my-zsh plugins/aws
    zgen oh-my-zsh plugins/archlinux
    zgen oh-my-zsh plugins/django
    zgen oh-my-zsh plugins/docker
    zgen oh-my-zsh plugins/kubectl
    zgen oh-my-zsh plugins/go
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
	zgen load subnixr/minimal

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
	ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=green,"
	ZSH_AUTOSUGGEST_STRATEGY=history

# aliases
	alias merge='xrdb merge ~/.Xresources'
	alias neofetch='neofetch --source ~/.config/neofetch/chess.txt'
	alias updategrub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
    alias vimedit='nvim ~/.vimconf'

# Golang
	export GOROOT=/usr/lib/go
	export GOPATH=/home/yuune/Doc/go
	export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# lokasi folder untuk node packages
	NPM_PREFIX="${HOME}/.local/node"

# Rust
	export PATH="$HOME/.cargo/bin:$PATH"

# mencegah duplikat lokasi node packages
	if [[ -z $(printf $PATH | grep $NPM_PREFIX/bin) ]]; then
  	  export PATH="$NPM_PREFIX/bin:$PATH"
	fi

# composer
	#export PATH=$PATH:$HOME/.config/composer/vendor/bin

# Android
	#export ANDROID_HOME=$HOME/.Android/Sdk
	#export PATH=$PATH:$ANDROID_HOME/tools
	#export PATH=$PATH:$ANDROID_HOME/tools/bin
	#export PATH=$PATH:$ANDROID_HOME/platform-tools


# script ( colorpane, colorblock etc. )
	export PATH=$PATH:$HOME/.local/bin


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

