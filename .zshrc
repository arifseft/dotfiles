if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL9K_MODE="awesome-patched"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source $HOME/.zshenv
source $HOME/.zsh_aliases

t() {
	if [[ "$ITERM_PROFILE" != "dark" ]] then
		echo -e "\033]50;SetProfile=dark\a"; export ITERM_PROFILE='dark';
	else
		echo -e "\033]50;SetProfile=light\a"; export ITERM_PROFILE='light';
	fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export LC_ALL=en_US.UTF-8

mkcd () {
  mkdir "$1"
  cd "$1"
}

# Powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
source /usr/local/lib/python3.7/site-packages/powerline/bindings/bash/powerline.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[[ ! -f ~/.p10k-lean.zsh ]] || source ~/.p10k-lean.zsh

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh
