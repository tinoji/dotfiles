"==============================================================
" Plugins by dein.vim
"
" See: https://github.com/Shougo/dein.vim
"      https://qiita.com/jnchito/items/5141b3b01bced9f7f48f
"      https://qiita.com/delphinus/items/00ff2c0ba972c6e41542
"        (プラグイン増えてきたらこんな感じにするかも)
"==============================================================
" インストールディレクトリ
let s:dein_dir = expand('~/.vim/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" インストール
call dein#begin(s:dein_dir)
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})

" Pluginをここに追加していく
call dein#add('scrooloose/nerdtree')
call dein#add('tomtom/tcomment_vim')
call dein#add('altercation/vim-colors-solarized')
call dein#add('fatih/vim-go')
call dein#add('vim-scripts/vim-auto-save')
call dein#add('ConradIrwin/vim-bracketed-paste')
call dein#add('itchyny/lightline.vim')
call dein#add('bronson/vim-trailing-whitespace')
call dein#add('Yggdroot/indentLine')

call dein#end()

" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

filetype plugin indent on


"======================
" Settings for plugin
"======================
""" NERDTree: ディレクトリツリーの表示
nnoremap <silent><C-t> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1

"自動でNERDTreeを開く(ファイル名指定時は開かない)
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

""" tcomment: 複数行コメント
"設定なし。Control+vで選択 => Control+ハイフン2回 でおk

""" vim-go
" バージョンに関するwarningを表示しない
let g:go_version_warning = 0

""" vim-auto-save
" 有効にする
let g:auto_save = 1

""" lightline
let g:lightline = {
    \ 'colorscheme': 'wombat'
    \ }

""" indentLine
set list listchars=tab:\¦\ 


"==========
" rc file
"==========
runtime! options.rc.vim
runtime! keymap.rc.vim

