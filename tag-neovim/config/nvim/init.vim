" vim-plug ----------------------------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer' }
Plug 'altercation/vim-colors-solarized'
Plug 'benekastah/neomake'
Plug 'chrisbra/Colorizer'
Plug 'christoomey/vim-rfactory'
Plug 'christoomey/vim-tmux-navigator'
Plug 'christoomey/vim-tmux-runner'
Plug 'janko-m/vim-test'
Plug 'jelera/vim-javascript-syntax'
Plug 'kchmck/vim-coffee-script'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'mileszs/ack.vim'
Plug 'rust-lang/rust.vim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vimwiki/vimwiki'

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

" Add a file which can be used to try out new plugins without having to commit
" them to the repository.
source ~/.config/nvim/plug-candidates.vim

call plug#end()

" Basic options ---------------------------------------------------------------
syntax on

set background=light
colorscheme solarized

set autowrite
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

" Display extra whitespace
set list listchars=tab:»·,trail:·

" https://github.com/neovim/neovim/wiki/FAQ#how-can-i-change-the-cursor-shape-in-the-terminal
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Fix output in Quickfix window with `vim-dispatch`
set shellpipe+=" "

" Key bindings ----------------------------------------------------------------
let mapleader=' '

" Leader commands -------------------------------------------------------------
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

" Searching
nmap <leader>s :Ack 

" Zooming
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

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

" ctrlp: ignore some folders when indexing
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" rg: use `ripgrep` when searching through files
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
  let g:ctrlp_user_command = 'rg %s --files --color=never'
end


" Change the `vimwiki` leader
let g:vimwiki_map_prefix = '<Leader>e'
let wiki = {}
let wiki.path = '~/vimwiki/'
let wiki.nested_syntaxes = { 'ruby': 'ruby', 'coffee': 'coffee', 'js': 'js' }
let g:vimwiki_list = [wiki]

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
