" vim-plug ---------------------------------------------------------------- 
call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'altercation/vim-colors-solarized'
Plug 'benekastah/neomake'
Plug 'chrisbra/Colorizer'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'kchmck/vim-coffee-script'
Plug 'lambdatoast/elm.vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'kien/ctrlp.vim'
Plug 'kien/rainbow_parentheses.vim'

" vim-cjsx requires
Plug 'mtscout6/vim-cjsx'
Plug 'kchmck/vim-coffee-script'

Plug 'raichoo/haskell-vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/syntastic'
Plug 'thoughtbot/vim-rspec'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

call plug#end()

" Basic options ---------------------------------------------------------------
syntax on
set background=light
colorscheme solarized

set nowrap
set ruler
set noswapfile
set nobackup
set relativenumber
set number
set autoindent
set laststatus=2
set backspace=2
set lazyredraw

" Always use spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Key bindings ---------------------------------------------------------------- 
let mapleader=' '

" Leader commands -------------------------------------------------------------
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

nmap <leader>dd :call LookupCursorCommand()<CR>
nmap <leader>w :write<CR>
nmap <leader>p :Pry<CR>

" Language dependent functions
nmap <leader>e :call Eval()<CR>
nmap <leader>i :call Interpretator()<CR>
nmap <leader>b :call Build()<CR>

" <c-h> is interpreted as <bs> in neovim
nnoremap <silent> <bs> :TmuxNavigateLeft<cr>

" Functions -------------------------------------------------------------------
function! LookupCursorCommand()
  if has('mac')
    :Dash
  else
    :Zeavim
  endif
endfunction

" Auto commands
autocmd VimResized * :wincmd =
