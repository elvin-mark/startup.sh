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
set statusline=
set statusline+=\ %{mode()}
set statusline+=\ %f
set statusline+=\ %m
set statusline+=%=
set statusline+=\ %y
set statusline+=\ %l/%L
set statusline+=\ %p%%
set wildmenu
set wildoptions=pum
set wildmode=list:longest,full
colorscheme slate

let g:mapleader=" "

" Tabs
nnoremap to :tabnew<Space>
nnoremap tn :tabnext<CR>
nnoremap tp :tabprevious<CR>
nnoremap tc :tabclose<CR> 

" Buffers
nnoremap <leader>bn :bNext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bl :ls<CR>:b<Space>
nnoremap <leader>bc :bd<CR> 
nnoremap <leader>q :bd<CR>
nnoremap <leader>s :w<CR>

" File Explorer
nnoremap <C-p> :Texplore<CR>
nnoremap <leader>e :Ex<CR>

nnoremap <A-UP> :m .-2<CR>==
nnoremap <A-DOWN> :m .+1<CR>==
xnoremap <A-UP> :m '<-2<CR>gv=gv
xnoremap <A-DOWN> :m '>+1<CR>gv=gv

nnoremap <Tab> >>_
vnoremap <Tab> >gv
nnoremap <S-Tab> <<_
vnoremap <S-Tab> <gv

" Window Navigation
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

vnoremap <leader>* "zy:let @/=escape(@z, '/\')<CR>cgn
nnoremap <leader>r :%s//g<Left><Left>

nnoremap <leader>nf :e %:h/

nnoremap <leader>h :set hlsearch!<CR>

" Writing at the beginning of the line (or multiple lines)
nnoremap <Leader>c :s/^//g<Left><Left>
vnoremap <Leader>c :s/^//g<Left><Left>

" Yanking lines (also copying to the clipboard)
nnoremap <leader>y "+y

" Terminal Toggling
nnoremap <silent> <C-j> :call ToggleTerminal()<CR>
tnoremap <silent> <C-j> <C-\><C-n>:call ToggleTerminal()<CR>
tnoremap <Esc> <C-\><C-n>


let g:term_buf = 0
function! ToggleTerminal()
  if g:term_buf > 0 && bufexists(g:term_buf)
    let l:term_win = bufwinnr(g:term_buf)
    if l:term_win != -1
      execute l:term_win . 'hide'
    else
      execute 'botright 10split'
      execute 'buffer' . g:term_buf
      startinsert
    endif
  else
    botright terminal
    let g:term_buf = bufnr('%')
  endif
endfunction