alias e="$EDITOR"               #mnemonic => edit
alias f="ranger"                #mnemonic => files
alias q="exit"                  #mnemonic => quit
alias t="TmuxLoadLocalSettings" #mnemonic => tmux

DOC="~/Documents"
IMG="~/Pictures"
MUS="~/Music"
WS="~/Workspace"

# Home
GenerateShortcuts h $HOME
# generate  gh => go to home
#           th => new tab in home (tmux)
#           mh => move to home
#           yh => copy to home

# Documents
GenerateShortcuts d $DOC
# generate  gd => go to documents
#           td => new tab in documents (tmux)
#           md => move to documents
#           yd => copy to documents
complete -F Completions_documents gd
complete -F Completions_documents td

# Afbeeldingen/Images
GenerateShortcuts i $IMG
# generate  gi => go to images
#           ti => new tab in images (tmux)
#           mi => move to images
#           yi => copy to images
complete -F Completions_images gi
complete -F Completions_images ti

# Muziek/Music
GenerateShortcuts m $MUS
# generate  gm => go to music
#           tm => new tab in music (tmux)
#           mm => move to music
#           ym => copy to music
complete -F Completions_music gm
complete -F Completions_music tm

GenerateShortcuts dot $DOTFILES
# generate  gdot => go to dotfiles
#           tdot => new tab in dotfiles (tmux)
#           mdot => move to dotfiles
#           ydot => copy to dotfiles

# Workspace
GenerateShortcuts w $WS
# generate  gw => go to workspace
#           tw => new tab in workspace (tmux)
#           mw => move to workspace
#           yw => copy to workspace
complete -F Completions_workspace gw
complete -F Completions_workspace tw

### general stuff
alias wp=wallpaper
alias cdn=GoToNewDirectory
alias cdf=cd_find
alias brc="vim -p ~/.dotfiles/.bashrc ~/.dotfiles/.bash_functions ~/.dotfiles/.bash_aliases ~/.dotfiles/.bash_profile ~/.dotfiles/.profile; source ~/.profile; source ~/.bash_profile"

alias ll="ls -al"                         # list al files in list
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB


### git ###
alias g="git"
alias cdt=git_gotoTopDirectory
