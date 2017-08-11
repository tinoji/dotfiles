#alias
alias u='cd ..'
alias st='open -a /Applications/Sublime\ Text.app'
alias ls='ls -G'
alias ll='ls -laG'
alias grep='grep --color'
alias sed=gsed
alias df='df -h'
alias sudo='sudo '
alias source='source '
alias activate=/Users/hkikuchi/.pyenv/versions/anaconda3-4.0.0/bin/activate
alias jnote='jupyter notebook &'
alias startpg='pg_ctl -l /usr/local/var/postgres/server.log start'
alias stoppg='pg_ctl stop'
alias rm=rmtrash
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'


# ls command colors
export LSCOLORS=cxfxcxdxbxegedabagacad
autoload -U compinit
compinit
zstyle ':completion:*' list-colors 'di=33' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

#history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# pecoの設定
function peco-history-selection() {
      BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
          CURSOR=$#BUFFER
              zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection
