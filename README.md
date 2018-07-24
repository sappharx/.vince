## .vince

I need to turn the Law & Order intro monologue into a developer/dotfiles version, e.g. at the end "and these are their dotfiles."

## Emacs

Install process for macOS:

```sh
brew tap d12frosted/emacs-plus
brew install emacs-plus
ln -s /usr/local/opt/emacs-plus/Emacs.app /Applications

# add to .zshrc
alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw
```

