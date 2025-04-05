complete -c docker_update -a '(find ~/projects/services/ -mindepth 1 -maxdepth 1 -type d -not -path "*/.*" -printf "%P\n")' -f
