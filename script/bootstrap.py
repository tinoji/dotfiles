#!/usr/bin/env python

# ========================================================================
# See: https://github.com/yymm/.dotfiles/blob/master/bin/cui_bootstrap.py
# ========================================================================

import os
import sys

args = sys.argv


def zsh():
    print('>>> zsh')
    os.system('ln -sf  ~/dotfiles/config/zsh/.zshrc ~/.zshrc')
    os.system('ln -sf  ~/dotfiles/config/zsh/.zshenv ~/.zshenv')
    os.system('ln -sf  ~/dotfiles/config/zsh/.zsh/ ~/')
    print('<<< [ok] zsh')


def vim():
    print('>>> neovim & vim')
    if not os.path.exists(os.environ['HOME'] + '/.vim'):
        os.mkdir(os.environ['HOME'] + '/.vim')
    # neovim
    os.system('ln -nsf ~/dotfiles/config/nvim ~/.config/')
    # vim
    os.system('ln -sf ~/dotfiles/config/nvim/init.vim ~/.vimrc')
    os.system('ln -sf ~/dotfiles/config/nvim/dein.toml ~/.vim/')
    os.system('ln -sf ~/dotfiles/config/nvim/options.rc.vim ~/.vim/')
    os.system('ln -sf ~/dotfiles/config/nvim/keymap.rc.vim ~/.vim/')
    os.system('ln -sf ~/dotfiles/config/nvim/color.rc.vim ~/.vim/')
    os.system('ln -sf ~/dotfiles/config/nvim/coc-settings.vim ~/.vim/')
    os.system('ln -sf ~/dotfiles/config/nvim/coc-settings.json ~/.vim/')

    # Dependency
    # $ pip2 install --user --upgrade neovim
    # $ pip3 install --user --upgrade neovim
    # > deoplete.nvim
    # - :UpdateRemotePlugins
    print('<<< [ok] neovim & vim')


def tmux():
    print('>>> tmux')
    os.system('ln -sf ~/dotfiles/config/tmux/.tmux.conf ~/.tmux.conf')
    print('<<< [ok] tmux')


def alacritty():
    print('>>> alacritty')
    os.system('ln -sf ~/dotfiles/config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml')
    print('<<< [ok] alacritty')


def karabiner():
    print('>>> karabiner')
    os.system('ln -sf  ~/dotfiles/config/karabiner/mac_karabiner.json ~/.config/karabiner/karabiner.json')
    print('<<< [ok] karabiner')


def all():
    zsh()
    vim()
    tmux()
    alacritty()
    git()
    karabiner()


if len(args) < 2:
    print('Argument is needed')
elif args[1] in {'zsh', 'vim', 'tmux', 'alacritty', 'git', 'karabiner', 'all'}:
    eval(args[1])()
else:
    print('Invalid argument')
