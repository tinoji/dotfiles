# すべての zsh（スクリプト実行を含む）で読まれる。PATH はここでは触らない
# （macOS の /etc/zprofile の path_helper に並べ替えられるため、PATH は .zprofile で設定する）

# language
export LANG="en_US.UTF-8"
export LC_ALL="${LANG}"

# editor / pager
export EDITOR=nvim
export GIT_EDITOR="${EDITOR}"
export PAGER=less
export LESSCHARSET='utf-8'

# Homebrew
export HOMEBREW_NO_ENV_HINTS=1
