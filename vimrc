""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundle
set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#rc(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/vimproc'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'Indent-Guides'
NeoBundle 'Syntastic'
NeoBundle 'kien/ctrlp.vim'

" specific
NeoBundle 'tpope/vim-haml'
NeoBundle 'bbommarito/vim-slim'
NeoBundle 'kchmck/vim-coffee-script'

" colorscheme
NeoBundle 'mrtazz/molokai.vim'

filetype plugin indent on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ファイル種類の自動判別とそれに応じた適切設定/インデントを行なう。
filetype plugin indent on

" ファイルの種類に応じたシンタックスハイライトを有効にする。
syntax enable

set t_Co=256
set imdisable
set showcmd     "コマンドをステータスラインに表示
set number      "行番号を表示する
set list
set listchars=trail:▸,tab:>-
set autoindent
set showmatch       "閉じ括弧が入力されたとき、対応する開き括弧にわずかの間ジャンプする
set tabstop=2
set shiftwidth=2
set expandtab
set ruler
set laststatus=2
set statusline=
set statusline+=%f\ %m%r%h%w
set statusline+=[%Y][%{&fenc}]
set statusline+=%=
set statusline+=%<%c,%l\ %P
set cursorline
highlight CursorLine term=reverse cterm=reverse

set showtabline=2
set tabline=%!MyTabLine()
function! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif
    let s .= '%' . (i + 1) . 'T'
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor
  let s .= '%#TabLineFill#%T'
  let s .= '%=%{fugitive#statusline()} ' . fnamemodify(getcwd(), ":~")
  return s
endfunction

function! MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let bufname = fnamemodify(bufname(buflist[winnr - 1]), ':t')

  let label = a:n . ": "
  let label .= bufname == '' ? 'No name' : bufname
  return label
endfunction

"行の連結 "J" で、間にスペースを入れない
set nojoinspaces

" 改行文字/インデント/インサートモード開始位置より前の文字を削除可能にする。
set backspace=indent,start

" /{pattern}や?{pattern}による検索で大文字・小文字の違いを無視する。
set ignorecase

" 検索パターンに大文字が含まれる場合は大文字・小文字を区別する。
set smartcase

" vimrcを即座に編集できるようにする
nnoremap <Space>.  :<C-u>edit $MYVIMRC<Enter>

" vimrcを即座にリロードできるようにする
nnoremap <Space>s.  :<C-u>source $MYVIMRC<Enter>

" hilight
set hlsearch
nnoremap <Esc><Esc> :nohlsearch<CR>

" uset qq: and qq/ instead of q: or q/
nnoremap qq: <Esc>q:
nnoremap qq/ <Esc>q/
nnoremap q: <Nop>
nnoremap q/ <Nop>

" ;と:の意味を入れ替える。文字として入力する場合はそのまま。
noremap ;  :
noremap :  ;

" j/kを表示行単位の移動に変更する。
noremap j  gj
noremap k  gk

" gj/gkを論理行単位の移動に変更する。
noremap gj  j
noremap gk  k

" tab
nnoremap tn :<c-u>tabnext<cr>
nnoremap t] :<c-u>tabnext<cr>
nnoremap tt :<c-u>tabnext<cr>
nnoremap tp :<c-u>tabprevious<cr>
nnoremap t[ :<c-u>tabprevious<cr>
nnoremap te :<c-u>tabedit<cr>

" <Leader><Leader>で変更があれば保存
noremap <Leader><Leader> :up<CR>

" Indent on visual mode
vnoremap < <gv
vnoremap > >gv

" molokai.vim
let g:molokai_original = 1

" neocomplcache.vim
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_min_syntax_length = 3

" tcomment
nnoremap <Leader>cc :<C-u>TComment<CR>

" indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 10
let g:indent_guides_guide_size = 1

" EasyMotion
let g:EasyMotion_leader_key = 'f'

" fugitive
cmap gs<CR> Gstatus<CR>
cmap gd<CR> Gdiff<CR>

if filereadable(expand('~/.vim/vimrc.local'))
  source ~/.vim/vimrc.local
endif

colorscheme molokai

