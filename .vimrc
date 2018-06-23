"set default values
set nocompatible          " using vim, not vi. Lets use it
let mapleader=" "

" ------------------
" set default values
" ------------------
set number                " show line nubers
set relativenumber        " show relative line numbers

set magic                 " use magic when searching with regex
set autoindent            " try to autoindent automatically
set autoread              " keep file up to date

set term=screen-256color

" visualisation of position
set cursorline            " show underline for current cursor
set showcmd               " show command (only if not fully completed)
set showmode              " show the current mode we are in
set ruler                 " show where we are in the file

" tab-related
set expandtab             " use spaces when <tab> is pressed
set shiftwidth=4          " X spaces to indent
set shiftround            " round to multiples of shiftwidth
set tabstop=4             " tab key indents X spaces at a time

set foldenable            " enable folding
set scrolloff=3           " keep space between cursor and top/bottom of the screen
set backspace=indent,eol,start

 " searching
set nohlsearch            " default no highlight when searching
set incsearch             " search when typing command

" autocompletion
set wildmenu
set wildmode=list:full
set wildignore=*.o,*.a,*.hex,*.lib,*git
set completeopt=menu,longest,preview

set noswapfile            " do not create a swap file
set path+=**              " search in all subdirectories

set mouse=a

" just more convenient
nnoremap    :                ;
nnoremap    ;                :
vnoremap    >                >gv
vnoremap    <                <gv
cabb        bb               b#
imap        <silent> <Down>  <C-o>gj
imap        <silent> <Up>    <C-o>gk
nmap        <silent> <Down>  <C-o>gj
nmap        <silent> <Up>    <C-o>gk
vnoremap    <c-c>            "*y
inoremap    <c-v>            <C-r>*
vnoremap    <c-v>            c<C-r>*
map         Y                y$

" Useful leader mappings
nnoremap <leader>ve :tabnew $MYVIMRC<CR>
nnoremap <leader>vr :source $MYVIMRC<CR>

nnoremap <leader>ih  :set invhlsearch<CR>
nnoremap <leader>il  :set invlist<CR>
nnoremap <leader>iw  :set invwrap<CR>

filetype plugin on
filetype indent on
autocmd  FileType c      :setlocal cindent
autocmd  FileType cpp    :setlocal cindent

augroup commenting
  autocmd!
  autocmd Filetype c    nnoremap <buffer> <leader>c I//<Esc>
  autocmd Filetype c    vnoremap <buffer> <leader>c I//<Esc>
  autocmd Filetype h    nnoremap <buffer> <leader>c I//<Esc>
  autocmd Filetype h    vnoremap <buffer> <leader>c I//<Esc>
  autocmd Filetype cpp  nnoremap <buffer> <leader>c I//<Esc>
  autocmd Filetype cpp  vnoremap <buffer> <leader>c I//<Esc>
  autocmd Filetype py   nnoremap <buffer> <leader>c I#<Esc>
  autocmd Filetype py   vnoremap <buffer> <leader>c Iu<Esc>
augroup end

" moving between windows made easy
nnoremap <C-h>  <c-w>h
nnoremap <C-j>  <c-w>j
nnoremap <C-k>  <c-w>k
nnoremap <C-l>  <c-w>l

" Emacs style editing on command-line
cnoremap <C-A>        <Home>
cnoremap <C-E>        <End>
cnoremap <C-B>        <Left>
cnoremap <C-F>        <Right>
cnoremap <C-D>        <Del>
cnoremap <C-N>        <Down>
cnoremap <C-P>        <Up>
cnoremap <A-B>        <S-Left>
cnoremap <A-F>        <S-Right>

" diff
if $diff
    map [   [c
    map ]   ]c
    set scrollbind
    set syntax=diff
endif

"set the colors for the text (listchars will be darker)
syntax on
set bg=dark
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set list
highlight NonText ctermfg=0 guifg=gray
highlight SpecialKey ctermfg=0 guifg=gray

"statusline test
if has('statusline')
  set laststatus=2
  highlight pathToFile      ctermfg=darkgray  ctermbg=0 cterm=bold
  highlight stdColor        ctermfg=white     ctermbg=0
  set statusline = ""
  set statusline+=%#stdColor#
  "set statusline=%<%f%m\ \[%{&ff}:%{&fenc}:%Y]\ %{getcwd()}\ \ 
  set statusline+=%<%#pathToFile#%{getcwd()}\/%#stdColor#%f%m\  "show the filename of the window
  
  set statusline+=%=\ Line:%l\/%L\ %P                           "show the linenumbers and the percentage
  if !exists('$TMUX')
    highlight currentTime   ctermfg=red   ctermbg=black
    set statusline+=\%#currentTime#\ 
    set statusline+=%=%{strftime('%Y/%b/%d\ %a\ %H:%M')}\   "show date & time in the statusline
  endif
endif

"visualize current focus
highlight colorcolumn ctermbg=darkgrey guibg=lightgrey
au FocusLost,WinLeave * let &l:colorcolumn=join(range(1,128),",")
au BufEnter,FocusGained,VimEnter,WinEnter * let &l:colorcolumn=0
au FocusLost,WinLeave * :setlocal norelativenumber
au BufEnter,FocusGained,VimEnter,WinEnter * :setlocal relativenumber
au VimResized * execute "normal! \<c-w>="

"commands for C programming
autocmd Filetype c inoremap {<CR>         {<CR>}<Esc>O
autocmd Filetype c inoremap /*<CR>        /*<CR>*/<Esc>O
autocmd Filetype c inoremap (             ()<Left>
autocmd Filetype c inoremap <expr> )      strpart(getline('.'), col('.')-1,1) == ")" ? "\<Right>" : ")"
autocmd Filetype c nmap     <Leader>c     <Esc>%ky$j%A/*<Esc>p
autocmd Filetype c nmap     <Leader>f     <Esc>%kf(hyiwj%A/*<Esc>p

" easy project navigation
function! GoToTopDirectory(fileInTopDir)
    let l:start = getcwd()
    while !filereadable(a:fileInTopDir)
        let l:prevdir = getcwd()
        cd ..
        if l:prevdir == getcwd()
            execute 'cd' fnameescape(l:start)
            break
        endif
    endwhile
endfunction

cabb cdt call GoToTopDirectory("tags")
