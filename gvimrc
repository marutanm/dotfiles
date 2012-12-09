""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .gvimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_macvim')
  set antialias
  set guioptions-=e  " tablineを使う
  set guioptions-=m  " メニューバー非表示
  set guioptions-=r  " 右スクロールバー非表示
  set guioptions-=R
  set guioptions-=l  " 左スクロールバー非表示
  set guioptions-=L
  set guifont=Menlo:h16
  set imdisable      " IMを無効化

  "フルスクリーンモード	
  set fuoptions=maxvert,maxhorz
  autocmd GUIEnter * set fullscreen 
endif
