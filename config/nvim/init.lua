-- neovim の最小構成（プラグインなし）
-- 主な用途: git のコミットメッセージ、Claude Code の Ctrl+G でのプロンプト編集、ちょっとした修正
-- 旧設定（dein / coc など）は legacy-2021/ に残してある

local opt = vim.opt

-- ファイル
opt.fileencoding = "utf-8"
opt.backup = false
opt.swapfile = false
opt.autoread = true
opt.clipboard = "unnamedplus" -- yank を macOS のクリップボードへ

-- 表示
opt.number = true
opt.cursorline = true
opt.showmatch = true
opt.showbreak = "↪"
opt.list = true
opt.listchars = { tab = "▸-", trail = "·" }
opt.termguicolors = true
opt.signcolumn = "yes"

-- 編集
opt.virtualedit = { "block", "onemore" }
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.smartindent = true

-- 検索
opt.ignorecase = true
opt.smartcase = true

opt.ttimeoutlen = 10 -- ESC が遅い対策

-- 拡張子ごとのインデント
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "ruby", "yaml", "javascript", "typescript", "json", "terraform", "hcl", "lua" },
  callback = function() vim.opt_local.tabstop, vim.opt_local.shiftwidth, vim.opt_local.softtabstop = 2, 2, 2 end,
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function() vim.opt_local.expandtab = false end,
})
-- コミットメッセージは 72 桁で折り返し、スペルチェック
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "gitcommit", "markdown" },
  callback = function() vim.opt_local.textwidth = 72; vim.opt_local.spell = true; vim.opt_local.spelllang = { "en", "cjk" } end,
})

-- キーマップ（旧 keymap.rc.vim から、プラグインに依存しないものを移植）
vim.g.mapleader = ";"
local map = vim.keymap.set

map("i", "jj", "<Esc>", { silent = true })
map("i", "っj", "<Esc>", { silent = true })
map({ "n", "v" }, "<C-a>", "0")
map({ "n", "v" }, "<C-e>", "$")
map("i", "<C-a>", "<C-o>^")
map("i", "<C-e>", "<C-o>$")
map("n", "j", "gj")
map("n", "k", "gk")
map("n", "<Esc><Esc>", "<Cmd>nohlsearch<CR>")

-- 日本語入力のまま押しても動くように
map("n", "あ", "a")
map("n", "い", "i")
map("n", "お", "o")
map("n", "っd", "dd")
map("n", "っy", "yy")

-- ウィンドウ・タブ操作（s プレフィックス）
map("n", "s", "<Nop>")
for _, k in ipairs({ "h", "j", "k", "l", "H", "J", "K", "L", "r", "=", "w" }) do
  map("n", "s" .. k, "<C-w>" .. k)
end
map("n", "ss", "<Cmd>split<CR>")
map("n", "sv", "<Cmd>vsplit<CR>")
map("n", "st", "<Cmd>tabnew<CR>")
map("n", "sq", "<Cmd>quit<CR>")
map("n", "sQ", "<Cmd>bdelete<CR>")
map("n", "sN", "<Cmd>bnext<CR>")
map("n", "sP", "<Cmd>bprevious<CR>")
map("n", "fl", "gt")
map("n", "fh", "gT")
map("n", "QQ", "<Cmd>wqa<CR>")
map("t", "<Esc>", [[<C-\><C-n>]], { silent = true })

-- ファイラは組み込みの netrw を使う（旧 NERDTree の Ctrl-T 相当）
map("n", "<C-t>", "<Cmd>Lexplore<CR>")
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_winsize = 25

-- 色: 背景はターミナル（Ghostty）のものを使う
vim.cmd.colorscheme("habamax")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
