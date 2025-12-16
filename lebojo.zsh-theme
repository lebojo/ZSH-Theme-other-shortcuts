# Based on bira theme

setopt prompt_subst

() {

local PR_USER PR_USER_OP PR_PROMPT PR_HOST

# Check the UID
if [[ $UID -ne 0 ]]; then # normal user
  PR_USER='%F{green}%n%f'
  PR_USER_OP='%F{green}%#%f'
  PR_PROMPT='%f＞%f'
else # root
  PR_USER='%F{red}%n%f'
  PR_USER_OP='%F{red}%#%f'
  PR_PROMPT='%F{red}➤ %f'
fi

# Check if we are on SSH or not
if [[ -n "$SSH_CLIENT"  ||  -n "$SSH2_CLIENT" ]]; then
  PR_HOST='%F{red}%M%f' # SSH
else
  PR_HOST='%F{green}%m%f' # no SSH
fi


local return_code="%(?..%F{red}%? ↵%f)"

# Function to shorten pwd if longer than 30 characters
function shortened_pwd() {
  local pwd_display="${(%):-%~}"
  if [[ ${#pwd_display} -gt 30 ]]; then
    local parts=(${(s:/:)pwd_display})
    local shortened_parts=()
    local total=${#parts[@]}
    for i in {1..$total}; do
      local part="${parts[$i]}"
      if [[ $i -eq $total ]]; then
        # Keep the last part (current directory) complete
        shortened_parts+=("$part")
      elif [[ ${#part} -gt 3 ]]; then
        shortened_parts+=("${part:0:3}")
      else
        shortened_parts+=("$part")
      fi
    done
    echo "${(j:/:)shortened_parts}"
  else
    echo "$pwd_display"
  fi
}

local user_host="${PR_USER}%F{cyan}@${PR_HOST}"
local current_dir="%B%F{cyan}\$(shortened_pwd)%f%b"
local git_branch='$(git_prompt_info)'

local emoji="💻"

if [[ -n "$VIRTUAL_ENV" ]]; then
  current_dir="%F{magenta}(${${VIRTUAL_ENV:t}}) %F{cyan}%~"
fi

PROMPT="╭─${emoji} ${current_dir} \$(ruby_prompt_info)${git_branch}
╰─$PR_PROMPT"
RPROMPT="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %f"
ZSH_THEME_RUBY_PROMPT_PREFIX="%F{red}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%f"

}