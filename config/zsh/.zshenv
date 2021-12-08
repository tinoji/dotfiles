# path
typeset -gx -U path
path=( \
    /usr/local/bin(N-/) \
    ~/bin(N-/) \
    "$path[@]" \
    )

# language
export LANGUAGE="en_US.UTF-8"
export LANG="${LANGUAGE}"
export LC_ALL="${LANGUAGE}"
export LC_CTYPE="${LANGUAGE}"

# editor
export EDITOR=nvim
export CVSEDITOR="${EDITOR}"
export SVN_EDITOR="${EDITOR}"
export GIT_EDITOR="${EDITOR}"

# Pager
export PAGER=less
export LESSCHARSET='utf-8'

# color
export LSCOLORS=ExFxBxDxCxegedabagacad
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1

# golang
export GOPATH=$HOME/.go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin
export GO111MODULE=on

# python
export PATH=$PATH:$HOME/.local/bin
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Android
export PATH=/usr/local/bin/platform-tools/:$PATH

# color
[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh

# krew
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# node
export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH="/Users/tinoji/.ebcli-virtual-env/executables:$PATH"
