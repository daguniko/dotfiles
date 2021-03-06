# reference [anaconda]
# http://qiita.com/ken0nek/items/c51b8e2b83d902698fdf

# [[ $TERM != "screen" ]] && exec tmux

alias vi='/usr/local/bin/vim'
alias vim='/usr/local/bin/vim'
alias gvi='/usr/local/bin/vim -g'

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="wezm"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
#DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
#DISABLE_AUTO_TITLE="true"
export DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# autoload colors
# colors
# case ${UID} in
# 0)
#     PROMPT="%{${fg[magenta]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') %B%{${fg[red]}%}%/#%{${reset_color}%}%b "
#     PROMPT2="%B%{${fg[magenta]}%}%_#%{${reset_color}%}%b "
#     SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
#     ;;
# *)
#     PROMPT="%{${fg[magenta]}%}%/%%%{${reset_color}%} "
#     PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
#     SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
#     [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
#         PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
#     ;;
# esac

#pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

#plenv
export PATH=/Users/admin/.plenv/shims/perl:

# init path
# mac
if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
fi

export PATH=${HOME}/local/bin:${HOME}/bin:/usr/local/bin:$PATH

# alias for carton
alias ce='carton exec'
alias ci='carton install'

alias cit='cpanm --installdeps . --notest'

# cdr
autoload -Uz add-zsh-hock
autoload -Uz chpwd_recent_dirs pcdr add-zsh-hook

# setting for peco
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
    tac="tac"
    else
    tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
            eval $tac | \
            peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history

function peco-cdr () {
    local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
    if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
    fi
    zle clear-screen
}
zle -N peco-cdr

bindkey '^@' peco-cdr
bindkey '^r' peco-select-history

# setting for plenv
eval "$(plenv init -)"


#path for sklearn
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/share/python:$PATH

# users generic .zshrc file for zsh(1)
eval "$(hub alias -s)"

# anaconda python
alias py2='source ~/.pyenv/versions/anaconda3-2.3.0/bin/activate py27'
alias py3='source ~/.pyenv/versions/anaconda3-2.3.0/bin/deactivate'


# today
alias today='date +%Y%m%d'
alias tdbl='VAR=`date +%Y%m%d`|touch $VAR.md|mou $VAR.md'

# rbenv binstubs setting
export PATH=./vendor/bin:$PATH
alias rbe='rbenv exec bundle exec'
alias rbi='rbenv exec bundle install --path vendor/bundle'

#bundle settin
alias bcp='bundle config BUNDLE_PATH vendor/bundle'

#rbenv
export RBENV_ROOT=/usr/local/var/rbenv
export PATH="~/.rbenv/shims:/usr/local/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# alias mou
alias mou='open -a "Mou"'

#alias emacs
alias emacs="TERM=xterm-256color /usr/local/bin/emacs"

#setting for javac
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8

#setting GNUTERM for Octave in bash_profile
#export GNUTERM=x11

#setting for ifconfig
export PATH=$PATH:/sbin
export PATH=/Users/sudo/Desktop/TreeTagger/cmd:$PATH
export PATH=/Users/sudo/Desktop/TreeTagger/bin:$PATH
export PATH=/usr/sbin:$PATH

## Environment variable configuration
#
# LANG
#
export LANG=ja_JP.UTF-8
case ${UID} in
0)
    LANG=C
    ;;
esac


## MacPort Path
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH
#export MANPATH=/opt/local/man:$MANPATH

## Default shell configuration
#
# set prompt
#
autoload colors
# colors
# case ${UID} in
# 0)
#     PROMPT="%{${fg[magenta]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') %B%{${fg[red]}%}%/#%{${reset_color}%}%b "
#     PROMPT2="%B%{${fg[magenta]}%}%_#%{${reset_color}%}%b "
#     SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
#     ;;
# *)
#     PROMPT="%{${fg[magenta]}%}%/%%%{${reset_color}%} "
#     PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
#     SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
#     [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
#         PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
#     ;;
# esac

# # auto change directory
# #
# setopt auto_cd

# # auto directory pushd that you can get dirs list by cd -[tab]
# #
# setopt auto_pushd

# # command correct edition before each completion attempt
# #
# setopt correct

# # compacked complete list display
# #
# setopt list_packed

# # no remove postfix slash of command line
# #
# setopt noautoremoveslash

# # no beep sound when complete list displayed
# #
# setopt nolistbeep


## Keybind configuration
#
# emacs like keybind (e.x. Ctrl-a gets to line head and Ctrl-e gets
#   to end) and something additions
#
bindkey -e
bindkey "^[[1~" beginning-of-line # Home gets to line head
bindkey "^[[4~" end-of-line # End gets to line end
bindkey "^[[3~" delete-char # Del

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end

# reverse menu completion binded to Shift-Tab
#
bindkey "\e[Z" reverse-menu-complete


## Command history configuration
#
HISTFILE=${HOME}/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data


## Completion configuration
#
fpath=(${HOME}/.zsh/functions/Completion ${fpath})
autoload -U compinit
compinit -u


## zsh editor
#
autoload zed


## Prediction configuration
#
#autoload predict-on
#predict-off


## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases     # aliased ls needs if file/dir completions work
alias where="command -v"
alias j="jobs -l"

case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
linux*)
    alias ls="ls --color"
    ;;
esac

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -la"

alias du="du -h"
alias df="df -h"

alias su="su -l"
alias bi="bundle install"
alias be="bundle exec"

alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

#original alias
alias pwdc="pwd | pbcopy"

## terminal configuration
#
case "${TERM}" in
screen)
    TERM=xterm
    ;;
esac

case "${TERM}" in
xterm|xterm-color)
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
kterm-color)
    stty erase '^H'
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
kterm)
    stty erase '^H'
    ;;
cons25)
    unset LANG
    export LSCOLORS=ExFxCxdxBxegedabagacad
    export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
jfbterm-color)
    export LSCOLORS=gxFxCxdxBxegedabagacad
    export LS_COLORS='di=01;36:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=;36;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
    ;;
esac

# set terminal title including current directory
#
case "${TERM}" in
xterm|xterm-color|kterm|kterm-color)
    precmd() {
        echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
    }
    ;;
esac


## load user .zshrc configuration file
#
[ -f ${HOME}/.zshrc.mine ] && source ${HOME}/.zshrc.minesource ~/.tmuxinator/tmuxinator.zsh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
# enhancd
if [ -f "/Users/admin/.enhancd/zsh/enhancd.zsh" ]; then
    source "/Users/admin/.enhancd/zsh/enhancd.zsh"
fi

export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
 export PATH=${PYENV_ROOT}/bin:$PATH
 eval "$(pyenv init -)"
fi


# Visual Studio Code
vscode () {
    if [[ $# = 0 ]]
    then
        open -a "Visual Studio Code"
    else
        [[ $1 = /* ]] && F="$1" || F="$PWD/${1#./}"
        open -a "Visual Studio Code" --args "$F"
    fi
}

# pyenv
export PYENV_ROOT="${HOME}/.pyenv"
export PATH=${PYENV_ROOT}/bin:$PATH
eval "$(pyenv init -)"
export LESS="-R"
export EDITOR=vim
source $HOME/enhancd/init.sh

# if [ -n "$PYENV_COMMAND" ] && [ ! -x "$PYENV_COMMAND_PATH" ]; then
#     versions=($(pyenv-whence "${PYENV_COMMAND}" 2>/dev/null || true))
#     if [ "${#versions[@]}" -eq 1 ]; then
# 	PYENV_COMMAND_PATH="${PYENV_ROOT}/versions/${versions[0]}/bin/${PYENV_COMMAND}"
#     fi
#     fi
