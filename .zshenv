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

export GOROOT=/usr/local/Cellar/go/1.13.5/libexec
export GO111MODULE=off
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export KARIR=$GOPATH/src/github.com/karirdotcom
export MYVIMRC=$XDG_CONFIG_HOME/nvim/init.vim
export PATH=$PATH:$GOBIN:/usr/local/opt/go/libexec/bin:/usr/local/mysql/bin/:/usr/local/opt/mysql@5.7/:/usr/local/opt/php@7.1/bin:/usr/local/opt/php@7.1/sbin
export PATH=$HOME/.fastlane/bin:$PATH
export PATH=$HOME/Library/Python/3.7/bin:$PATH
export TERM=screen-256color
export DOTFILES=$HOME/dotfiles
