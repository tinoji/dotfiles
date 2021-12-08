alias u='cd ..'
alias ls='ls -G'
alias ll='ls -laGh'
alias grep='grep --color'
alias sed='gsed'
alias df='df -h'
alias rm='trash -F'
alias k='kubectl'

if [ $commands[notify] ]; then
    alias notifycmd='notify --timeout false -m "done: $?"'
fi
