" neocomplete like
set completeopt+=noinsert
" deoplete.nvim recommend
set completeopt+=noselect
" Path to python interpreter for neovim
let g:python_host_prog = $PYENV_ROOT.'/versions/neovim2/bin/python'
let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim3/bin/python'
" Skip the check of neovim module
let g:python3_host_skip_check = 1

" runtimepath
execute 'set runtimepath^=~/.vim'

" dein dir
let s:dein_dir = expand('~/.vim/dein')
" dein.vim
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" install dein
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" toml file
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/dein.toml'

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml_file)
  call dein#end()
  call dein#save_state()
endif

" install missing plugins
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

"==========
" rc file
"==========
runtime! options.rc.vim
runtime! keymap.rc.vim
runtime! color.rc.vim
