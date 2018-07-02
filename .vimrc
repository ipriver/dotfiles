"    autodownload vim-plug	"
"""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"""""""""""""""""""""""""""""""""
"	import plugins		"
"""""""""""""""""""""""""""""""""
call plug#begin()

"""""""""""""""""""""""""""""""""
" colorscheme
Plug 'morhetz/gruvbox'	
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark="soft"
set background=dark
"""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""
" Git
Plug 'vim-fugitive'
Plug 'airblade/vim-gitgutter'
"""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""
" NEEED TO BE FIIIXXXXXEEEEED
" airline bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" let g:airline_powerline_fonts=1
" let g:Powerline_symbols='unicode'

"""""""""""""""""""""""""""""""""
" Go
Plug 'fatih/vim-go'
" gocode autocomplete
if has('nvim')
  Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
else
  Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' } 
endif
"""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""
" autocomplete async
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
"""""""""""""""""""""""""""""""""

Plug 'SirVer/ultisnips'	" snippets
Plug 'ctrlpvim/ctrlp.vim'

"""""""""""""""""""""""""""""""""
" configure relative vim numbers
Plug 'jeffkreeftmeijer/vim-numbertoggle'
:set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
"""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""
" Tagbar
Plug 'majutsushi/tagbar' " tags
nmap <F8> :TagbarToggle<CR>
"""""""""""""""""""""""""""""""""

Plug 'jiangmiao/auto-pairs' " bracket pairs
" Plug 'scrooloose/syntastic' " syntax checking plugin
Plug 'AndrewRadev/splitjoin.vim'
Plug 'editorconfig/editorconfig-vim' " editorconfig file
call plug#end()

""""""""""""""""""""""
"      Settings      "
""""""""""""""""""""""
set termguicolors " enable truecolor
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
set pumheight=10                " Completion window max size
set nocursorcolumn              " Do not highlight column (speeds up highlighting)
" set nocursorline                " Do not highlight cursor (speeds up highlighting)
set lazyredraw                  " Wait to redraw
set foldmethod=syntax	" foldmethod groups of lines with the same indent form a fold
set foldlevelstart=1	" to get used for folding

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
"""""""""""""""""""""
"      Plugins      "
"""""""""""""""""""""

" vim-go







let g:airline#extensions#tabline#enabled = 1


" nerdtree configs
" map <C-n> :NERDTreeToggle<CR>
colorscheme gruvbox
