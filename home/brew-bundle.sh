#!/usr/bin/env bash

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

brew tap homebrew/binary
brew tap homebrew/dupes
brew tap homebrew/versions

brew install siege
brew install autojump
brew install git
brew install plantuml
brew install tig
brew install tree
brew install wget
brew install terminal-notifier

brew install homebrew/dupes/openssh

brew install node
brew install scala

brew install ruby
brew unlink ruby && brew link ruby
brew install brew-gem
brew gem bundler && brew unlink bundler && brew link --overwrite bundler
brew gem compass && brew unlink compass && brew link --overwrite compass
brew gem homesick && brew unlink homesick && brew link --overwrite homesick

brew install beanstalkd
brew install memcached
brew install mysql
brew install nginx
brew install postgis
brew install postgresql
brew install sqlite

brew tap homebrew/php
brew install php55 --with-fpm --with-pgsql --without-apache
brew install php55-mcrypt
brew install php55-memcache
brew install php55-memcached
brew install php55-xdebug
brew unlink php55 && brew link php55
brew install box
brew install composer

brew install caskroom/cask/brew-cask

# Remove outdated versions from the cellar
brew cleanup

# Install Applications
brew upgrade brew-cask
brew cask install alfred || true
brew cask install appcleaner || true
brew cask install bartender || true
brew cask install caffeine || true
brew cask install codekit || true
brew cask install dash || true
brew cask install dropbox || true
brew cask install google-chrome || true
brew cask install google-japanese-ime || true
brew cask install iterm2 || true
brew cask install launchrocket || true
brew cask install skype || true
brew cask install sourcetree || true
brew cask install the-unarchiver || true
brew cask install totalterminal || true
brew cask install vagrant || true
brew cask install vagrant-manager || true
brew cask install virtualbox || true
brew cask install xtrafinder || true

# Remove outdated versions from the cask
brew cask cleanup

# Alfred Setting
brew cask alfred link
