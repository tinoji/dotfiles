#!/usr/bin/env python

#========================================================================
# See: https://github.com/yymm/.dotfiles/blob/master/bin/cui_bootstrap.py
#========================================================================

import os

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
    os.system('ln -sf ~/dotfiles/config/tmux/.tmux.cui.conf ~/.tmux.conf')
    # os.system('cp -rf ~/dotfiles/config/tmux/.tmux-powerline ~/.tmux-powerline')
    # os.system('ln -sf ~/dotfiles/config/tmux/default_cui.sh ~/.tmux-powerline/themes/default.sh')
    # os.system('ln -sf ~/dotfiles/config/tmux/tmux_mem_cpu_load.sh ~/.tmux-powerline/segments/tmux_mem_cpu_load.sh')
    print('<<< [ok] tmux')

def git():
    print('>>> git')
    os.system('ln -sf  ~/dotfiles/config/git/.gitconfig ~/.gitconfig')
    print('<<< [ok] git')

if '__main__' == __name__:
    zsh()
    vim()
    tmux()
    git()
