"	import plugins		 
" ------------------------------->
call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'fatih/molokai'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'                                        " git commands
Plug 'airblade/vim-gitgutter'                                    " git signs
Plug 'majutsushi/tagbar'                                         " tags
Plug 'mileszs/ack.vim'                                           " using ag instead
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'hexdigest/gounit-vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Yggdroot/indentLine'                                       " display indentLine
Plug 'godlygeek/tabular'
Plug 'ap/vim-css-color'                                          " highlight colors
Plug 'plasticboy/vim-markdown'                                   " is it useful?
Plug 'editorconfig/editorconfig-vim'                             " editorconfig file
Plug 'mhinz/vim-startify'                                        " vim starting page
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary'                                      " fast comments
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-unimpaired'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'SirVer/ultisnips'                                          " snippets
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'nvie/vim-flake8' 
Plug 'jiangmiao/auto-pairs'                                      " bracket pairs
Plug 'fatih/vim-go'

Plug 'neomake/neomake'
Plug 'scrooloose/syntastic'                                      " syntax checking plugin
Plug 'rhysd/vim-grammarous'                                      " grammar check
Plug 'sheerun/vim-polyglot'                                    " syntax for a lot of filetypes
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'zchee/deoplete-go', { 'do': 'make'}                        " is using gocode
Plug 'tweekmonster/deoplete-clang2'                              " for C language
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' } " for JS
" gocode autocomplete
if has('nvim')
  Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
else
  Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' } 
endif
Plug 'zchee/deoplete-jedi'
Plug 'w0rp/ale'
Plug 'uber/prototool', { 'rtp':'vim/prototool' }
call plug#end()
" <-------------------------------

"	Settings                  
" ------------------------------->
syntax on
set nocompatible               " Enables us Vim specific features
filetype off                   " Reset filetype detection first ...
filetype plugin indent on      " ... and enable filetype detection
set ttyfast                    " Indicate fast terminal conn for faster redraw
set laststatus=2               " Show status line always
set encoding=utf-8             " Set default encoding to UTF-8
set autoread                   " Automatically read changed files
set autoindent                 " Enabile Autoindent
set backspace=indent,eol,start " Makes backspace key more powerful.
set cursorline                 " enable underline of the current line
set incsearch                  " Shows the match while typing
set hlsearch                   " Highlight found searches
set noerrorbells               " No beeps
set number                     " Show line numbers
set showcmd                    " Show me what I'm typing
set noswapfile                 " Don't use swapfile
set nobackup                   " Don't create annoying backup files
set splitright                 " Vertical windows should be split to right
set splitbelow                 " Horizontal windows should split to bottom
set autowrite                  " Automatically save before :next, :make etc.
set hidden                     " Buffer should still exist if window is closed
set fileformats=unix,dos,mac   " Prefer Unix over Windows over OS 9 formats
set noshowmatch                " Do not show matching brackets by flickering
set noshowmode                 " We show the mode with airline or lightline
set ignorecase                 " Search case insensitive...
set smartcase                  " ... but not it begins with upper case
set completeopt=menu,menuone   " Show popup menu, even if there is one entry
set pumheight=10               " Completion window max size
set nocursorcolumn             " Do not highlight column (speeds up highlighting)
set lazyredraw                 " Wait to redraw
set mouse=a                    " enable mouse
set updatetime=100             " add updatetime for signs and for go highlighting
" set foldmethod=syntax        " foldmethod groups of lines with the same indent form a fold
let mapleader=","

if has('termguicolors')
	set termguicolors 		" enable truecolor
endif

" Enable to copy to clipboard for operations like yank, delete, change and put
" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
if has('unnamedplus')
  set clipboard^=unnamed
  set clipboard^=unnamedplus
endif

" This enables us to undo files even if you exit Vim.
if has('persistent_undo')
  set undofile
  set undodir=~/.config/vim/tmp/undo//
endif

" ttmouse is removed in neovim
if !has('nvim')
	set ttymouse=xterm2             " Indicate terminal type for mouse codes
	set ttyscroll=3                 " Speedup scrolling
endif

" Enter automatically into the files directory
autocmd BufEnter * silent! lcd %:p:h

"	autogroup for vimrc
augroup filetype_vimrc
	autocmd!
	" reload when vimrc is saved
	autocmd! BufWritePost .vimrc source %
	" folding for .vimrc
	autocmd BufReadPost .vimrc setlocal foldmethod=marker
	autocmd BufReadPost .vimrc setlocal foldmarker=------------------------------->,<-------------------------------
	autocmd BufReadPost .vimrc setlocal foldlevelstart=0
augroup END

"	filetype indention
augroup filetypedetect
	command! -nargs=* -complete=help Help vertical belowright help <args>
	autocmd FileType help wincmd L
	autocmd FileType vim set tabstop=2|set shiftwidth=2|set noexpandtab
	autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 
	autocmd BufRead,BufNewFile *.gotmpl set filetype=gotexttmpl
  
  autocmd BufNewFile,BufRead *.ino setlocal noet ts=4 sw=4 sts=4
  autocmd BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.md setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.html setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.vim setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.hcl setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.sh setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.proto setlocal expandtab shiftwidth=2 tabstop=2
  
  autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2
augroup END

" put quickfix window always to the bottom
augroup quickfix
	autocmd!
	autocmd FileType qf wincmd J
	autocmd FileType qf setlocal wrap
augroup END

"	Maps
" Open vimrc in a split window and reload changes
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
" buffer fast movement
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>
" Repurpose cursor keys (accessible near homerow via SpaceFN layout) for one
" of my most oft-use key sequences.
nnoremap <silent> <Up> :cprevious<CR>
nnoremap <silent> <Down> :cnext<CR>
nnoremap <silent> <Left> :cpfile<CR>
nnoremap <silent> <Right> :cnfile<CR>
" Some useful quickfix shortcuts for quickfix
map <C-n> :cn<CR>
map <C-m> :cp<CR>
nnoremap <leader>a :cclose<CR>
" Fast saving
nnoremap <leader>w :w!<cr>
nnoremap <silent> <leader>q :q<CR>
nnoremap <silent> <leader>Q :q!<CR>

" Close all but the current one
nnoremap <leader>o :only<CR>

" Center the screen
nnoremap <space> zz

" Quickfix
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>


" Better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Terminal settings
if has('nvim')
  " Kill job and close terminal window
  tnoremap <Leader>q <C-w><C-C><C-w>c<cr>

  " switch to normal mode with esc
  " tnoremap <Esc> <C-W>N
	tnoremap <Esc> <C-\><C-n>

  " mappings to move out from terminal to other views
  tnoremap <C-h> <C-w>h
  tnoremap <C-j> <C-w>j
  tnoremap <C-k> <C-w>k
  tnoremap <C-l> <C-w>l
 
  " Open terminal in vertical, horizontal and new tab
  nnoremap <leader>tv :vsplit<cr>:term<CR>
  nnoremap <leader>ts :split<cr>:term<CR>
  nnoremap <leader>tt :tabnew<cr>:term<CR>

tnoremap <leader>tv <C-w>:vsplit<cr>:termn<CR>
  tnoremap <leader>ts <C-w>:split<cr>:termn<CR>
  tnoremap <leader>tt <C-w>:tabnew<cr>:termn<CR>

  " always start terminal in insert mode when I switch to it
  " NOTE(arslan): startinsert doesn't work in Terminal-normal mode.
  " autocmd WinEnter * if &buftype == 'terminal' | call feedkeys("i") | endif
endif

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Remap H and L (top, bottom of screen to left and right end of line)
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_

" Do not show stupid q: window
map q: :q

" Act like D and C
nnoremap Y y$

" Use ; as :
" Very convenient as you don't have to press shift to run commands
nnoremap ; :
vnoremap ; :
" alternative use for fFtT next search
nnoremap : ;
" reverse fFtT
nnoremap <leader>: , 

"	Abbreviations
iabbrev @@ g1ran1q@gmail.com
iabbrev gthb https://github.com/ipriver
iabbrev Todate <C-R>=strftime("%d-%b-%Y")<CR>
" <-------------------------------

"	Plugin configs                   
" ------------------------------->
"	colorscheme
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="soft"
let g:molokai_original = 1
set background=dark
colorscheme gruvbox

"	NerdTree
 noremap <F2> :NERDTreeToggle<CR>
 let g:NERDTreeMinimalUI=1
 " Single-click to toggle directory nodes, double-click to open non-directory nodes.
 let g:NERDTreeMouseMode=2
 let g:NERDTreeHijackNetrw=0

" Git
" Git signs +-~
let g:gitgutter_override_sign_column_highlight = 1 " colortheme bg color

" Tagbar
noremap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Ack.vim
" let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ackprg = 'ag --vimgrep'

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme="badwolf"

" HTML CSS
" Emmet
let g:user_emmet_install_global = 0
augroup emmetgroup
	autocmd!
	autocmd FileType html,css EmmetInstall
augroup END

" vim-numbertoggle
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" indentLine
let g:indentLine_enabled = 1

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Autopairs
let g:AutoPairsShortcutToggle = 'π' " option + p
let g:AutoPairsShortcutFastWrap = '®' " optoin + r
let g:AutoPairsShortcutJump = 'µ' " option + m
let g:AutoPairsShortcutBackInsert = '√' " option + v

"	NEOMAKE
" When writing a buffer (no delay).
call neomake#configure#automake('w')
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing (no delay).
call neomake#configure#automake('rw', 1000)
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 1s; no delay when writing).
call neomake#configure#automake('nrwi', 500)

" autocomplete async
let g:deoplete#enable_at_startup = 1
set completeopt+=noinsert " neocomplete like
set completeopt+=noselect " deoplete.nvim recommend

" prototool && ale
" We recommend setting just this for Golang, as well as the necessary set for proto.
let g:ale_linters = {
\   'go': ['golint'],
\   'proto': ['prototool'],
\}
" We recommend you set this.
let g:ale_lint_on_text_changed = 'never'
" Set to 'lint' to not do code generation.
" Set to 'compile' to not do linting either and just compile without code generation.
"let g:ale_proto_prototool_command = 'compile'

" ,f will toggle formatting on and off.
" Change to PrototoolFormatFixToggle to toggle with --fix instead.
nnoremap <silent> <leader>f :call PrototoolFormatToggle()<CR>
" ,c will toggle create on and off.
nnoremap <silent> <leader>c :call PrototoolCreateToggle()<CR>
" Uncomment this to enable formatting by default.
"call PrototoolFormatEnable()
" Uncomment this to enable formatting with --fix by default.
"call PrototoolFormatFixEnable()
" Uncomment this to disable creating Protobuf files from a template by default.
"call PrototoolCreateDisable()

" vim-go
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_test_timeout = "10s"
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_addtags_transform = "camelcase"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_deadline = "5s"
let g:go_auto_type_info = 1
let g:go_term_mode = "split"

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

" create a go doc comment based on the word under the cursor
function! s:create_go_doc_comment()
  norm "zyiw
  execute ":put! z"
  execute ":norm I// \<Esc>$"
endfunction
nnoremap <leader>ui :<C-u>call <SID>create_go_doc_comment()<CR>

" Remove search highlight
function! s:clear_highlight()
  let @/ = ""
  call go#guru#ClearSameIds()
endfunction
nnoremap <silent> <leader><space> :<C-u>call <SID>clear_highlight()<CR>

nmap <C-g> :GoDecls<cr>
imap <C-g> <esc>:<C-u>GoDecls<cr>

augroup golang
	autocmd!
	autocmd FileType go nmap <silent> <Leader>v <Plug>(go-def-vertical)
  autocmd FileType go nmap <silent> <Leader>s <Plug>(go-def-split)
  autocmd FileType go nmap <silent> <Leader>d <Plug>(go-def-tab)
	autocmd FileType go nmap <silent> <leader>r  <Plug>(go-run)
	autocmd FileType go nmap <silent> <Leader>i <Plug>(go-info)
	autocmd FileType go nmap <silent> <leader>t  <Plug>(go-test)
	autocmd FileType go nmap <silent> <Leader>ct <Plug>(go-coverage-toggle)
	autocmd FileType go nmap <silent> <Leader>x <Plug>(go-doc-vertical)
	autocmd FileType go nnoremap <silent> <leader>b :<C-u>call <SID>build_go_files()<CR>
	" Use GoFmt and GoImport
	autocmd FileType go nmap <silent> <Leader>f <Plug>(go-imports)

	autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
	autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
	autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
	autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END
" <-------------------------------
