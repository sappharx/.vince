# dependent upon having git-diff-so-fancy installed and set a custom git command `git dsf`
alias gds="gdsf --staged"
alias gdsf="git dsf"

alias gd~='gd head~'

get-remote-url() {
  git remote -v show "$1" | sed -n '2p' | awk '{print $3}'
}

get-origin-url() {
  get-remote-url origin
}

# macOS only
copy-remote-url() {
  get-remote-url "$1" | tr -d '\n' | pbcopy
}

# macOS only
copy-origin-url() {
  get-origin-url | tr -d '\n' | pbcopy
}

