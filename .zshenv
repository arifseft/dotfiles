# env
# move cursor for tmux
bindkey "[C" forward-word
bindkey "[D" backward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line
bindkey '\e\eOC' forward-word
bindkey '\e\eOD' backward-word

export CLICOLOR=1
export EDITOR='nvim'

export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export XDG_CONFIG_HOME=$HOME/.config

export GOPATH=/usr/local/Cellar/go/1.14.6
export GOROOT=$GOPATH/libexec
export GO111MODULE=auto
export GOBIN=$GOPATH/bin
export KARIR=$HOME/go/src/github.com/karirdotcom

#export GOROOT=/usr/local/Cellar/go/1.14.2_1/libexec
#export GO111MODULE=auto
# export GO111MODULE=off
#export GOPATH=$HOME/go
#export GOBIN=$GOPATH/bin
#export KARIR=$GOPATH/src/github.com/karirdotcom
export MYVIMRC=$XDG_CONFIG_HOME/nvim/init.vim
export GEM_HOME=$HOME/.gem
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$GOBIN:/usr/local/opt/go/libexec/bin:/usr/local/mysql/bin/:/usr/local/opt/mysql@5.7/:/usr/local/opt/php@7.1/bin:/usr/local/opt/php@7.1/sbin:$HOME/.composer/vendor/bin:$HOME/.fastlane/bin:$HOME/Library/Python/3.7/bin:$GEM_HOME/bin
# export TERM=screen-256color
export TERM=xterm-256color
export DOTFILES=$HOME/dotfiles
export XDEBUG_CONFIG="idekey=XDEBUG_VIM"
