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
Bundle 'tsukkee/unite-help'
Bundle 'unite-font'
Bundle 'unite-colorscheme'
Bundle 'mattn/gist-vim'
Bundle 'msanders/cocoa.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'newspaper.vim'
Bundle 'wombat256.vim'
Bundle 'mrtazz/molokai.vim'
Bundle 'ref.vim'

filetype plugin indent on     " required!
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ファイル種類の自動判別とそれに応じた適切設定/インデントを行なう。
filetype plugin indent on

" ファイルの種類に応じたシンタックスハイライトを有効にする。
syntax enable

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
set statusline+=%t\ %m%r%h%w
set statusline+=[%Y][%{&fenc}]
set statusline+=%{fugitive#statusline()}
set statusline+=%=
set statusline+=%<%c,%l\ %P\ %{strftime('%k:%M')}
"set lines=50
"set columns=150
set cursorline
"set cursorcolumn

"行の連結 "J" で、間にスペースを入れない
set nojoinspaces

" 改行文字/インデント/インサートモード開始位置より前の文字を削除可能にする。
"set backspace=eol,indent,start
set backspace=indent,start

" /{pattern}や?{pattern}による検索で大文字・小文字の違いを無視する。
set ignorecase

" 検索パターンに大文字が含まれる場合は大文字・小文字を区別する。
set smartcase

" vimrcを即座に編集できるようにする
nnoremap <Space>.  :<C-u>edit $MYVIMRC<Enter>

" vimrcを即座にリロードできるようにする
nnoremap <Space>s.  :<C-u>source $MYVIMRC<Enter>

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

" neocomplcache.vim
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_min_syntax_length = 3

" Gist.vimrc
source ~/.vimrc.gist
let g:gist_detect_filetype = 1

" NERD Commenter.vim
nnoremap <silent> <d-/> :call NERDComment(0, "toggle")<cr>
vnoremap <silent> <d-/> <ESC>:call NERDComment(1, "toggle")<cr>

"let g:filetype_m = 'objc'

" unite.vim
"入力モードで開始する
let g:unite_enable_start_insert=1
nnoremap <Space>u :<C-u>Unite file buffer file_mru<CR>
nnoremap <Space>ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <Space>ur :<C-u>Unite ref/refe<CR>
"ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-k> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-k> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')

" unite-help
" Execute help.
nnoremap <C-h>  :<C-u>Unite -start-insert help<CR>
" Execute help by cursor keyword.
nnoremap <C-h><C-h>  :<C-u>UniteWithCursorWord help<CR>

" ref.vim
" /usr/local/bin/refe
