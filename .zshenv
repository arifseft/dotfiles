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

# export GO111MODULE=auto
export GOBIN=$HOME/go/bin
export GOPRIVATE="github.com/karirdotcom"
export KARIR=$HOME/go/src/github.com/karirdotcom
export MYVIMRC=$XDG_CONFIG_HOME/nvim/init.vim
export GEM_HOME=$HOME/.gem
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$GOBIN:/usr/local/opt/go/libexec/bin:/usr/local/mysql/bin/:/usr/local/opt/mysql@5.7/:/usr/local/opt/php@7.1/bin:/usr/local/opt/php@7.1/sbin:$HOME/.composer/vendor/bin:$HOME/.fastlane/bin:$HOME/Library/Python/3.7/bin:$GEM_HOME/bin
export PATH=$PATH:$HOME/.rvm/gems/ruby-2.7.1/bin
# export TERM=screen-256color
export TERM=xterm-256color
export DOTFILES=$HOME/dotfiles
export XDEBUG_CONFIG="idekey=XDEBUG_VIM"

# elasticsearch
export ES_HOME=$HOME/Downloads/elasticsearch-7.4.2
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_77/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-9.0.1.jdk/Contents/Home
export PATH=$ES_HOME/bin:$JAVA_HOME/bin:$PATH
