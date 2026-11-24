# ログインシェルで 1 回だけ読まれる。PATH はここで組み立てる。

# Apple Silicon 版 Homebrew（/opt/homebrew を /usr/local/bin より前に置く）
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# keg-only の formula のうち、普段使うもの
path=(
  /opt/homebrew/opt/libpq/bin   # psql
  /opt/homebrew/opt/curl/bin
  $path
)

# uv や Claude Code の CLI は ~/.local/bin に入る
. "$HOME/.local/bin/env"

# ログイン後に SSH 鍵を macOS のキーチェーンから ssh-agent へ読み込む
# （git のコミット署名は ssh-agent の鍵を使うため。再起動後に署名が止まるのを防ぐ）
/usr/bin/ssh-add --apple-load-keychain -q 2>/dev/null

# 重複を除く
typeset -gU path
