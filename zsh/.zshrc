export LANG=ja_JP.UTF-8
export LC_ALL=ja_JP.UTF-8

export PATH=/home/takashihigasa/bin:/home/takashigasa/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
export PATH="$PATH"
eval $(dircolors -b ~/.dir_colors)

setopt transient_rprompt

PROMPT="%F{yellow}${HOST}%f%% "
RPROMPT="[%F{yellow}%39<...<% %~%f]"


##
## Option settings
##
setopt extended_glob
setopt extended_history
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_no_store
setopt hist_reduce_blanks
setopt globdots
setopt no_beep
setopt no_list_beep
setopt no_list_types
setopt no_hup
setopt auto_pushd
setopt correct
setopt pushd_ignore_dups
setopt pushd_silent
setopt auto_menu
setopt auto_list
setopt auto_param_keys
setopt auto_param_slash
setopt magic_equal_subst
setopt mark_dirs
setopt print_eight_bit
setopt no_flow_control

setopt always_last_prompt
setopt notify
setopt multios
setopt numeric_glob_sort
unsetopt print_exit_value


##
## Completion configuration
##(hokan)
autoload -Uz compinit
compinit -u
autoload -U colors
colors
compdef _tex platex
compdef _dvi dvipdfmx
bindkey -e
umask 022
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' ignore-parents parent pwd ..
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /sbin /bin
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'so=32' 'pi=33' 'ex=31' 'bd=34;46' 'cd=34;43' 'su=30;41' 'sg=30;46' 'tw=30;42' 'ow=30;43'



##
## history setting
##
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000


##
## alias configuration
##
alias cd='pushd'
alias pd='popd'
alias hd='cd ~'
alias mkdir='mkdir -p'
alias home='cd ${HOME}'
alias open='xdg-open'


##
## <ls> configuration
##

alias ls="ls --color"
alias ll="ls -lFh --color"
alias la="ls -AFh --color"
alias lla="ls -slAFh --color"
alias lal="lla"
