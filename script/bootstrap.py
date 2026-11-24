#!/usr/bin/env python3

# ========================================================================
# See: https://github.com/yymm/.dotfiles/blob/master/bin/cui_bootstrap.py
# 使い方: python3 script/bootstrap.py <zsh|vim|tmux|vscode|alacritty|karabiner|all>
# パッケージは別途: brew bundle --file=~/dotfiles/Brewfile
# ========================================================================

import os
import sys

args = sys.argv


def zsh():
    print('>>> zsh')
    os.system('ln -sf ~/dotfiles/config/zsh/.zshenv ~/.zshenv')
    os.system('ln -sf ~/dotfiles/config/zsh/.zprofile ~/.zprofile')
    os.system('ln -sf ~/dotfiles/config/zsh/.zshrc ~/.zshrc')
    print('<<< [ok] zsh')


def vim():
    print('>>> neovim')
    os.makedirs(os.path.expanduser('~/.config'), exist_ok=True)
    os.system('ln -nsf ~/dotfiles/config/nvim ~/.config/')
    print('<<< [ok] neovim')


def tmux():
    print('>>> tmux')
    os.system('ln -sf ~/dotfiles/config/tmux/.tmux.conf ~/.tmux.conf')
    print('<<< [ok] tmux')


def vscode():
    print('>>> vscode')
    d = os.path.expanduser('~/Library/Application Support/Code/User')
    os.makedirs(d, exist_ok=True)
    os.system('ln -sf ~/dotfiles/config/vscode/settings.json "%s/settings.json"' % d)
    print('<<< [ok] vscode')


def alacritty():
    print('>>> alacritty')
    os.system('ln -sf ~/dotfiles/config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml')
    print('<<< [ok] alacritty')


def karabiner():
    print('>>> karabiner')
    os.system('ln -sf ~/dotfiles/config/karabiner/mac_karabiner.json ~/.config/karabiner/karabiner.json')
    print('<<< [ok] karabiner')


def all():
    zsh()
    vim()
    tmux()
    vscode()
    alacritty()
    karabiner()


TARGETS = {'zsh', 'vim', 'tmux', 'vscode', 'alacritty', 'karabiner', 'all'}

if len(args) < 2:
    print('Argument is needed')
elif args[1] in TARGETS:
    globals()[args[1]]()
else:
    print('Invalid argument')
