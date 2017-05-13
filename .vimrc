set number
set relativenumber
set autoindent
set cursorline
set showcmd
set showmode
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set ruler
set tabstop=2
set foldenable

set noswapfile

syntax on

nnoremap D d$

au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

au FocusLost * :set number
au FocusGained * :set relativenumber

autocmd Filetype c inoremap { 				{<CR>}<Esc>ka<CR><Backspace>
autocmd Filetype c inoremap /* 				/**/<Esc>hi
autocmd Filetype c nmap <Leader>c	<Esc>%ky$j%A/*<Esc>p

