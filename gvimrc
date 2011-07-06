""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .gvimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_macvim')
  "set transparency=10	" 透明度を指定
  set antialias
  set guioptions=m	" メニューバー非表示
  set guioptions-=r	" 右スクロールバー非表示
  set guioptions-=R
  set guioptions-=l	" 左スクロールバー非表示
  set guioptions-=L
  "set guioptions-=t
  "set guioptions-=T
  set guifont=Osaka-Mono:h16
  set imdisable		" IMを無効化

  "フルスクリーンモード	
  set fuoptions=maxvert,maxhorz
  autocmd GUIEnter * set fullscreen 
endif
