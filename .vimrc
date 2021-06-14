"""""""""""""""""""""""OBVIOUS CHANGES""""""""""""""""""""""

syntax  on
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
" set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
let mapleader = " "


"""""""""""""""""""""""PLUGINS"""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox' "theme
Plug 'vim-utils/vim-man' "tutorials
Plug 'https://github.com/kien/ctrlp.vim.git' "file search, amazing...
Plug 'mbbill/undotree'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
call plug#end()

"""""""""""""""""""""""BUFFERS STUFF""""""""""""""""""""""""
" Inspiration -
" https://joshldavis.com/2014/04/05/vim-tab-madness-buffers-vs-tabs/

" Top bar by vim-airline
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Show all open buffers and their status - buffer list+-
nmap <leader>bl :ls<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>


""""""""""""""""""""""UNDOTREE""""""""""""""""""""""""""""" 
noremap <leader>u :UndotreeShow<CR>


""""""""""""""""""""""APPEARANCE""""""""""""""""""""""""""""" 
" some primagen line... idk the use for yet.
""set colorcolumn=100
"highlight ColorColumn ctermbg=0 guibg=lightgrey
colorscheme gruvbox
set background=dark 

""""""""""""""""""""""EMMET VIM""""""""""""""""""""""""""""" 
let g:user_emmet_mode='n'      "only enamble normal mode functions
let g:user_emmet_leader_key=','




"basically doing this for the undo tree as the primagen video
"actually for changing between buffers is also a good idea
