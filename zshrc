autoload -U add-zsh-hook

# this will cause the `theme_precmd' function to be called before rendering the next prompt
# I'm not sure if it gets called before the current command is actually run,
# as the hook name (precmd) would suggest
add-zsh-hook precmd theme_precmd

### LEGEND:

## prompt:
# look for 'EXPANSION OF PROMPT SEQUENCES' in `man zshmisc'
# %F => start a new foreground color, e.g. `"%F{red}foo%F{default}bar"' will have 'foo' in red and 'bar' in the default color
# %K => start a new background color, e.g. `"%K{red}foo%K{default}bar"' will have 'foo' on a red background and 'bar' with the default color
# %B/%b => start/stop boldface font
# %n => username
# %m => hostname up to the first dot (`.')
# %# => A `#' if the shell is running with privileges, a `%' if not.

#prompt_symbol="${PROMPT_SYMBOL:-%#}"
# ⚡ if root, ❯ otherwise
prompt_symbol="${PROMPT_SYMBOL:-%(!.⚡.❯)}"
#prompt_symbol="${PROMPT_SYMBOL:-%(!.⚡.❯)}"
#prompt_symbol="${PROMPT_SYMBOL:-❯}"
#prompt_symbol="${PROMPT_SYMBOL:-»}"
#prompt_symbol="${PROMPT_SYMBOL:-›}"

# characters
SEGMENT_SEPARATOR="\ue0b0"

function prompt_dir() {
  local -a pieces

  # current directory (shown in green if it's writable, yellow otherwise)
  #[[ -w "${PWD}" ]] && infoline+=( "%F{green}" ) || infoline+=( "%F{yellow}" )
  #pieces+=( "%K{blue}%F{black}" )
  #pieces+=( " ${PWD/$HOME/~} " )
  #pieces+=( "%F{blue}%K{default}" )
  #pieces+=( "$(echo ${SEGMENT_SEPARATOR}) " "%F{default}" )
  #pieces+=( "%F{default}" )

  pieces=( \
    # set the background and foreground colors for the segment
    "%K{blue}%F{black}"             \

    # display the current directory with the home path collapsed to a tilde
    " ${PWD/$HOME/~} "              \

    # set the background back to the default and the foreground to the previous background so the block arrow will be colored properly
    "%F{blue}%K{default}"           \

    # display the block arrow
    "${SEGMENT_SEPARATOR} " \
    #"$(print -n ${SEGMENT_SEPARATOR}) " \

    # set the foreground back to the default
    "%F{default}"                   \
  )

  print -n "${(j::)pieces}"
}

function setprompt() {
  local -a lines infoline promptline

  ### assemble the top line (infoline)

  # current directory (shown in green if it's writable, yellow otherwise)
  #[[ -w "${PWD}" ]] && infoline+=( "%F{green}" ) || infoline+=( "%F{yellow}" )
  #infoline+=( "%K{blue}%F{black}" )
  #infoline+=( " ${PWD/$HOME/~} " )
  #infoline+=( "%F{blue}%K{default}" )
  #infoline+=( "$(echo ${SEGMENT_SEPARATOR}) " "%F{default}" )
  ##infoline+=( "%F{default}" )

  infoline+="$(prompt_dir)"

  # username and host (if we're an SSH client)
  infoline+=( "%F{blue}%B(%n)%F{default}%b" )
  [[ -n "${SSH_CLIENT}" ]] && infoline+=( "@%m" )

  ### assemble the bottom line (promptline)

  # background jobs (cite the number of jobs running; leave blank if there are none)
  promptline+=( "%(1j.%F{blue}%B%j%F{default}%b .)" )

  # actual prompt character (red if the last command didn't exit with 0; default green)
  promptline+=( "%(0?.%F{green}.%F{red})${prompt_symbol}%F{default} " )

  ### all together now
  lines+=( ${(j::)infoline} )
  lines+=( ${(j::)promptline} )

  ### set the prompt

  PROMPT=${(F)lines}
}

function theme_precmd() {
  setprompt
}

