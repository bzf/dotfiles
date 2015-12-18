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
Plug 'rking/ag.vim'
Plug 'vim-scripts/haskell.vim'
Plug 'janko-m/vim-test'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'toyamarinyon/vim-swift'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

" vim-cjsx requires
Plug 'kchmck/vim-coffee-script' | Plug 'mtscout6/vim-cjsx'

" OMG snippets!
Plug 'SirVer/ultisnips' | Plug 'ervandew/supertab' | Plug 'honza/vim-snippets'

" Documentation (Dash on OS X, Zeal on Linux)
if has('mac')
  Plug 'rizzatti/dash.vim'
else
  Plug 'KabbAmine/zeavim.vim'
endif

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

" Test bindings
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" Plugin options --------------------------------------------------------------
autocmd! BufWritePost * Neomake

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['ruby', 'haskell', 'javascript', 'python', 'bash=sh']

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Run the tests using `vim-dispatch`
let test#strategy = "dispatch"

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
