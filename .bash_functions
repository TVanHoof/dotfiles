### general shortcutsto go to, create new tab in, move file to & copy file to destination ###
function GenerateShortcuts {
    alias g$1="goto $2"
    alias t$1="tabto $2"
    alias m$1="moveto $2"
    alias y$1="copyto $2"
}

function moveto {
    mv $2 $1
}

function copyto {
    cp $2 $1
}

function goto {
    cd $1/$2
}

function tabto {
    if [ -z $TMUX ]; then echo 'not in a tmux session'; else tmux new-window -c $1/$2; fi
}

function Completions_documents {
    if [ "${#COMP_WORDS[@]}"  != "2" ] ; then
        return
    fi

    COMPREPLY=($(compgen -W "$(ls -l ~/Documenten | grep ^d | awk -F' ' '{print $9}')" -- "${COMP_WORDS[1]}"))
}

function Completions_images {
    if [ "${#COMP_WORDS[@]}"  != "2" ] ; then
        return
    fi

    COMPREPLY=($(compgen -W "$(ls -l ~/Afbeeldingen | grep ^d | awk -F' ' '{print $9}')" -- "${COMP_WORDS[1]}"))
}

function Completions_music {
    if [ "${#COMP_WORDS[@]}"  != "2" ] ; then
        return
    fi

    COMPREPLY=($(compgen -W "$(ls -l ~/Muziek | grep ^d | awk -F' ' '{print $9}')" -- "${COMP_WORDS[1]}"))
}

function Completions_workspace {
    if [ "${#COMP_WORDS[@]}"  != "2" ] ; then
        return
    fi

    COMPREPLY=($(compgen -W "$(ls -l ~/workspace | grep ^d | awk -F' ' '{print $9}')" -- "${COMP_WORDS[1]}"))
}

### usefull functions
function GoToNewDirectory {
    mkdir -p $1 && cd $1
}

function background {
    ln -sf $1 ~/Afbeeldingen/wallpaper 
    feh --bg-scale ~/Afbeeldingen/wallpaper
}

function TmuxLoadLocalSettings {
    if [ -x .tmux.local ]; then
        local SHA="$(openssl sha -sha512 .tmux.local)"
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

