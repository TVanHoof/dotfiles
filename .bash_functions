### general shortcuts to go to, create new tab in, move file to & copy file to destination ###
function GenerateShortcuts {
    alias g$1="cd $2/$3"
    alias t$1="tabto $2"
    alias m$1="mv '$3' '$2'"
    alias y$1="cp '$3' '$2'"
}

function tabto {
    if [ -z $TMUX ]; then echo 'not in a tmux session'; else tmux new-window -c $1/$2; fi
}

function Completions_documents {
    if [ "${#COMP_WORDS[@]}"  != "2" ] ; then
        return
    fi

    COMPREPLY=($(compgen -W "$(ls -l ~/Documents | grep ^d | awk -F' ' '{print $9}')" -- "${COMP_WORDS[1]}"))
}

function Completions_images {
    if [ "${#COMP_WORDS[@]}"  != "2" ] ; then
        return
    fi

    COMPREPLY=($(compgen -W "$(ls -l ~/Pictures | grep ^d | awk -F' ' '{print $9}')" -- "${COMP_WORDS[1]}"))
}

function Completions_music {
    if [ "${#COMP_WORDS[@]}"  != "2" ] ; then
        return
    fi

    COMPREPLY=($(compgen -W "$(ls -l ~/Music | grep ^d | awk -F' ' '{print $9}')" -- "${COMP_WORDS[1]}"))
}

function Completions_workspace {
    if [ "${#COMP_WORDS[@]}"  != "2" ] ; then
        return
    fi

    COMPREPLY=($(compgen -W "$(ls -l ~/Workspace | grep ^d | awk -F' ' '{print $9}')" -- "${COMP_WORDS[1]}"))
}

### usefull functions
function GoToNewDirectory {
    mkdir -p $1 && cd $1 || echo "unable to create directory: $1"
}

function cd_find {
	TEMP=$(find -type d | grep -v git | fzf)
	[ -n "$TEMP" ] && cd $TEMP
}

function wallpaper {
    ln -sf $PWD/$1 $HOME/Pictures/Wallpapers/wallpaper
    feh --bg-fill $HOME/Pictures/Wallpapers/wallpaper
}

function TmuxLoadLocalSettings {
    if [ -x .tmux.local ]; then
        local SHA="$(openssl sha512 .tmux.local)"
        if ! grep -q "$SHA" ~/.tmux.sha 2> /dev/null; then
            cat .tmux.local
            read -p 'REPLY?Run new file (y/n)? '
            echo
            if [[ $REPLY =~ ^[yY] ]]; then
                echo "$SHA" >> ~/.tmux.sha
                ./.tmux.local
            fi
        else
            ./.tmux.local
        fi
    else
        notify-send --expire-time=2000 "Did not find executable file .tmux.local"
        tmux
    fi
}

function colors {
    local fgc bgc vals seq0

    printf "Color escapes are %s\n" '\e[${value};...;${value}m'
    printf "Values 30..37 are \e[33mforeground colors\e[m\n"
    printf "Values 40..47 are \e[43mbackground colors\e[m\n"
    printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

    # foreground colors
    for fgc in {30..37}; do
        # background colors
        for bgc in {40..47}; do
            fgc=${fgc#37} # white
            bgc=${bgc#40} # black

            vals="${fgc:+$fgc;}${bgc}"
            vals=${vals%%;}

            seq0="${vals:+\e[${vals}m}"
            printf "  %-9s" "${seq0:-(default)}"
            printf " ${seq0}TEXT\e[m"
            printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
        done
        echo; echo
    done
}

### git functions
function git_gotoTopDirectory {
    TEMP_OLDPWD=$OLDPWD
    TEMP_PWD=$PWD
    while ! [ -d .git ]; do
        cd ..
        if [ $PWD == $OLDPWD ]; then
            cd $TEMP_PWD
            OLDPWD=$TEMP_OLDPWD
            return
        fi
    done
    OLDPWD=$TEMP_PWD
}

