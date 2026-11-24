# Apple Silicon 版 Homebrew（/opt/homebrew）用の Brewfile
# 適用: brew bundle --file=~/dotfiles/Brewfile
# 旧 Intel 環境の一覧は ~/env-backup-20261124/Brewfile.intel にある。
#
# 方針
# - 言語ランタイム（Node / Go / Terraform など）は mise で管理する。brew では入れない
# - Python は uv で管理する。pyenv と python@3.10 は廃止
# - Claude Code の CLI は公式のネイティブインストーラで入れる（自動更新のため）
# - uv と gitleaks は端末管理側で配布されるため、ここでは入れない

# ---- 基盤 ----
brew "mise"            # ランタイムのバージョン管理
brew "git"
brew "gh"
brew "gnupg"
brew "coreutils"
brew "gnu-sed"
brew "curl"
brew "rsync"
brew "bash"            # bash 4 以降を前提にしたスクリプト用（ログインシェルは zsh にする）

# ---- シェル・ターミナル ----
brew "starship"
brew "zsh-autosuggestions"
brew "zsh-syntax-highlighting"
brew "fzf"
brew "zoxide"
brew "tmux"
brew "neovim"
cask "ghostty"

# ---- 検索・閲覧（Claude Code も使う） ----
brew "ripgrep"
brew "fd"
brew "bat"
brew "eza"
brew "git-delta"       # git の pager（~/.gitconfig の core.pager）
brew "lazygit"         # ターミナルで diff の確認・ステージング
brew "jq"
brew "yq"

# ---- AWS・インフラ ----
brew "awscli"
brew "aws-vault"                     # 旧 cask の aws-vault-binary（非推奨）を置き換える
cask "session-manager-plugin"        # SSM 経由の接続用（.pem 鍵からの移行先）
brew "trivy"                         # tfsec の後継
brew "act"
brew "libpq"                         # psql クライアントだけ。DB 本体は Rancher Desktop のコンテナで動かす

# ---- その他（旧環境から引き継ぐもの） ----
brew "httpie"
brew "nkf"
brew "trash"
brew "ffmpeg"
brew "uhubctl"

# ---- アプリ（インストール済みのものは --adopt で引き継ぐ） ----
cask "hammerspoon"
# Rancher Desktop は自動更新があるため Homebrew では管理しない。
# （macOS の App Management 保護で --adopt が失敗するため、2026-11-24 に外した）

# ---- VS Code 拡張 ----
vscode "anthropic.claude-code"
vscode "bibhasdn.unique-lines"
vscode "idleberg.applescript"
vscode "idleberg.jxa"
vscode "janisdd.vscode-edit-csv"
vscode "ms-ceintl.vscode-language-pack-ja"
vscode "ms-python.debugpy"
vscode "ms-python.python"
vscode "ms-python.vscode-pylance"
vscode "ms-python.vscode-python-envs"
vscode "tyriar.sort-lines"
vscode "yzhang.markdown-all-in-one"

# 旧環境から入れ直さないもの
# - pyenv, python@3.10      → uv
# - tfenv, tflint, go       → mise（terraform / tflint / go）
# - tfsec                   → trivy
# - postgresql@14           → libpq（クライアントのみ）
# - gdal                    → 必要なプロジェクトのセットアップで入れる
# - openvino, telnet, zlib  → 不要（必要になったら個別に入れる）
# - aws-vault-binary (cask) → aws-vault (formula)
