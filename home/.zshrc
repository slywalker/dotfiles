# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="muse"

# aliases
alias zshconfig="subl -n ~/.zshrc"
alias ohmyzsh="subl -n ~/.oh-my-zsh"
alias dotfiles="cd ~/.homesick/repos/dotfiles && subl -n ."

alias bb="cd ~ && brew bundle"
alias bs="brew search"
alias bi="brew info"
alias bo="brew options"
alias bup="brew update && brew upgrade"
alias bc="brew cleanup"

# red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(autojump brew capistrano composer git git-extras git-flow git-remote-branch github osx sublime terminalapp vagrant)

source $ZSH/oh-my-zsh.sh
source $HOME/.zshenv

# Customize to your needs...

# HomeBrew
export PATH=$(brew --prefix)/bin:$(brew --prefix)/sbin:$(brew --prefix)/opt/ruby/bin:$PATH

# Lang
export LANG=ja_JP.UTF-8
