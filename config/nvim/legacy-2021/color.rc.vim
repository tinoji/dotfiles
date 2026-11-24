colorscheme slate
syntax enable

" 空行の~の色を変えてなるべく目立たないように
highlight EndOfBuffer ctermfg=17 ctermbg=none guifg=17 guibg=none
" 背景色はターミナルのものを維持
highlight Normal ctermbg=none guibg=none
" 境界
set fillchars=vert:\ ,stl:\ ,stlnc:\ ,fold:-,diff:┄
" 対応するカッコの色を変更
highlight MatchParen ctermbg=240
" paneの分割部分
highlight VertSplit ctermbg=236 ctermfg=236
" 行番号
highlight LineNr ctermbg=237

