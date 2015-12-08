" vim-plug ---------------------------------------------------------------- 
call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'altercation/vim-colors-solarized'
Plug 'benekastah/neomake'
Plug 'chrisbra/Colorizer'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'jelera/vim-javascript-syntax'
Plug 'kchmck/vim-coffee-script'
Plug 'kien/ctrlp.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'lambdatoast/elm.vim'

" vim-cjsx requires
Plug 'mtscout6/vim-cjsx'
Plug 'kchmck/vim-coffee-script'

" Plug 'raichoo/haskell-vim'
Plug 'rking/ag.vim'
" Plug 'scrooloose/syntastic'
Plug 'vim-scripts/haskell.vim'
Plug 'thoughtbot/vim-rspec'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'toyamarinyon/vim-swift'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

call plug#end()

" Basic options ---------------------------------------------------------------
syntax on

let base16colorspace=256
set background=dark
colorscheme base16-tomorrow

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

set spell spelllang=en_us
set complete+=kspell

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

" Plugin options --------------------------------------------------------------
autocmd! BufWritePost * Neomake

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['ruby', 'haskell', 'javascript', 'python', 'bash=sh']

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
