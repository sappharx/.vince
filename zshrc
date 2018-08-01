autoload -U add-zsh-hook

# this will cause the `theme_precmd' function to be called before rendering the next prompt
# I'm not sure if it gets called before the current command is actually run,
# as the hook name (precmd) would suggest
add-zsh-hook precmd theme_precmd

function setprompt() {
  local -a lines infoline

  ### assemble the top line (infoline)

  # current directory (shown in green if it's writable, yellow otherwise)
  [[ -w "${PWD}" ]] && infoline+=( "%F{green}" ) || infoline+=( "%F{yellow}" )
  infoline+=( "(${PWD/$HOME/~})%F{default} " )

  ### assemble the bottom line (promptline)

  lines+=( ${(j::)infoline} )
  lines+=( "$ " )

  ### set the prompt

  PROMPT=${(F)lines}
}

function theme_precmd() {
  setprompt
}

