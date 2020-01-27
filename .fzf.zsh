# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/arifsefrianto/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/arifsefrianto/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/arifsefrianto/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/arifsefrianto/.fzf/shell/key-bindings.zsh"
