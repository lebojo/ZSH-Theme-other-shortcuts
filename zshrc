export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="lebojo"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH="$PATH:/home/lebojo/.local/bin"

#ShortCuts:
alias gs="git status"
alias cputemp='sudo powermetrics –samplers smc | grep -i "CPU die temperature."' #Only on mac
#alias cputemp="sensors | grep Package | awk '{print $4}'" #Only works on linux

#gcp -> git commit push, usage: _>gcp "commit message"
alias gcp='f() { git add . && git commit -m "$@" && git push; unset -f f; }; f'