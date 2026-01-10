syntax on
set number
set relativenumber
set cursorline
set cursorcolumn
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
set mouse=a
set clipboard=unnamedplus
set ignorecase
set incsearch
set hlsearch
set smartcase
set termguicolors
set background=dark
set lazyredraw
set updatetime=300
set timeoutlen=500
set scrolloff=8
set backupdir=$HOME/.vim/backups
set directory=$HOME/.vim/swapfiles
set laststatus=2
colorscheme slate

let g:mapleader=" "

nnoremap to :tabnew<Space>
nnoremap tn :tabnext<CR>
nnoremap tp :tabprevious<CR>
nnoremap tc :tabclose<CR> 

nnoremap <leader>bn :tabNext<CR>
nnoremap <leader>bp :tabprevious<CR>
nnoremap <leader>bl :ls<CR>:b<Space>
nnoremap <leader>bc :bd<CR> 

nnoremap <C-p> :Texplore<CR>

nnoremap <C-t> :terminal<CR>

tnoremap <Esc> <C-\><C-n>

nnoremap <leader>s :w<CR>
nnoremap <leader>q :bd<CR>

nnoremap <A-UP> :m .-2<CR>==
nnoremap <A-DOWN> :m .+1<CR>==
xnoremap <A-UP> :m '<-2<CR>gv=gv
xnoremap <A-DOWN> :m '>+1<CR>gv=gv

nnoremap <Tab> >>_
vnoremap <Tab> >gv
nnoremap <S-Tab> <<_
vnoremap <S-Tab> <gv

nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

vnoremap <leader>* "zy:let @/=escape(@z, '/\')<CR>cgn
nnoremap <leader>r :%s//g<Left><Left>

nnoremap <leader>e :Ex<CR>
nnoremap <leader>nf :e %:h/

nnoremap <leader>h :set hlsearch!<CR>

nnoremap <Leader>c :s/^//g<Left><Left>
vnoremap <Leader>c :s/^//g<Left><Left>

nnoremap <leader>y "+y
