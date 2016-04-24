"------------------ VUNDLE ---------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.

Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-fugitive'
Plugin 'The-NERD-tree'
Plugin 'Tagbar'
Plugin 'matchparenpp'
Plugin 'vim-google-scribe'
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'https://github.com/fholgado/minibufexpl.vim'
Plugin 'fatih/vim-go'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"-----------------------------------------------

"----------------- CTAGS -----------------------
set tags=./tags
"set tags+=~/Work/arcus/repo/aiceru/arcus-c-client/tags
set tags+=~/Work/arcus/repo/naver/arcus/zookeeper/src/c/tags
"-----------------------------------------------

"----------------- SYNTAX ----------------------
syntax enable
set t_Co=256
set background=dark
colorscheme primary
set nu
set ruler
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set smarttab
set hlsearch
set cursorline
hi CursorLine cterm=NONE ctermbg=236 guibg=#303030
"----------------- CSCOPE ----------------------
set csprg=/usr/local/opt/cscope/bin/cscope

set csto=0
set cst
set nocsverb

silent cs add cscope.out
"silent cs add ~/Work/arcus/repo/aiceru/arcus-c-client/cscope.out
silent cs add ~/Work/arcus/repo/naver/arcus/zookeeper/src/c/cscope.out
set csverb

func! Sts()
	let st = expand("<cword>")
	exe "sts ".st
endfunc
nmap ,st :call Sts()<CR>

func! Tj()
	let st = expand("<cword>")
	exe "tj ".st
endfunc
nmap ,tj :call Tj()<CR>
"-----------------------------------------------

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>
"-----------------------------------------------

"---------------- NERDTREE ---------------------
nnoremap <silent> <F7> :NERDTreeToggle<CR>
"---------------- TAGBAR -----------------------
nnoremap <silent> <F8> :TagbarToggle<CR>
"-----------------------------------------------

nmap <C-\>/ /<C-R>=expand("<cword>")<CR>

"--------------- FuzzyFinder -------------------
let g:FuzzyFinderOptions = { 'Base':{}, 'Buffer':{}, 'File':{}, 'Dir':{}, 'MruFile':{}, 'MruCmd':{}, 'FavFile':{}, 'Tag':{}, 'TaggedFile':{}}
let g:FuzzyFinderOptions.File.excluded_path = '\v\~$|\.o$|\.exe$|\.bak$|\.swp$|\.class$|\.settings$|CVS|((^|[/\\])\.[/\\]$)'
let g:FuzzyFinderOptions.Base.ignore_case = 0

map <Leader>ff <ESC>:FufFile **/<CR>
map <Leader>fb <ESC>:FufBuffer<CR>
"--------------- CUSTOM CMD --------------------
nnoremap <Leader><Space> :noh<CR>
nnoremap <F11> :set cursorline!<CR>
noremap <F12> :set invnumber<CR>
inoremap <F12> <C-O>:set invnumber<CR>
nnoremap <F9> :!make clean && make<CR>

"--------------- minibufexpl -------------------
noremap <F1> :bprev<CR>
noremap <F2> :bnext<CR>
noremap <F4> :MBEbd<CR>

"--------------- vim-go ------------------------
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_fmg_autosave = 0
let g:go_play_open_browser = 0
let g:go_bin_path=expand("~/.gotools")
