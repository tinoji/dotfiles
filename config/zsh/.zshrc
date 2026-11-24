# 対話シェルの設定

# ---- history ----
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=100000
setopt share_history hist_ignore_space hist_ignore_all_dups hist_reduce_blanks
setopt prompt_subst
KEYTIMEOUT=1  # vim の ESC が遅い対策

# ---- completion ----
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)
autoload -Uz compinit && compinit -u
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' list-colors 'di=33' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# ---- keybind ----
bindkey -e
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

# ---- tools ----
eval "$(mise activate zsh)"        # Node / Terraform などのバージョン切り替え
eval "$(starship init zsh)"        # プロンプト（git の状態表示も担う）
eval "$(zoxide init zsh)"          # z <dir> で移動
source <(fzf --zsh)                # Ctrl-R: 履歴検索 / Ctrl-T: ファイル選択
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# ---- alias ----
alias u='cd ..'
alias ls='eza'
alias ll='eza -lah --git'
alias tree='eza --tree'
alias grep='grep --color=auto'
alias sed='gsed'
alias df='df -h'
alias rm='/opt/homebrew/opt/trash/bin/trash -F'  # ゴミ箱へ移す
alias k='kubectl'

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/tinoji/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# syntax highlighting は最後に読み込む必要がある
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
