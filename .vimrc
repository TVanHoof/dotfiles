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
set softtabstop=0			" disable softtab
set tabstop=2					" tab key indents X spaces at a time

set foldenable				" enable folding
set nowrap						" disable autowrap
set scrolloff=3				" keep space between cursor and top/bottom of the screen
set backspace=indent,eol,start

" format options
set formatoptions="tc"	" automatic formatting of text and comments
set formatoptions+=q		" allow formating with gq (default)
set formatoptions+=j		" join comments
set formatoptions+=n		" auto-indenting inside numbered lists
set nojoinspaces				" do not insert two spaces after a '.', '?' and '!'

" split direction
set splitbelow
set splitright

" searching
set ignorecase				" search case insensitive
set smartcase					" search with smart case
set nohlsearch				" default no highlight when searching
set incsearch					" search when typing command

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

" remove all autocmds before reloading
autocmd!

" --------------------
" just more convenient
" --------------------
vnoremap	<C-c>				"*y
inoremap	<C-v>				<C-r>*
vnoremap	<C-v>				c<C-r>*
nnoremap	Y						y$
nmap			<Del>				<Nop>

vnoremap	<C-j>				:m '>+1<CR>gv=gv
vnoremap	<C-k>				:m '<-2<CR>gv=gv

" remove all autocmds before sourcing the new set
autocmd!

" ----------------------
" Useful leader mappings
" ----------------------
" edit and reload my vimrc
nnoremap	<leader>ve		:tabnew $MYVIMRC<CR>
nnoremap	<leader>vr		:source $MYVIMRC<CR>

" inverters for commonly used settings
nnoremap	<silent> <leader>ih		:set invhlsearch<CR>
nnoremap	<silent> <leader>il		:set invlist<CR>
nnoremap	<silent> <leader>iw		:set invwrap<CR>

" go to next/previous error and center
nnoremap	<silent> <leader>]		:cn<CR>zz
nnoremap	<silent> <leader>[		:cp<CR>zz

"commands for C programming
augroup C_progamming
	autocmd Filetype c,cpp inoremap	{<CR>					{<CR>}<Esc>O
	autocmd Filetype c,cpp inoremap	/*<CR>				/*<CR>*/<Esc>O
	autocmd Filetype c,cpp inoremap	(							()<Left>
	autocmd Filetype c,cpp inoremap	<expr> )			strpart(getline('.'), col('.')-1,1) == ")" ? "\<Right>" : ")"
	autocmd Filetype c,cpp nmap			<Leader>i			<Esc>%ky$j%A/*<Esc>p
	autocmd Filetype c,cpp nmap			<Leader>f			<Esc>%kf(hyiwj%A/*<Esc>p
	autocmd Filetype c,cpp nnoremap <leader><CR>	^elr(<Esc>A){<CR>}<Esc>O
augroup END

filetype plugin on
filetype indent on
autocmd  FileType c,h,cpp,hpp	:setlocal cindent
augroup commenting
	autocmd Filetype c,cpp,h,hpp	nnoremap	<buffer>	<expr>	<leader>c getline('.') =~ '^\s//.*' ? '^"_2x' : 'I//<Esc>'
	autocmd Filetype c,cpp,h,hpp	vnoremap	<buffer>	<expr>	<leader>c mode ==# 'v' ? 'c/*<c-r>"*/<Esc>gv4l' : mode ==# 'V' ? 'I//<Esc>gv' : 'A*/<Esc>gvI/*<Esc>'
	autocmd Filetype python,sh		nnoremap	<buffer>	<expr>	<leader>c getline('.') =~ '^\s#.*' ? '^"_x' : 'I#<Esc>'
	autocmd Filetype python,sh		vnoremap	<buffer>	<leader>c 				I#<esc>
augroup end

autocmd Filetype c,cpp,h,hpp	nmap <lead>(	^wv$(<Esc>
autocmd Filetype c,cpp,h,hpp	nmap <lead><CR>	^elr(<Esc>A){<CR>

"remove trailing white chars before writing to disk
autocmd BufWritePre * :%s/\s\+$//e

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

	set guifont=Lucida_console:h9
	set langmenu=en_US.UTF-8

	"menu enable and disable
	nnoremap <expr>		<leader>im	&guioptions=~#".*m.*" ? "set guioptions-=m<CR>" : "set guioptions+=m<CR>"

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
if &diff
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
call Abbrev("swtich", "switch", "inore")
call Abbrev("disalbe", "disable", "inore")
call Abbrev("enalbe", "enable", "inore")
call Abbrev("funcition", "function", "inore")
call Abbrev("vehicel", "vehicle", "inore")

" -----------------------------
" My implementation of surround
" -----------------------------
" when a:lhs or a:rhs is pressed in visual mode, the selected text will be
" surrounded by them
function! MyVisualSurround(lhs, rhs, mode)
		exe a:mode . "map <expr> s" . a:lhs . " mode() ==# 'v' ? \"<Esc>`>a" . a:rhs . "<Esc>m>`<i" . a:lhs . "<Esc>lm<gv\" : \"A" . a:rhs . "<Esc>`>lm>gvI" . a:lhs . "<Esc>lm<gv\""
	if a:lhs != a:rhs
		exe a:mode . "map <expr> s" . a:rhs . " mode() ==# 'v' ? \"<Esc>`>a" . a:rhs . "<Esc>m>`<i" . a:lhs . "<Esc>lm<gv\" : \"A" . a:rhs . "<Esc>`>lm>gvI" . a:lhs . "<Esc>lm<gv\""
	endif
endfunction

" when cs<arg1><arg2> is pressed the surrounding <arg1> will be changed to <arg2>
function! MyNormalChangeSurround(from_l, from_r, to_l, to_r, mode)
	execute a:mode . "map cs" . a:from_l . a:to_l . " f". a:from_r . "r" . a:to_r . "F" . a:from_l . "r" . a:to_l
	execute a:mode . "map cs" . a:from_l . a:to_r . " f". a:from_r . "r" . a:to_r . "F" . a:from_l . "r" . a:to_l
	execute a:mode . "map cs" . a:from_r . a:to_l . " f". a:from_r . "r" . a:to_r . "F" . a:from_l . "r" . a:to_l
	execute a:mode . "map cs" . a:from_r . a:to_r . " f". a:from_r . "r" . a:to_r . "F" . a:from_l . "r" . a:to_l
endfunction

function! MyNormalDeleteSurround(from, to, mode)
	execute a:mode . "map ds" . a:from . " f" . a:to . "\"_xF" . a:from . "\"_x"
	if a:from != a:to
		execute a:mode . "map ds" . a:to   . " f" . a:to . "\"_xF" . a:from . "\"_x"
	endif
endfunction

call MyVisualSurround("(", ")", "vnore")
call MyVisualSurround("[", "]", "vnore")
call MyVisualSurround("{", "}", "vnore")
call MyVisualSurround("\'", "\'", "vnore")
"special case for for < and > since we would still like to indent
vnoremap	<expr> < mode() ==# 'V' ? "<gv" : mode() ==# 'v' ? "<Esc>`>a><Esc>m>`<i<<Esc>lm>gv" : "A><Esc>`>lm>gvI<<Esc>lm<gv"
vnoremap	<expr> > mode() ==# 'V' ? ">gv" : mode() ==# 'v' ? "<Esc>`>a><Esc>m>`<i<<Esc>lm>gv" : "A><Esc>`>lm>gvI<<Esc>lm<gv"
"manually entered surround for " because it breaks MyVisualSurround
vnoremap <expr>	s"	mode() ==# 'v' ? "<Esc>`>a\"<Esc>m>`<i\"<Esc>lm<gv" : "A\"<Esc>`>lm>gvI\"<Esc>lm<gv"

let OpenCloseTuples=[["(", ")"], ["{","}"], ["[","]"], ["<",">"], ["'","'"], ["\"", "\""]]
for i in OpenCloseTuples
	for j in OpenCloseTuples
		if i != j
			call MyNormalChangeSurround(i[0], i[1], j[0], j[1], "nnore")
		endif
	endfor
	call MyNormalDeleteSurround(i[0],i[1], "nnore")
endfor

" -------------------
"  LANGUAGE SELECTION
" -------------------
let g:selected_language = 0
function! SelectNextLanguage()
	let l:languages_selection = ["en_us", "nl", "fr_fr", "de_de"]
	set spellang=l:languages_selection[g:selected_language]
	echom "selected language changed to " . l:languages_selection[g:selected_language]
	let g:selected_language = g:selected_language + 1
	if len(l:languages_selection) <= g:selected_language
		let g:selected_language = 0
	endif
endfunction

autocmd Filetype plaintex,latex,text,markdown nnoremap <buffer> <leader>l call SelectNextLanguage<cr>
autocmd BufRead,BufNewFile plaintex,latex,text,markdown setlocal spell

" ------
" SEARCH
" ------
function! SearchInProject(...)
	execute ":grep /" . expand("<cword>") . "/j" . join(a:000, ' ')
	execute ":copen"
endfunction

autocmd FileType c,cpp,h,hpp nnoremap <silent> <leader>/ :call SearchInProject("**/*.c", "**/*.h", "**/*.cpp", "**/*.hpp")<CR>

" ---------
" GRAPHICAL
" ---------
syntax on                                               " enable syntax highlighting
set bg=dark                                             " background color
set listchars=tab:¬\                                    " symbol for visibility of tab characters
set listchars+=eol:⊃                                    " symbol for visibility of the end of line character
set listchars+=extends:>                                " symbol for visibility of an incomplete line
set listchars+=precedes:<                               " symbol for visibility of an incomplete line
set listchars+=trail:•                                  " symbol for visibility of trailing white spaces
set list                                                " show special characters
highlight NonText ctermfg=0 guifg=gray
highlight SpecialKey ctermfg=0 guifg=gray

"statusline
if has('statusline')
	let g:StatusLineMode=0
	let g:StatusLinePath=1
	let g:StatusLineFileType=0
	let g:StatusLineRegion=1
	let g:StatusLineTime=1

	function! ModeToString()
		if "n" == mode()
			highlight mode				ctermfg=grey			ctermbg=black		cterm=bold
			return " NORMAL "
		elseif "v" == mode() || "V" == mode()
			highlight mode				ctermfg=green			ctermbg=black		cterm=bold
			return " VISUAL "
		elseif "s" == mode()
			highlight mode				ctermfg=blue			ctermbg=black		cterm=bold
			return " SELECT "
		elseif "i" == mode()
			highlight mode				ctermfg=white			ctermbg=black		cterm=bold
			return " INSERT "
		elseif "R" == mode()
			highlight node				ctermfg=yellow		ctermfg=black		cterm=bold
			return " REPLACE"
		else
			highlight mode				ctermfg=red				ctermbg=black		cterm=bold
			return " UNKNOWN"
		endif
	endfunction

	set laststatus=2
	highlight pathToFile      ctermfg=darkgray  ctermbg=0 cterm=bold
	highlight stdColor        ctermfg=white     ctermbg=0
	set statusline = ""
	if g:StatusLineMode
		set statusline+=%#mode#
		set statusline+=%{ModeToString()}
	endif

	if g:StatusLinePath
		set statusline+=%<%#pathToFile#%{getcwd()}\\  "show the filename of the window
	endif

	set statusline+=/%#stdColor#%f%m
	set statusline+=%=
	if g:StatusLineFileType
		set statusline+=%y
	endif

	if g:StatusLineRegion
		set statusline+=\ Line:%l\/%L\ %P                           "show the linenumbers and the percentage
	endif
	if !exists('$TMUX') && g:StatusLineTime
		highlight currentTime   ctermfg=red   ctermbg=black
		set statusline+=\ %#currentTime#
		set statusline+=%{strftime('%Y\ %b\ %d\ %a\ %H:%M')}\   "show date & time in the statusline
	endif
endif

"visualize current focus
highlight colorcolumn ctermbg=darkgrey guibg=lightgrey
"au FocusLost,WinLeave * let &l:colorcolumn=join(range(1,128),",")
"au BufEnter,FocusGained,VimEnter,WinEnter * let &l:colorcolumn=0
au FocusLost,WinLeave * :setlocal norelativenumber
au BufEnter,FocusGained,VimEnter,WinEnter * :setlocal relativenumber
au VimResized * execute "normal! \<c-w>="

"Netrw settings
let g:netrw_browse_split = 1
let g:netrw_winsize = 20
let g:netrw_liststyle = 3
function! ToggleNetrw()
	let l:wasOpen = 0
	for i in tabpagebuflist('.')
		if "netrw" == getbufvar(i, "&filetype")
			silent exe "bwipeout " . i
			let l:wasOpen = 1
		endif
	endfor
	if !l:wasOpen
		silent Lexplore
	endif
endfunction

function! OpenSelectedFileWith(cmd)
	:normal v
	let l:path=expand('%:p')
	execute 'q!'
	execute a:cmd . ' ' . l:path
endfunction

function! NetRwMappings()
	nnoremap <silent> <buffer> <C-h> <C-w>h
	nnoremap <silent> <buffer> <C-j> <C-w>j
	nnoremap <silent> <buffer> <C-k> <C-w>k
	nnoremap <silent> <buffer> <C-l> <C-w>l
	nnoremap <silent> <leader>V		:call OpenSelectedFileWith('belowright vnew')<CR>
	nnoremap <silent> <leader>H		:call OpenSelectedFileWith('belowright new')<CR>
	nnoremap <silent> <leader>T		:call OpenSelectedFileWith('tabedit')<CR>
endfunction
nnoremap <silent>	<leader>ex	:call ToggleNetrw()<CR>

autocmd filetype netrw call NetRwMappings()

" easy project navigation
function! GoToTopDirectory(command, fileInTopDir)
	let l:separator = "/"
	let l:prependPath = "/"
	if has('win32')
		let l:separtor = "\\"
		let l:prependPath = ""
	endif
	let l:SearchPath = split(getcwd(), l:separator)
	let l:CurrIndex = -1

	while !filereadable(l:prependPath . join(l:SearchPath[:l:CurrIndex], l:separator) . l:separator . a:fileInTopDir)
		let l:CurrIndex = l:CurrIndex - 1
		if len(l:SearchPath) == -1 * l:CurrIndex
			return
		endif
	endwhile

	execute a:command l:prependPath . join(l:SearchPath[:l:CurrIndex], l:separator)
endfunction

if filereadable(".vimlocalconfig")
	source .vimlocalconfig
	echo "sourced .vimlocalconfig"
endif

cabb cdt    call GoToTopDirectory('cd', "tags")
cabb lcdt   call GoToTopDirectory('lcd', "tags")
cabb cdb    cd %:p:h
cabb lcdb   lcd %:p:h
