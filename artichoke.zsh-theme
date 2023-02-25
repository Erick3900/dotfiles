function python_env {
  local python_env

  if [[ -n "${VIRTUAL_ENV}" ]] then
      python_env=`basename $VIRTUAL_ENV`
  elif [[ -n "${CONDA_DEFAULT_ENV}" ]] then
      python_env="${CONDA_DEFAULT_ENV}"
  fi

  if [[ -n "$python_env" ]] then
    echo "%{$fg_bold[magenta]%}($python_env)%{$reset_color%} "
  fi
}

function build_prompt {
  local B_PROMPT="%{$fg_bold[blue]%}%n"

  if [[ $EUID -eq 0 ]] then
    B_PROMPT+="%{$fg[red]%} # "
  else
    B_PROMPT+="%{$fg_bold[black]%} @ "
  fi

  B_PROMPT+="%{$fg_bold[yellow]%}%M"

  B_PROMPT+="%{$fg_bold[black]%} in %{$fg_bold[cyan]%}%c%{$reset_color%}$(git_prompt_info)"

  echo $B_PROMPT
}

PROMPT='$(build_prompt)
$(python_env)» '

ZSH_THEME_GIT_PROMPT_PREFIX=" ${FG[075]}git:(${FG[078]}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="${FG[214]}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="${FG[075]})%{$reset_color%}"
