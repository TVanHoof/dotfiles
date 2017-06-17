"set default values
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

"set the colors for the text (listchars will be darker)
syntax on
set bg=dark
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set list
highlight NonText ctermfg=0 guifg=gray
highlight SpecialKey ctermfg=0 guifg=gray

"shortcuts for editing my .vimrc
nnoremap <leader>ev	:tabnew $MYVIMRC<CR>
nnoremap <leader>lv	:source $MYVIMRC<CR>

"added for continuity with C
nnoremap D d$

"map capslock temporarely to esc (do this only in vim)
au VimEnter * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
au VimLeave * !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'

"visualize current focus
highlight colorcolumn ctermbg=darkgrey guibg=lightgrey
au FocusLost,WinLeave * let &l:colorcolumn=join(range(1,128),",")
au BufEnter,FocusGained,VimEnter,WinEnter * let &l:colorcolumn=0
au FocusLost,WinLeave * :setlocal norelativenumber
au BufEnter,FocusGained,VimEnter,WinEnter * :setlocal relativenumber
au VimResized * execute "normal! \<c-w>="

"moving between windows made easy
nnoremap <C-h>	<c-w>h
nnoremap <C-j>	<c-w>k
nnoremap <C-k>	<c-w>k
nnoremap <C-l>	<c-w>l

"commands for C programming
autocmd Filetype c inoremap { 				{<CR>}<Esc>ka<CR><Backspace>
autocmd Filetype c inoremap /* 				/**/<Esc>hi
autocmd Filetype c nmap <Leader>c			<Esc>%ky$j%A/*<Esc>p
autocmd Filetype c nmap <Leader>f			<Esc>%kf(hyiwj%A/*<Esc>p
