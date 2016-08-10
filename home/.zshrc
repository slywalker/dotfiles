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

# red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(autojump brew cakephp3 capistrano composer git git-extras git-flow git-remote-branch github osx sublime terminalapp vagrant)

source $ZSH/oh-my-zsh.sh
source $HOME/.zshenv

# Customize to your needs...

# HomeBrew
path=(~/bin(N-/) /usr/local/bin(N-/) /usr/local/sbin(N-/) /usr/local/bin/opt/ruby/bin(N-/) ${path})
#export PATH=$(brew --prefix)/bin:$(brew --prefix)/sbin:$(brew --prefix)/opt/ruby/bin:$PATH
export PATH=$PATH:/usr/local/share/git-core/contrib/diff-highlight

[[ -s `brew --prefix`/etc/autojump.zsh ]] && . `brew --prefix`/etc/autojump.zsh

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
