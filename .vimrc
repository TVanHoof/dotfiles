set number
set relativenumber
set autoindent
set cursorline
set showcmd
set showmode
set ruler
set tabstop=2
set foldenable

set noswapfile

syntax on
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set list
highlight SpecialKey ctermfg=0 guifg=gray

nnoremap <leader>v :tabnew $MYVIMRC<CR>
nnoremap <leader>lv	:source $MYVIMRC<CR>
nnoremap D d$

au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

au FocusLost * :set number
au FocusGained * :set relativenumber

nnoremap <C-h>	<c-w>h
nnoremap <C-j>	<c-w>k
nnoremap <C-k>	<c-w>k
nnoremap <C-l>	<c-w>l

autocmd Filetype c inoremap { 				{<CR>}<Esc>ka<CR><Backspace>
autocmd Filetype c inoremap /* 				/**/<Esc>hi
autocmd Filetype c nmap <Leader>c			<Esc>%ky$j%A/*<Esc>p
autocmd Filetype c nmap <Leader>f			<Esc>%kf(hyiwj%A/*<Esc>p
