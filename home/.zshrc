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

alias bb="~/.homesick/repos/dotfiles/home/brew-bundle.sh"
alias bs="brew search"
alias bi="brew info"
alias bo="brew options"
alias bup="brew update && brew upgrade"
alias bc="brew cleanup"
pear-install() {
    pear config-set auto_discover 1
    pear install PHP_CodeSniffer
    pear channel-discover pear.cakephp.org
    pear install cakephp/CakePHP_CodeSniffer
    brew unlink php55 && brew link --overwrite php55
}
pear-update() {
    pear update-channels
    pear upgrade-all
    pear clear-cache
    brew unlink php55 && brew link --overwrite php55
}
gem-update() {
    gem update
    gem pristine --all --only-executables
    gem clean
}
npm-update() {
    npm update -gf
    brew unlink node && brew link --overwrite node
    npm -g cache clean
}
alias all-update="bb && pear-update && gem-update && npm-update"

# red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(autojump brew capistrano composer git git-extras git-flow git-remote-branch github osx sublime terminalapp vagrant)

source $ZSH/oh-my-zsh.sh
source $HOME/.zshenv

# Customize to your needs...

# HomeBrew
export PATH=$(brew --prefix)/bin:$(brew --prefix)/sbin:$(brew --prefix)/opt/ruby/bin:$PATH

if [ -d $HOME/.composer/vendor/bin ] ; then
    export PATH=$PATH:$HOME/.composer/vendor/bin
fi

# Lang
export LANG=ja_JP.UTF-8

# Terminal Notifier
local COMMAND=""
local COMMAND_TIME=""
precmd() {
    if [ "$COMMAND_TIME" -ne "0" ] ; then
        local d=`date +%s`
        d=`expr $d - $COMMAND_TIME`
        if [ "$d" -ge "30" ] ; then
            COMMAND="$COMMAND "
            which terminal-notifier > /dev/null 2>&1 && terminal-notifier -message "Finish! > ${${(s: :)COMMAND}[1]}" -m "$COMMAND";
        fi
    fi
    COMMAND="0"
    COMMAND_TIME="0"
}
preexec () {
    COMMAND="${1}"
    if [ "`perl -e 'print($ARGV[0]=~/ssh|^vi/)' $COMMAND`" -ne 1 ] ; then
        COMMAND_TIME=`date +%s`
    fi
}
