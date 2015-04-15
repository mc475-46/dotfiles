set nocompatible

" ¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿http://vimblog.hatenablog.com/entry/vimrc_set_recommended_options¿
" ¿¿¿¿¿¿¿¿¿¿¿¿¿http://www.geek.sc/archives/977¿¿¿¿¿¿

"---------------------------------------------------------------------------
" ¿¿¿¿¿¿¿¿¿¿¿¿¿¿:
set clipboard=unnamed,unnamedplus
set shellslash
" set iminsert=2
set visualbell t_vb=
set noerrorbells
set t_Co=256

set ttymouse=xterm2
set mouse=a

set lazyredraw
set notitle
"---------------------------------------------------------------------------
" ¿¿¿¿¿¿¿¿¿¿¿:
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan
set gdefault

"---------------------------------------------------------------------------
" ¿¿¿¿¿¿¿¿¿¿¿¿¿¿:
"
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartindent
set autoindent
set expandtab

set shiftround

"---------------------------------------------------------------------------
" GUI¿¿¿¿¿¿¿¿¿¿¿¿¿:
set number
set ruler
set list " ¿¿¿¿¿¿¿¿
set listchars=tab:>-,trail:-,eol:$
set wrap
set laststatus=2
set cmdheight=2
set showcmd
set showmatch
set cursorline
set cursorcolumn
set helpheight=999

syntax on
set matchpairs& matchpairs+=<:>
set matchtime=3
set textwidth=0

"---------------------------------------------------------------------------
" ¿¿¿¿¿¿¿¿¿¿¿¿:
set nobackup
set nowritebackup
set confirm
set autoread
set noswapfile
set hidden

set switchbuf=useopen

"---------------------------------------------------------------------------
" ¿¿¿¿¿¿¿¿¿¿¿:
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
set scrolloff=8
set sidescrolloff=16
set sidescroll=1

set nostartofline
" set virtualedit=all

"---------------------------------------------------------------------------
" ¿¿¿¿¿¿¿¿¿¿:
set wildmenu wildmode=list:longest,full
set history=10000
set formatoptions+=mM " ¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿

" set complete+=k " ¿¿¿¿¿¿¿¿¿¿¿¿
" set completeopt=menu,preview,menuone " ¿¿¿¿¿¿

"---------------------------------------------------------------------------
" ¿¿¿¿¿¿¿¿¿¿
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconv¿eucJP-ms¿¿¿¿¿¿¿¿¿¿¿¿¿
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconv¿JISX0213¿¿¿¿¿¿¿¿¿¿¿¿¿
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodings¿¿¿
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " ¿¿¿¿¿
  unlet s:enc_euc
  unlet s:enc_jis
endif
" ¿¿¿¿¿¿¿¿¿¿¿ fileencoding ¿ encoding ¿¿¿¿¿¿¿¿
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif

"---------------------------------------------------------------------------
" ¿¿¿¿¿¿¿¿¿¿
" ¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿
if exists('&ambiwidth')
  set ambiwidth=double
endif

set fileformats=unix,dos,mac

"---------------------------------------------------------------------------
" ¿¿¿¿¿¿¿
inoremap jj <Esc>
nmap <silent> <Esc><Esc> :nohlsearch<CR>

nnoremap <silent> <F12> :e $HOME/.vimrc<CR>

" ¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" j, k ¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿¿
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" v¿¿¿¿¿¿¿¿¿¿
vnoremap v $h

inoremap <BS> <LEFT><del>
nnoremap <silent> <C-s> :w<CR>
" nnoremap

" ¿¿¿¿¿¿¿¿¿¿¿¿¿
" imap <C-j> <Down>
" imap <C-k> <Up>
" imap <C-h> <Left>
" imap <C-l> <Right>


" imap<S-Down>  <Esc>v<Down>
" imap<S-Up>    <Esc>v<Up>
" imap<S-Left>  <Esc>v<Left>
" imap<S-Right> <Esc>v<Right>


source $HOME/.vimrc_plugin

