### general shortcutsto go to, create new tab in, move file to & copy file to destination ###
function GenerateShortcuts {
    alias g$1="cd $2"
    alias t$1="if [ -z $TMUX ]; then echo 'not in a tmux session'; else tmux new-window -c $2; fi"
    alias m$1="moveto $2"
    alias y$1="copyto $2"
}

function moveto {
    mv $2 $1
}

function copyto {
    cp $2 $1
}

### usefull functions
function weather {
    if [ -z $1 ]; then 
        curl wttr.in; 
    else 
        curl wttr.in/~$1; 
    fi
}

function GoToNewDirectory {
    mkdir -p $1 && cd $1
}

function background {
    ln -sf $1 ~/Afbeeldingen/wallpaper 
    feh --bg-scale ~/Afbeeldingen/wallpaper
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
    OLDPWD=TEMP_PWD
}

