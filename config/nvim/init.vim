filetype plugin indent on
syntax enable

set autoindent
set autowrite
set backspace=2
set cursorline
set expandtab
set exrc
set laststatus=2
set lazyredraw
set modeline
set nobackup
set noswapfile
set nowrap
set number
set relativenumber
set ruler
set secure
set shiftwidth=2
set tabstop=2
set tags=.git/tags

let mapleader = "\<Space>"

call plug#begin('~/.vim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'bzf/vim-concentric-sort-motion'
Plug 'chriskempson/base16-vim'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dense-analysis/ale'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } | Plug 'junegunn/fzf.vim'
Plug 'kana/vim-textobj-user' | Plug 'kana/vim-textobj-indent' | Plug 'christoomey/vim-sort-motion'
Plug 'mustache/vim-mustache-handlebars'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'pangloss/vim-javascript'
Plug 'pbrisbin/vim-mkdir'
Plug 'sukima/vim-javascript-imports' | Plug 'sukima/vim-ember-imports'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

call plug#end()

let g:ale_linters = {
      \ 'javascript': ['eslint', 'prettier']
      \ }

let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': ['prettier']
      \ }

let g:ale_linters_explicit = 1
let g:ale_fix_on_save = 1

silent! colorscheme base16-default-dark
silent! set background=dark
let base16colorspace=256

if executable('rg')
  set grepprg=rg\ --vimgrep
end

nmap <C-p> :Files<CR>
nmap <leader>gc :Gcommit -v
nmap <leader>gs :Gstatus<CR>
nmap <silent> <leader>f :ALEFix<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>t :TestNearest<CR>

tmap <C-o> <C-\><C-n>
