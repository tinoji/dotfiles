# path
typeset -gx -U path
path=( \
    /usr/local/bin(N-/) \
    ~/bin(N-/) \
    "$path[@]" \
    )

# ls command colors
export LSCOLORS=cxfxcxdxbxegedabagacad

# history
export HISTFILE=~/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000

# golang
export GOPATH=$HOME/.go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin

#prompt
export PROMPT='%F{cyan}[%d]
$%f '

