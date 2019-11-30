" ------------------
" set default values
" ------------------
set nocompatible			" using vim, not vi. Lets use it
let mapleader=" "

set number					" show line nubers
set relativenumber			" show relative line numbers

set magic					" use magic when searching with regex
set noautoindent			" try to autoindent automatically
set smartindent				" use indent after {, keywords, ...
set autoread				" keep file up to date

set term=screen-256color

" visualisation of position
set cursorline				" show underline for current cursor
set showcmd					" show command (only if not fully completed)
set showmode				" show the current mode we are in
set showfulltag				" show tag when ins-completion usefull for functions with arguments
set ruler					" show where we are in the file

" tab-related
set noexpandtab				" use spaces when <tab> is pressed
set shiftwidth=2			" X spaces to indent
set shiftround				" round to multiples of shiftwidth
set tabstop=2				" tab key indents X spaces at a time

set foldenable				" enable folding
set nowrap					" disable autowrap
set scrolloff=3				" keep space between cursor and top/bottom of the screen
set backspace=indent,eol,start

" format options
set formatoptions="tc"		" automatic formatting of text and comments
set formatoptions+=q		" allow formating with gq (default)
set formatoptions+=j		" join comments
set formatoptions+=n		" auto-indenting inside numbered lists
set nojoinspaces			" do not insert two spaces after a '.', '?' and '!'

" split direction
set splitbelow
set splitright

" searching
set nohlsearch				" default no highlight when searching
set incsearch				" search when typing command

" autocompletion
set wildmenu
set wildmode=list:full
set wildignore=*.o,*.a,*.hex,*.lib,*git
set completeopt=menu,longest,preview

" stop bell
set belloff=all

set switchbuf=usetab		" re-use open windows/tabs when switching

set noswapfile				" do not create a swap file
set path+=**				" search in all subdirectories

set mouse=a
set mousehide

" --------------------
" just more convenient
" --------------------
nnoremap	:					;
nnoremap	;					:
vnoremap	>					>gv
vnoremap	<					<gv
imap		<silent> <Down>		<C-o>gj
imap		<silent> <Up>		<C-o>gk
nmap		<silent> <Down>		gj
nmap		<silent> <Up>		gk
vnoremap	<C-c>				"*y
inoremap	<C-v>				<C-r>*
vnoremap	<C-v>				c<C-r>*
map			Y					y$
nmap		<Del>				<Nop>

" remove all autocmds before sourcing the new set
autocmd!

" ----------------------
" Useful leader mappings
" ----------------------
" edit and reload my vimrc
nnoremap	<leader>ve		:tabnew $MYVIMRC<CR>
nnoremap	<leader>vr		:source $MYVIMRC<CR>

" quickly write, quit, ...
nnoremap	<leader>w		:w<CR>
nnoremap	<leader>x		:x<CR>
nnoremap	<leader>q		:q!<CR>

" inverters for commonly used settings
nnoremap	<silent> <leader>ih		:set invhlsearch<CR>
nnoremap	<silent> <leader>il		:set invlist<CR>
nnoremap	<silent> <leader>iw		:set invwrap<CR>

" go to next/previous error and center
nnoremap	<silent> <leader>]		:cn<CR>zz
nnoremap	<silent> <leader>[		:cp<CR>zz

"commands for C programming
autocmd Filetype c,cpp inoremap	{<CR>		{<CR>}<Esc>O
autocmd Filetype c,cpp vnoremap	{<CR>		S{<CR>}<Esc>Pk=iB
autocmd Filetype c,cpp inoremap	/*<CR>		/*<CR>*/<Esc>O
autocmd Filetype c,cpp inoremap	(			()<Left>
autocmd Filetype c,cpp inoremap	<expr> )	strpart(getline('.'), col('.')-1,1) == ")" ? "\<Right>" : ")"
autocmd Filetype c,cpp nmap		<Leader>i	<Esc>%ky$j%A/*<Esc>p
autocmd Filetype c,cpp nmap		<Leader>f	<Esc>%kf(hyiwj%A/*<Esc>p

filetype plugin on
filetype indent on
autocmd  FileType c,h,cpp,hpp	:setlocal cindent

augroup commenting
  autocmd Filetype c,cpp,h,hpp	nnoremap <leader>c	I//<Esc>
  "autocmd Filetype c,cpp,h,hpp	vnoremap <leader>c	s/**/<Left><Left>P
  autocmd Filetype c,cpp,h,hpp	vnoremap <expr> <leader>c visualmode() ==# 'v' ? s/*<c-r>'*/<esc>gv : visualmode() ==# 'V'? <esc>'<I/*<esc>'A*/ : I//
  autocmd Filetype py			nnoremap <leader>c	I#<Esc>
  autocmd Filetype py			vnoremap <leader>c	Iu<Esc>
augroup end

" --------------------
" GUI stuff
" --------------------
if has('gui')
	" turn of what we don't want
	set guioptions-=T
	set guioptions-=r
	set guioptions-=R
	set guioptions-=l
	set guioptions-=L
	set guioptions-=M
	set guioptions-=m

	"menu enable and disable
	nnoremap <leader>me :set guioptions+=m
	nnoremap <leader>md :set guioptions-=m

	"open gui vim maximzed
	au GUIEnter * simalt ~x
endif

" --------------------------------
" moving between windows made easy
" --------------------------------
nnoremap	<C-h>		<c-w>h
nnoremap	<C-j>		<c-w>j
nnoremap	<C-k>		<c-w>k
nnoremap	<C-l>		<c-w>l

" prefix window
nnoremap	<a-]>			<c-w>}
nnoremap	<silent> <a-[>	:pc

" more consistent with vs & vsplit
cabb	<silent> hs		split
cabb	<silent> hsplit	split

" split and find
cabb	<silent> vsf	vert sf
cabb	<silent> hsf	sf

" -----------------------------------
" Emacs style editing on command-line
" -----------------------------------
cnoremap	<C-A>		<Home>
cnoremap	<C-E>		<End>
cnoremap	<C-B>		<Left>
cnoremap	<C-F>		<Right>
cnoremap	<C-D>		<Del>
cnoremap	<C-N>		<Down>
cnoremap	<C-P>		<Up>
cnoremap	<A-B>		<S-Left>
cnoremap	<A-F>		<S-Right>

" ----------------------------------
" Emacs style editing in insert-mode
" ----------------------------------
inoremap	<C-A>		<Home>
inoremap	<C-E>		<End>
inoremap	<A-F>		<Esc>ea
inoremap	<A-B>		<C-o>b
inoremap	<C-F>		<C-o>l
inoremap	<C-B>		<C-o>h
inoremap	<C-D>		<Del>
inoremap	<C-N>		<C-o>j
inoremap	<C-P>		<C-o>k

" --------------
" Preview window
" --------------
nnoremap	<a-]>			<C-w>}
nnoremap	<silent><a-[>	:pc<CR>

" ----
" diff
" ----
if $diff
	set scrollbind		" scroll all windows together
	set syntax=diff		" visualize mismatches
endif

" ----------------------------------
" Personal typo corrections
" ----------------------------------
function! Abbrev(lhs, rhs, mode)
	let llower = tolower(a:lhs)
	let rlower = tolower(a:rhs)
	let lupper = toupper(a:lhs)
	let rupper = toupper(a:rhs)
	let ltitle = substitute(llower, ".*", "\\u\\0", "")
	let rtitle = substitute(rlower, ".*", "\\u\\0", "")
	exe a:mode . "abbrev" llower rlower
	if llower != lupper
		exe a:mode . "abbrev" lupper rupper
	endif
	if ltitle != lupper && ltitle != llower
		exe a:mode . "abbrev" ltitle rtitle
	endif
endfunction

call Abbrev("flase", "false", "inore")
call Abbrev("deifne", "define", "inore")
call Abbrev("disalbe", "disable", "inore")
call Abbrev("enalbe", "enable", "inore")
call Abbrev("funcition", "function", "inore")
call Abbrev("vehicel", "vehicle", "inore")

" -----------------------------
" My implementation of surround
" -----------------------------
vnoremap	<expr>(	visualmode() ==# 'v'? "<Esc>'>a)<Esc>m>'<i(<Esc>lm<gv" : "A)<Esc>gVI(<Esc>"
vnoremap	<expr>)	visualmode() ==# 'v'? "<Esc>'>a)<Esc>m>'<i(<Esc>lm<gv" : "A)<Esc>gVI(<Esc>"
vnoremap	<expr>{	visualmode() ==# 'v'? "<Esc>'>a}<Esc>m>'<i{<Esc>lm<gv" : "A}<Esc>gVI{<Esc>"
vnoremap	<expr>}	visualmode() ==# 'v'? "<Esc>'>a}<Esc>m>'<i{<Esc>lm<gv" : "A}<Esc>gVI{<Esc>"
vnoremap	<expr>[	visualmode() ==# 'v'? "<Esc>'>a]<Esc>m>'<i[<Esc>lm<gv" : "A]<Esc>gVI[<Esc>"
vnoremap	<expr>]	visualmode() ==# 'v'? "<Esc>'>a]<Esc>m>'<i[<Esc>lm<gv" : "A]<Esc>gVI[<Esc>"
vnoremap	<expr><	visualmode() ==# 'v'? "<Esc>'>a><Esc>m>'<i<<Esc>lm<gv" : "A><Esc>gVI<<Esc>"
vnoremap	<expr>>	visualmode() ==# 'v'? "<Esc>'>a><Esc>m>'<i<<Esc>lm<gv" : "A><Esc>gVI<<Esc>"
vnoremap	<expr>'	visualmode() ==# 'v'? "<Esc>'>a\'<Esc>m>'<i\'<Esc>lm<gv" : "A\'<Esc>gVI\'<Esc>"
vnoremap	<expr>"	visualmode() ==# 'v'? "<Esc>'>a\"<Esc>m>'<i\"<Esc>lm<gv" : "A\"<Esc>gVI\"<Esc>"

" ---------
" GRAPHICAL
" ---------
syntax on                                               " enable syntax highlighting
set bg=dark                                             " background color
set listchars=tab:⊃\                                    " symbol for visibility of tab characters
set listchars+=eol:¬                                    " symbol for visibility of the end of line character
set listchars+=extends:>                                " symbol for visibility of an incomplete line
set listchars+=precedes:<                               " symbol for visibility of an incomplete line
set listchars+=trail:•                                  " symbol for visibility of trailing white spaces
set list                                                " show special characters
highlight NonText ctermfg=0 guifg=gray
highlight SpecialKey ctermfg=0 guifg=gray

"statusline
if has('statusline')
	set laststatus=2
	highlight pathToFile      ctermfg=darkgray  ctermbg=0 cterm=bold
	highlight stdColor        ctermfg=white     ctermbg=0
	set statusline = ""
	set statusline+=%<%#pathToFile#%{getcwd()}\/%#stdColor#%f%m\  "show the filename of the window

	set statusline+=%=\ Line:%l\/%L\ %P                           "show the linenumbers and the percentage
	if !exists('$TMUX')
		highlight currentTime   ctermfg=red   ctermbg=black
		set statusline+=\%#currentTime#\ 
		set statusline+=%=%{strftime('%Y\ %b\ %d\ %a\ %H:%M')}\   "show date & time in the statusline
	endif
endif

"visualize current focus
highlight colorcolumn ctermbg=darkgrey guibg=lightgrey
"au FocusLost,WinLeave * let &l:colorcolumn=join(range(1,128),",")
"au BufEnter,FocusGained,VimEnter,WinEnter * let &l:colorcolumn=0
au FocusLost,WinLeave * :setlocal norelativenumber
au BufEnter,FocusGained,VimEnter,WinEnter * :setlocal relativenumber
au VimResized * execute "normal! \<c-w>="

" easy project navigation
function! GoToTopDirectory(command, fileInTopDir)
	execute a:command ' -'
	let l:startPrevDir = getcwd()       "restore previous working directory if necessary
	execute a:command ' -'
	let l:start = getcwd()              "restore cwd if necessary
	while !filereadable(a:fileInTopDir)
		let l:prevdir = getcwd()
		execute a:command ' ..'
		if l:prevdir == getcwd()
			execute a:command fnameescape(l:startPrevDir)
			execute a:command fnameescape(l:start)
			return
		endif
	endwhile
	let l:topDir = getcwd()
	execute a:command fnameescape(l:start)
	execute a:command fnameescape(l:topDir)
endfunction

if filereadable(".vimlocalconfig")
	source .vimlocalconfig
	echo "sourced .vimlocalconfig"
endif

cabb cdt    call GoToTopDirectory('cd', "tags")
cabb lcdt   call GoToTopDirectory('lcd', "tags")
cabb cdb    cd %:p:h
cabb lcdb   lcd %:p:h
