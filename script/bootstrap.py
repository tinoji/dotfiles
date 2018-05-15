#!/usr/bin/env python

#========================================================================
# See: https://github.com/yymm/.dotfiles/blob/master/bin/cui_bootstrap.py
#========================================================================

import os
import sys

args = sys.argv

def zsh():
    print('>>> zsh')
    os.system('ln -sf  ~/dotfiles/config/zsh/.zprofile ~/.zprofile')
    os.system('ln -sf  ~/dotfiles/config/zsh/.zshrc ~/.zshrc')
    print('<<< [ok] zsh')

def vim():
    print('>>> neovim & vim')
    if not os.path.exists(os.environ['HOME'] +  '/.vim'):
        os.mkdir(os.environ['HOME'] +  '/.vim')
    # neovim
    os.system('ln -nsf ~/dotfiles/config/nvim ~/.config/')
    # vim
    os.system('ln -sf ~/dotfiles/config/nvim/init.vim ~/.vimrc')
    os.system('ln -sf ~/dotfiles/config/nvim/options.rc.vim ~/.vim/')
    os.system('ln -sf ~/dotfiles/config/nvim/keymap.rc.vim ~/.vim/')
    # Dependency
    # $ pip2 install --user --upgrade neovim
    # $ pip3 install --user --upgrade neovim
    # > deoplete.nvim
    # - :UpdateRemotePlugins
    print('<<< [ok] neovim & vim')

def tmux():
    print('>>> tmux')
    os.system('ln -sf ~/dotfiles/config/tmux/.tmux.conf ~/.tmux.conf')
    # os.system('cp -rf ~/dotfiles/config/tmux/.tmux-powerline ~/.tmux-powerline')
    # os.system('ln -sf ~/dotfiles/config/tmux/default_cui.sh ~/.tmux-powerline/themes/default.sh')
    # os.system('ln -sf ~/dotfiles/config/tmux/tmux_mem_cpu_load.sh ~/.tmux-powerline/segments/tmux_mem_cpu_load.sh')
    print('<<< [ok] tmux')

def git():
    print('>>> git')
    os.system('ln -sf  ~/dotfiles/config/git/.gitconfig ~/.gitconfig')
    print('<<< [ok] git')

def karabiner():
    print('>>> karabiner')
    os.system('ln -sf  ~/dotfiles/config/karabiner/mac_karabiner.json ~/.config/karabiner/karabiner.json')
    print('<<< [ok] karabiner')

def all():
    zsh()
    vim()
    tmux()
    git()

if len(args) < 2:
    print('Argument is needed')
elif args[1] in {'zsh', 'vim', 'tmux', 'git', 'karabiner', 'all'}:
    eval(args[1])()
else:
    print('Invalid argument')

