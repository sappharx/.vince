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

## Updating submodules

Simple process for updating a single submodule:

```sh
cd <submodule_dir>
git pull
cd .. # git repo root dir
git add <submodule_dir>
git commit -m "update submodule x"
```

Big-bang approach for updating all submodules (probably will cause more problems than it solves :/):

```sh
git submodule foreach git pull origin master

git commit -a -m "update all submodules"
```
