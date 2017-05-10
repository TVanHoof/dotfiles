set number
set relativenumber
set autoindent
set cursorline
set showcmd
set showmode
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set visualbell
set ruler
set tabstop=2

syntax on

nnoremap D d$

au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
