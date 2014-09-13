# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

export TERM="xterm-256color"

# export RBENV_VERSION=1.9.3

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="af-magic"
ZSH_THEME="miloshadzic"
#ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew cap composer jira phing rails rake ruby svn gem cake ant symfony2 bundler heroku)

if [[ "$OSTYPE" != "darwin"* ]] ; then plugins[$(($#plugins+1))]=ssh-agent; fi

source $ZSH/oh-my-zsh.sh

# Stop spelling checks of command arguments. Only consider commands.
unsetopt correctall && setopt correct

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:$PATH

# Default Aliases
alias ack='nocorrect ack'
# alias vagrant='nocorrect vagrant'
#alias subl='nocorrect subl'
alias mongod='nocorrect mongod'
alias rake='noglob rake'
alias mate='nocorrect mate'
alias p='nocorrect pstorm'
alias npm='nocorrect npm'
alias rspec='nocorrect rspec '
alias ....='cd ../../..'
alias lsh='ls -lah'
alias console='nocorrect console'

# NPM
alias npm-exec='PATH=$(npm bin):$PATH'

# Git aliases
alias g='git'
alias gs='git status'

# Local config
if [[ -e $HOME/.zshrc.local ]]
then
    source $HOME/.zshrc.local
fi

#
# Provides a review workflow for pull requests. Best used with `prmerge` when ready to merge.
#
# Example - checks out the Pull Request 1 and rebases branch against master:
#     `prfetch master 1`
#     ... Check it out, test, etc.
#     `prmerge master 1`
#     Merges the Pull request, creates a reference to it, then pushes to the remote.
#
# @link http://derickrethans.nl/managing-prs-for-php-mongo.html
#
function prfetch()
{
    git checkout $1
    git fetch origin pull/$2/head:pr/$2
    git checkout pr/$2
    git rebase $1
}

#
# Merge a Pull Request that has been reviewed using `prfetch` and push.
# Example - Merge PR #1 into master and reference the PR in the merge:
#     `prmerge master 1`
#
function prmerge()
{
    git checkout $1
    git merge --no-ff -m "Merged pull request #$2" pr/$2
    git branch -D pr/$2
    git push
}

# Start a simple web server from any directory
function serve()
{
  python -m SimpleHTTPServer 8000
}

function findprocess()
{
    ps aux | grep $1
}

function myprocess()
{
    ps -ef | grep $USER
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
