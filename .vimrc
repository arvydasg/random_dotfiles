" Heavily inspired by https://github.com/ReekenX/dotfiles/blob/master/.vimrc

" Load plugins {{{
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdcommenter' " comment text out
Plug 'tpope/vim-surround' " surround text with ' { ( or w/e or editing html tags
Plug 'itchyny/lightline.vim' " indicating modes and more info bottom bar
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' " fuzzy file finder
Plug 'easymotion/vim-easymotion' "jump to word
Plug 'rakr/vim-one' " theme
Plug 'yuttie/comfortable-motion.vim' "smooth scrolling
Plug 'mattn/emmet-vim' "adding html tags
" Plug 'dense-analysis/ale' "WHEN READY!!!!!!!!!!!

" Automatically show Vim's complete menu while typing. - Finally!
Plug 'vim-scripts/AutoComplPop' " super duper text autocompletion
call plug#end()
" }}}

" Theme {{{
syntax on

" turn relative line numbers on
set relativenumber

" Theme customization
colorscheme one
set background=dark
set termguicolors

" Show status line always
set laststatus=2
" }}}

" Add cursorline
set cursorline
hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white 

" Set tab to 2 spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab

" Don't wrap text (it's like punishment for bad code)
set nowrap
set textwidth=0

" Enable mouse features for normal mode only, to prevent paste from explosion
set mouse=n

" For new lines automatically indent by current line indent
set autoindent
set copyindent

" Allow cursor to go in to 'invalid' places - this option got me tripping at
" first 
set virtualedit=all

" No welcome screen
set shortmess=Fmnrwx
set cmdheight=1

" " Autocomplete navigation without arrow keys - nice!!!
inoremap <expr> <c-j> ((pumvisible())?("\<C-n>"):("j"))
inoremap <expr> <c-k> ((pumvisible())?("\<C-p>"):("k"))
" }}}

" Search {{{
" Ignore case in search and replace
set ignorecase

" Found text will be highlighted and search will be repeated over file
set incsearch

" Smart search: if lowercase ignore case of matches, if not case-sensitive search
set smartcase
" }}}

" VIM FZF plugin settings {{{
let g:fzf_layout = { 'down': '~35%' }
" let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
map <leader>/ :Rg! <CR>
map <leader>f :Files<CR>
map <leader>b :Buffers<CR> 
" }}}

" Backups and swap {{{
set backup
silent execute '!mkdir -p /tmp/.vim-backup'
set backupdir=/tmp/.vim-backup

set noswapfile
autocmd BufWritePre * let &bex = '-' . strftime("%Y-%m-%d_%H:%M")
" }}}

" Keyboard mappings {{{

" Mapleader from \ to space
let mapleader=" "

" move to beginning/end of line - nice
nnoremap B ^
nnoremap E $

" kj insttead of ESC  
inoremap kj  <ESC>
                                     
" Accidents happen - allowing capitals for saving and quitting
:command WQ wq
:command Wq wq
:command W w
:command Q q
" }}}

" Buffers stuff {{{

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" Autosave according to Remigijus Jarmalavičius
set updatetime=1000
autocmd CursorHold,CursorHoldI * silent update

" Open new buffer
nmap <leader>t :enew<cr>

" Close buffer
nnoremap <leader>x :bd<CR>
" nnoremap <c-x> :bd<CR>

" Enter currently editing files list
map <leader>e :Ex<CR>

" Move to the next buffer
nmap <leader>k :bnext<CR>

" Move to the previous buffer
nmap <leader>j :bprevious<CR>
" }}}

" VIM Easy Motion plugin settings - Amazing... {{{
map <Space><Space> <Plug>(easymotion-bd-w)
" }}}

" Spell Checker {{{
" cool function to ToggleSpellCheck
set spelllang=en_us
function! ToggleSpellCheck()
  set spell!
  if &spell
    echo "Spellcheck ON"
  else
    echo "Spellcheck OFF"
  endif
endfunction

nnoremap <silent> <Leader>sp :call ToggleSpellCheck()<CR>

" In case the theme overrides the Spellcheck... finally found the solution
" here - https://stackoverflow.com/questions/6008921/how-to-change-the-highlight-style-in-vim-spellcheck
hi clear SpellBad
hi SpellBad cterm=underline,bold
hi SpellBad ctermfg=red
" }}}

" Ignore rules for file editing {{{
set wildmenu  "shows multiple matches on one line
set wildchar=<tab>
set wildmode=list:full
set wildignore+=*.swp,*.bak,*.pyc,*.pyo,*.so,*~,*.zip,*.gz,*.tar
set wildignore+=virtual/,.virtualenv/,upload/,uploads/,node_modules/
" }}}

" Omnicomplete plugin settings {{{
set complete+=kspell "ctrl+p in insert mode to check the word while typing. Otherwise it would be
" annoying if every word autocompletes
set completeopt=menuone,longest " :h completeopt
set shortmess+=c " don't pass messages to |ins-completion-menu|
" autocomplete with Tab key - would be nice, but removes the ctrl+p function in Insert mode
" inoremap <expr> <Tab> pumvisible() ? "<C-y>" : "<Tab>"
" }}}

" VIM Smooth Scroll plugin settings {{{
set scrolloff=3
" }}}

" VIM Nerd commenter plugin settings {{{
" [count]<leader>cc - Comment out the current line or text selected in visual mode.
let g:NERDSpaceDelims=1
let g:NERDDefaultAlign = 'left'
" }}}

" HTML macros. then . to repeat {{{     
let @o = 'I<p>'
let @c = 'A</p>'
" }}}


" Emmet vim - html stuff {{{
let g:user_emmet_mode='n'      "only enable normal mode functions
let g:user_emmet_leader_key=','
" }}}
