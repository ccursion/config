# Start tmux for interactive shells if it's not already running
if status is-interactive
and not set -q TMUX
    exec tmux
end

if grep -q Microsoft /proc/version
    alias clip='/mnt/c/Windows/system32/clip.exe' 
end

set fish_greeting

# Alias "config" for managing the git repo comprising configuration files
alias config='/usr/bin/git --git-dir=$HOME/.config.git/ --work-tree=$HOME'

alias ls='ls --color'
set -x GREP_COLORS 'ms=01;31:mc=01;31:sl=:cx=:fn=34:ln=32:bn=32:se=36'

set -x DISPLAY 'localhost:0'

umask 022
