#!/bin/sh
export CLICOLOR=1
export EDITOR='nvim'
export ENV=development

export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

export XDG_CONFIG_HOME=$HOME/.config

# export GO111MODULE=auto
export GOBIN=$HOME/go/bin
# export GOPRIVATE="github.com/karirdotcom"
# export KARIR=$HOME/go/src/github.com/karirdotcom
export WORK=$HOME/go/src/github.com/flynd-dev/bmi
export PERSONAL=$HOME/go/src/github.com/arifseft
# export MYVIMRC=$XDG_CONFIG_HOME/nvim/init.vim
export MYVIMRC=$XDG_CONFIG_HOME/nvim/init.lua

# export ANDROID_HOME=$HOME/Library/Android/sdk
# export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
# export PATH=$PATH:$ANDROID_HOME/emulator
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/tools/bin
# export PATH=$PATH:$ANDROID_HOME/platform-tools
# export ANDROID_NDK=$ANDROID_HOME/ndk/20.1.5948944

# brew Android
export ANDROID_HOME="/usr/local/share/android-sdk"
export ANDROID_NDK_HOME="/usr/local/share/android-ndk"
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# No Android Studio
# export ANDROID_HOME=$HOME/.android-sdk
# export ANDROID_SDK_ROOT=$HOME/.android-sdk
# export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/bin
export PATH=$PATH:$GOBIN:/usr/local/bin:/usr/local/opt/go/libexec/bin:/usr/local/mysql/bin/:/usr/local/opt/mysql@5.7/:$HOME/.composer/vendor/bin
export PATH=$PATH:/usr/local/opt/php@8.0/bin:/usr/local/opt/php@8.0/sbin
export PATH=$PATH:/usr/local/sbin

# brew install gnu-sed
export PATH=$(brew --prefix)/opt/gnu-sed/libexec/gnubin:$PATH

# export TERM=screen-256color
export TERM=xterm-256color
export DOTFILES=$HOME/dotfiles
export XDEBUG_CONFIG="idekey=XDEBUG_VIM"

# elasticsearch
export ES_HOME=$HOME/elasticsearch-7.4.2
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-12.0.2.jdk/Contents/Home
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
# export JAVA_HOME=/usr/local/opt/openjdk
export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-8.jdk/Contents/Home
export PATH=$ES_HOME/bin:$JAVA_HOME/bin:$PATH
export DOCKER_CLIENT_TIMEOUT=120
export COMPOSE_HTTP_TIMEOUT=120
export HOMEBREW_AUTO_UPDATING=0

export DB_UI_DEV=mysql://root:12345678@localhost/bmi
