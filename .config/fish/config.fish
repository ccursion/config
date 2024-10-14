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

alias ls='ls --color=auto'
#set -x LS_COLORS 'rs=0:di=0;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';
set -x GREP_COLORS 'ms=01;31:mc=01;31:sl=:cx=:fn=34:ln=32:bn=32:se=36'

alias ext="sed 's/.*\.\(.*\)/\\1/'"

set -x DISPLAY 'localhost:0'
set -x SCREENDIR '/home/curtis/.screen'

# Tide promt
set --global tide_pwd_bg_color brblack
set --global tide_git_bg_color brgreen
set --global tide_git_bg_color_urgent brgreen
set --global tide_git_bg_color_unstable brgreen
set --global tide_git_branch_color 000000
set --global tide_git_color_branch 000000
set --global tide_git_color_conflicted 000000
set --global tide_git_color_dirty 000000
set --global tide_git_color_operation 000000
set --global tide_git_color_staged 000000
set --global tide_git_color_stash 000000
set --global tide_git_color_untracked 000000
set --global tide_git_color_upstream 000000
set --global tide_git_conflicted_color 000000
set --global tide_git_dirty_color 000000
set --global tide_git_icon 
set --global tide_git_operation_color 000000
set --global tide_git_staged_color 000000
set --global tide_git_stash_color 000000
set --global tide_git_untracked_color 000000
set --global tide_git_upstream_color 000000
set --global tide_right_prompt_items
#set -U fish_cursor_default line
#set -U fish_cursor_insert line
#set -U fish_cursor_visual line

# Update docker compose images
function docker_update
    for f in $argv
        if test -d $f
            pushd $f
            #docker compose down && docker compose pull && docker compose up -d --remove-orphans
            echo update $f
            popd
        else
            echo "$f is not a directory" 1>&2
            return 1
        end
    end
    docker system prune
end

# Fix Names in Media
function fix_name
    for f in $argv
        set -l n (string replace -a '.' ' ' $f)
        set -l n (string replace -r '\(?((19|20)\d\d).*' '($1)' $n)
        set -l n (string replace -r ' ?(1080p|720p).*' '' $n)
        echo $f
        echo $n
        read -l -n 1 confirm
        if test "$confirm" = "y" -o -z "$confirm"
            # if the source and target directories are not the same then rename
            if test "$f" != "$n/" -a "$f" != "$n"
                mv -i $f $n
            end
            ls $n | grep 'S[0-9][0-9]E[0-9][0-9]' > /dev/null
            if test $status -eq 0
                _fix_name_series "$n"
            else
                _fix_name_movie "$n"
            end
        end
    end
end

function _fix_name_movie
    set -l n $argv[1]
    echo Movie $n
    # move subs if they're in a sub-directory and remove the dir
    if test -d $n/Subs
        echo "Moving Subs"
        set -l first (ls -1 $n/Subs | head -n1)
        mv $n/Subs/$first $n/
        rm -r $n/Subs
    end
    # rename files
    echo "Renaming Files"
    for i in $n/*
        set -l ext (echo $i | ext)
        echo "    $n.$ext"
        mv -i $i "$n/$n.$ext"
    end
end

function _fix_name_series
    set -l n $argv[1]
    echo Series $n
    # rename files
    echo "Renaming Files"
    for i in $n/*.*
        set -l e (string replace -a '.' ' ' $i)
        set -l e (string replace -r '(S\d\d(E\d\d)+).*' '$1' $e)
        set -l ext (echo $i | ext)

        set -l subdir $n/Subs/(basename $i .$ext)

        echo "    $e.$ext"
        mv -i $i "$e.$ext"
        if test -d $subdir
            set -l s (ls -1 $subdir | head -n1)
            mv -i $subdir/$s "$e.srt"
            rm -r $subdir
        end
    end
    rmdir $n/Subs
end

# VI mode
fish_vi_key_bindings
function fish_vi_cursor
end

umask 022
