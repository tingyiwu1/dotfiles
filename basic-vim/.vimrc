version 6.0
let s:cpo_save=&cpo
set cpo&vim
inoremap <C-W> u
inoremap <C-U> u
nnoremap  zz
nnoremap  
nnoremap <NL> <NL>
nnoremap  
nnoremap  
nnoremap  zz
nmap  d
vnoremap  d "_d
nnoremap  d "_d
nnoremap  Y "+Y
vnoremap  y "+y
nnoremap  y "+y
nnoremap <silent>  x <Cmd>!chmod +x %
nnoremap  Q <Cmd>:wqa
nnoremap  q <Cmd>:quit
nnoremap  w <Cmd>write
nnoremap & :&&
xnoremap <silent> <expr> @ mode() ==# 'V' ? ':normal! @'.getcharstr().'' : '@'
vnoremap J :m '>+1gv=gv
vnoremap K :m '<-2gv=gv
nnoremap N Nzzzv
xnoremap <silent> <expr> Q mode() ==# 'V' ? ':normal! @=reg_recorded()' : 'Q'
nnoremap Y y$
nnoremap n nzzzv
nnoremap <SNR>51_: :=v:count ? v:count : ''
nnoremap <C-K> 
nnoremap <C-J> <NL>
nnoremap <C-H> 
nnoremap <C-U> zz
nnoremap <C-D> zz
nmap <C-W><C-D> d
nnoremap <C-L> 
inoremap  u
inoremap  u
let &cpo=s:cpo_save
unlet s:cpo_save
set background=dark
colorscheme vague
syntax on
set confirm
set expandtab
set helplang=en
set nohlsearch
set incsearch
set nowrap
set ignorecase
set signcolumn=yes
set scrolloff=8
set shiftwidth=4
set sidescrolloff=8
set smartcase
set smartindent
set softtabstop=4
set splitright
set noswapfile
set tabstop=4
set termguicolors
set updatetime=50
set window=55
set number
set relativenumber
set cursorline
set fillchars+=vert:\│
let &t_EI = "\033[2 q" " NORMAL  █
let &t_SI = "\033[6 q" " INSERT  |

" Let's save undo info!
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile

" vim: set ft=vim :
