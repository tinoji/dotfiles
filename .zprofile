export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/versions/anaconda3-4.0.0/bin:/usr/local/mybin:$HOME/.nodebrew/current/bin:$(brew --prefix homebrew/php/php71)/bin:/Users/hkikuchi/Library/Android/sdk/platform-tools:$PATH
export PGDATA=/usr/local/var/postgres
export LESSCHARSET=utf-8
export LANG=en_US.UTF-8


eval "$(pyenv init -)"

#prompt
PROMPT='%F{cyan}[%d]
$%f '
