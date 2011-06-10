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
Bundle 'fholgado/minibufexpl.vim'
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

filetype plugin indent on     " required!
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ファイル種類の自動判別とそれに応じた適切設定/インデントを行なう。
filetype plugin indent on

" ファイルの種類に応じたシンタックスハイライトを有効にする。
syntax enable

"set imdisable
set showcmd			"コマンドをステータスラインに表示
set number			"行番号を表示する
set nolist          "改行記号等を表示しない
"set list
set autoindent
set showmatch       "閉じ括弧が入力されたとき、対応する開き括弧にわずかの間ジャンプする
set tabstop=4
set shiftwidth=4
set expandtab
set ruler
"set rulerformat=%20(%l,%c\ %P%)%=%{strftime('%k:%M')}
set laststatus=2
set statusline=%t\ %m%r%h%w[%Y][%{&fenc}]%=%c,%l\ %P\ %{strftime('%k:%M')}
"set lines=50
"set columns=150

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

" <C-h>の1キーで:helpを引く準備ができるようにする。
nnoremap <C-h>  :<C-u>help<Space>

" <C-h><C-h>でカーソル下のキーワードを:helpで引く。
nnoremap <C-h><C-h>  :<C-u>help<Space><C-r><C-w><Enter>

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

" <Leader><Leader>で変更があれば保存
noremap <Leader><Leader> :up<CR>

" neocomplcache.vim
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_min_syntax_length = 3

" minibufexpl.vimrc
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBuffs = 1
nnoremap <C-n> :<C-u>bn<Enter>
nnoremap <C-p> :<C-u>bp<Enter>

" Gist.vimrc
source ~/.vimrc.gist
let g:gist_detect_filetype = 1

" NERD Commenter.vim
nnoremap <silent> <d-/> :call NERDComment(0, "toggle")<cr>
vnoremap <silent> <d-/> <ESC>:call NERDComment(1, "toggle")<cr>

"let g:filetype_m = 'objc'

