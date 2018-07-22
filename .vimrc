"	autodownload vim-plug	 
" ------------------------------->
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" <-------------------------------

"	import plugins		 
" ------------------------------->
call plug#begin()

"	NerdTree
" ------------------------------->
 Plug 'scrooloose/nerdtree'
 noremap <F2> :NERDTreeToggle<CR>
 let g:NERDTreeMinimalUI=1
 " Single-click to toggle directory nodes, double-click to open non-directory nodes.
 let g:NERDTreeMouseMode=2
 let g:NERDTreeHijackNetrw=0
" <-------------------------------

"	C C++
" ------------------------------->
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
" <-------------------------------

"	smooth scroll
" ------------------------------->
" Plug 'yuttie/comfortable-motion.vim' Alternative
Plug 'terryma/vim-smooth-scroll'
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
" <-------------------------------

"	colorscheme
" ------------------------------->
Plug 'morhetz/gruvbox'	
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="soft"
set background=dark
" <-------------------------------

"	Neomake
" ------------------------------->
Plug 'neomake/neomake'
" <-------------------------------


" Git
" ------------------------------->
Plug 'tpope/vim-fugitive'
" Git signs +-~
Plug 'airblade/vim-gitgutter'
set updatetime=100 " add updatetime for signs
let g:gitgutter_override_sign_column_highlight = 1 " colortheme bg color
" <-------------------------------


" NEEED TO BE FIIIXXXXXEEEEED
" airline bar
" ------------------------------->
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" let g:airline_powerline_fonts=1
" let g:Powerline_symbols='unicode'
" <-------------------------------

" Go
" ------------------------------->
Plug 'fatih/vim-go'
" gocode autocomplete
if has('nvim')
  Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
else
  Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' } 
endif
" <-------------------------------


" autocomplete async
" ------------------------------->
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" Use deoplete.
let g:deoplete#enable_at_startup = 1
" autocomplete for go
Plug 'zchee/deoplete-go', { 'do': 'make'} " is using gocode
" neocomplete like
set completeopt+=noinsert
" deoplete.nvim recommend
set completeopt+=noselect
Plug 'tweekmonster/deoplete-clang2' " for C language
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' } " for JS
Plug 'zchee/deoplete-jedi' " Python
" <-------------------------------


" configure relative vim numbers
" ------------------------------->
Plug 'jeffkreeftmeijer/vim-numbertoggle'
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
" <-------------------------------


" HTML CSS
" Emmet
" ------------------------------->
Plug 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
augroup emmetgroup
	autocmd!
	autocmd FileType html,css EmmetInstall
augroup END
" CSS colors
Plug 'ap/vim-css-color' " highlight colors
" <-------------------------------


" Tagbar
" ------------------------------->
Plug 'majutsushi/tagbar' " tags
noremap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
" <-------------------------------

" syntastic
" Plug 'nvie/vim-flake8'
" Plug 'scrooloose/syntastic' " syntax checking plugin

Plug 'mhinz/vim-startify' " vim starting page
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-commentary' " fast comments
Plug 'SirVer/ultisnips'	" snippets
Plug 'jiangmiao/auto-pairs' " bracket pairs
Plug 'Yggdroot/indentLine' " display indentLine
Plug 'AndrewRadev/splitjoin.vim'
Plug 'editorconfig/editorconfig-vim' " editorconfig file
Plug 'sheerun/vim-polyglot' " syntax for a lot of filetypes
call plug#end()
" <-------------------------------

"	Settings                  
" ------------------------------->
set nocompatible                " Enables us Vim specific features
filetype off                    " Reset filetype detection first ...
filetype plugin indent on       " ... and enable filetype detection
set ttyfast                     " Indicate fast terminal conn for faster redraw
set laststatus=2                " Show status line always
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically read changed files
set autoindent                  " Enabile Autoindent
set backspace=indent,eol,start  " Makes backspace key more powerful.
set cursorline			" enable underline of the current line
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set noerrorbells                " No beeps
set number                      " Show line numbers
set showcmd                     " Show me what I'm typing
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set autowrite                   " Automatically save before :next, :make etc.
set hidden                      " Buffer should still exist if window is closed
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set noshowmatch                 " Do not show matching brackets by flickering
set noshowmode                  " We show the mode with airline or lightline
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not it begins with upper case
set completeopt=menu,menuone    " Show popup menu, even if there is one entry
set updatetime=300		" Less laggy on my PC
set pumheight=10                " Completion window max size
set nocursorcolumn              " Do not highlight column (speeds up highlighting)
" set nocursorline                " Do not highlight cursor (speeds up highlighting)
set lazyredraw                  " Wait to redraw
set mouse=a			" enable mouse
" set foldmethod=syntax	" foldmethod groups of lines with the same indent form a fold
let mapleader=','

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

"	autogroup for vimrc
" ------------------------------->
augroup filetype_vimrc
	autocmd!
	" reload when vimrc is saved
	autocmd! BufWritePost .vimrc source %
	" folding for .vimrc
	autocmd BufReadPost .vimrc setlocal foldmethod=marker
	autocmd BufReadPost .vimrc setlocal foldmarker=------------------------------->,<-------------------------------
	autocmd BufReadPost .vimrc setlocal foldlevelstart=0
augroup END
" <-------------------------------

"	filetype indention
" ------------------------------->
" augroup filetypedetect
	" autocmd!
	" autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4	
	" autocmd BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
	"autocmd BufNewFile,BufRead *.vim setlocal expandtab shiftwidth=2 tabstop=2
	" autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2
" augroup END
" <-------------------------------

" put quickfix window always to the bottom
augroup quickfix
    autocmd!
    autocmd FileType qf wincmd J
    autocmd FileType qf setlocal wrap
augroup END

"	Maps
" Open vimrc in a split window and reload changes
nnoremap <leader>ev :split $MYVIMRC<CR>
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

" Center the screen
nnoremap <space> zz

" Remove search highlight
function! s:clear_highlight()
  let @/ = ""
  call go#guru#ClearSameIds()
endfunction
nnoremap <silent> <leader><space> :<C-u>call <SID>clear_highlight()<CR>

" Better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Terminal settings
if has('terminal')
  " Kill job and close terminal window
  tnoremap <Leader>tq <C-w><C-C><C-w>c<cr>

  " switch to normal mode with esc
  tnoremap <Esc> <C-W>N

  " mappings to move out from terminal to other views
  tnoremap <C-h> <C-w>h
  tnoremap <C-j> <C-w>j
  tnoremap <C-k> <C-w>k
  tnoremap <C-l> <C-w>l
 
  " Open terminal in vertical, horizontal and new tab
  nnoremap <leader>tv :vsplit<cr>:term ++curwin<CR>
  nnoremap <leader>ts :split<cr>:term ++curwin<CR>
  nnoremap <leader>tt :tabnew<cr>:term ++curwin<CR>

  tnoremap <leader>tv <C-w>:vsplit<cr>:term ++curwin<CR>
  tnoremap <leader>ts <C-w>:split<cr>:term ++curwin<CR>
  tnoremap <leader>tt <C-w>:tabnew<cr>:term ++curwin<CR>

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
" alternative use for fFtT next search
nnoremap : ;

"	Abbreviations
iabbrev @@ g1ran1q@gmail.com
iabbrev gthb https://github.com/ipriver
iabbrev Todate <C-R>=strftime("%d-%b-%Y")<CR>
" <-------------------------------

"	Plugins                   
" ------------------------------->

" vim-go



let g:airline#extensions#tabline#enabled = 1



" <===============================
" nerdtree configs
" map <C-n> :NERDTreeToggle<CR>

"	NEOMAKE
" ------------------------------->
" When writing a buffer (no delay).
call neomake#configure#automake('w')
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing (no delay).
call neomake#configure#automake('rw', 1000)
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 1s; no delay when writing).
call neomake#configure#automake('nrwi', 500)
" <-------------------------------

colorscheme gruvbox
let g:indentLine_enabled = 1
" <-------------------------------

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

