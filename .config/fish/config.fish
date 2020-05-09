if status is-interactive
and not set -q TMUX
    exec tmux
end

set fish_greeting

alias config='/usr/bin/git --git-dir=$HOME/.config.git/ --work-tree=$HOME'
alias ls='ls --color'

umask 022
