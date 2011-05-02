""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .gimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

 set lines=50
 set columns=200

if has('gui_macvim')
	set transparency=10	" 透明度を指定
	set antialias
	set guioptions=m	" メニューバー非表示
	set guioptions-=r	" 右スクロールバー非表示
	set guioptions-=R
	set guioptions-=l	" 左スクロールバー非表示
	set guioptions-=L
	"set guioptions-=t
	"set guioptions-=T
	set guifont=Osaka-Mono:h14
"	set showtabline=2	" タブを常に表示
set imdisable		" IMを無効化
	
	"フルスクリーンモード	
 	set fuoptions=maxvert,maxhorz
  	autocmd GUIEnter * set fullscreen 
	
"	colorscheme macvim
	colorscheme wombat256
endif

" path for git
let $PATH .= ':/usr/local/git/bin'
