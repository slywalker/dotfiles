# Usage

Install OhMyZsh

```
$ curl -L http://install.ohmyz.sh | sh
```

Install homesick

```
$ gem install homesick
$ cd ~ 
$ homesick clone git@github.com:slywalker/dotfiles.git
$ homesick symlink dotfiles
```

Install brew [Homebrew — The missing package manager for OS X](http://brew.sh/)

```
$ xcode-select --install
$ ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
$ brew doctor
```

```
$ brew bundle
$ gem install bundler
$ bundle install
$ composer global install
$ pear-install
```

# User dotfiles

```
$ touch ~/.zshenv
$ touch ~/.gitconfig.user
```
