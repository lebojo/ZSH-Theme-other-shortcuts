export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="lebojo"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH="$PATH:/home/lebojo/.local/bin"

#ShortCuts:
alias gs="git status"
#gcp -> git commit push, usage: _>gcp "commit message"
alias gcp='f() { git add . && git commit -m "$@" && git push; unset -f f; }; f'

