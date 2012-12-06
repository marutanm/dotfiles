""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/ 
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc'
Bundle 'tsukkee/unite-help'
Bundle 'unite-font'
Bundle 'unite-colorscheme'
Bundle 'thinca/vim-quickrun'
Bundle 'mattn/gist-vim'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'newspaper.vim'
Bundle 'wombat256.vim'
Bundle 'mrtazz/molokai.vim'
Bundle 'ref.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'h1mesuke/unite-outline'
Bundle 'Indent-Guides'
Bundle 'tangledhelix/vim-octopress'
Bundle 'Syntastic'

filetype plugin indent on     " required!
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ファイル種類の自動判別とそれに応じた適切設定/インデントを行なう。
filetype plugin indent on

" ファイルの種類に応じたシンタックスハイライトを有効にする。
syntax enable

set t_Co=256
set imdisable
set showcmd			"コマンドをステータスラインに表示
set number			"行番号を表示する
set nolist          "改行記号等を表示しない
"set list
set autoindent
set showmatch       "閉じ括弧が入力されたとき、対応する開き括弧にわずかの間ジャンプする
set tabstop=2
set shiftwidth=2
set expandtab
set ruler
"set rulerformat=%20(%l,%c\ %P%)%=%{strftime('%k:%M')}
set laststatus=2
set statusline=
set statusline+=%f\ %m%r%h%w
set statusline+=[%Y][%{&fenc}]
set statusline+=%{fugitive#statusline()}
set statusline+=%=
set statusline+=%<%c,%l\ %P
"set lines=50
"set columns=150
set cursorline
highlight CursorLine term=reverse cterm=reverse
"set cursorcolumn

set showtabline=2
set tabline=%!MyTabLine()
function MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
    " select the highlighting
    if i + 1 == tabpagenr()
      let s .= '%#TabLineSel#'
    else
      let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    let s .= '%' . (i + 1) . 'T'

    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '
  endfor

  " after the last tab fill with TabLineFill and reset tab page nr
  let s .= '%#TabLineFill#%T'

  let s .= '%=' . fnamemodify(getcwd(), ":~")

  return s
endfunction

function MyTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  return bufname(buflist[winnr - 1])
endfunction

"行の連結 "J" で、間にスペースを入れない
set nojoinspaces

" 改行文字/インデント/インサートモード開始位置より前の文字を削除可能にする。
"set backspace=eol,indent,start
set backspace=indent,start

" /{pattern}や?{pattern}による検索で大文字・小文字の違いを無視する。
set ignorecase

" 検索パターンに大文字が含まれる場合は大文字・小文字を区別する。
set smartcase

" folding 
"set foldmethod=syntax
"set foldmethod=indent

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

"colorscheme torte
"colorscheme wombat
"colorscheme newspaper
colorscheme molokai

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

" Gist.vimrc
source ~/.vimrc.gist
let g:gist_detect_filetype = 1

" unite.vim
"入力モードで開始する
let g:unite_enable_start_insert=1
nnoremap <Space>u :<C-u>Unite file buffer file_mru<CR>
nnoremap <Space><Space> :<C-u>Unite file buffer file_mru<CR>
nnoremap <Space>b :<C-u>Unite buffer <CR>
nnoremap <Space>a :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <Space>r :<C-u>Unite ref/refe<CR>
" nnoremap <Space>ur :<C-u>Unite ref/refe<CR>
nnoremap <Space>l :<C-u>Unite line<CR>
" nnoremap <Space>ul :<C-u>Unite line<CR>
nnoremap <Space>s :<C-u>Unite line<CR>
" nnoremap <Space>us :<C-u>Unite line<CR>
nnoremap <Space>/ :<C-u>Unite line<CR>
" nnoremap <Space>u/ :<C-u>Unite line<CR>
nnoremap <Space>g :<C-u>Unite grep<CR>
" nnoremap <Space>ug :<C-u>Unite grep<CR>
nnoremap <Space>o :<C-u>Unite outline<CR>
" nnoremap <Space>uo :<C-u>Unite outline<CR>
"ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-k> unite#do_action('above')
au FileType unite inoremap <silent> <buffer> <expr> <C-k> unite#do_action('above')
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('below')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('below')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('right')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('right')
au FileType unite nnoremap <silent> <buffer> <expr> <C-h> unite#do_action('left')

" unite-help
" Execute help.
nnoremap <C-h>  :<C-u>Unite -start-insert help<CR>
" Execute help by cursor keyword.
nnoremap <C-h><C-h>  :<C-u>UniteWithCursorWord help<CR>

" ref.vim
" /usr/local/bin/refe

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

" octopress
autocmd BufNewFile,BufRead *.markdown setfiletype octopress
