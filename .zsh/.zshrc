# # 起動時間計測用
# zmodload zsh/zprof && zprof

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ==============================================================
# mise
# ==============================================================

eval "$(/bin/mise activate zsh)"

# ==============================================================
# keybindings
# ==============================================================

bindkey -v      # vim

# ==============================================================
# colers
# ==============================================================

autoload -Uz colors
colors
local DEFAULT=${reset_color}
local BLACK=${fg[black]}
local RED=${fg[red]}
local GREEN=${fg[green]}
local YELLOW=${fg[yellow]}
local BLUE=${fg[blue]}
local PURPLE=${fg[magenta]}
local LIGHT_BLUE=${fg[cyan]}
local WHITE=${fg[white]}

# ==============================================================
# history
# ==============================================================

HISTSIZE=1000
SAVEHIST=100000
HISTFILE="${ZDOTDIR}/.zsh_history"

autoload history-search-end # 入力途中の履歴補完を有効化する
autoload -Uz add-zsh-hook

setopt hist_verify          # 履歴の展開を実行前に確認
setopt hist_ignore_dups     # 重複するヒストリを持たない
setopt hist_ignore_space    # 空白ではじまるコマンドを保持しない
setopt hist_ignore_all_dups # 履歴中の重複行をファイル記録前に無くす
setopt hist_find_no_dups    # 履歴検索中、(連続してなくとも)重複を飛ばす
setopt hist_no_store        # histroyコマンドは記録しない
setopt hist_reduce_blanks   # 余分なスペースを削除してヒストリに保存する
setopt share_history        # 同時起動しているzsh間でヒストリを共有
setopt inc_append_history   # 履歴をすぐに追加する

alias h='fc -lt '%F %T' 1'  # historyの日付を表示

# http://mollifier.hatenablog.com/entry/20090728/p1
zshaddhistory() {
    local line=${1%%$'\n'} #コマンドライン全体から改行を除去したもの
    local cmd=${line%% *}  # １つ目のコマンド
    # 以下の条件をすべて満たすものだけをヒストリに追加する
    [[ ${#line} -ge 5
        && ${cmd} != (l|l[sal])
        && ${cmd} != (cd)
        && ${cmd} != (m|man)
        && ${cmd} != (r[mr])
    ]]
}

add-zsh-hook precmd zshaddhistory

# # https://xyk.hatenablog.com/entry/2022/03/15/175914
# # 実行失敗コマンドを残さない

# remove_last_history_if_not_needed () {
#   local last_status="$?"
#   if [[ ${last_status} -ne 0 ]]; then
#     fc -W
#     ed -s ${HISTFILE} <<EOF >/dev/null
# d
# w
# q
# EOF
#     fc -R
#   fi
# }

# add-zsh-hook precmd remove_last_history_if_not_needed


# ==============================================================
# cd
# ==============================================================

setopt auto_cd              # コマンドが省略されていたら cd とみなす

# ==============================================================
# ディレクトリスタック（ cd -<tab> ）
# ==============================================================

setopt auto_pushd           # ディレクトリスタックを有効
setopt pushd_ignore_dups    # ディレクトリスタックを重複させない
DIRSTACKSIZE=100            # ディレクトリスタックのサイズ

# ==============================================================
# completion
# ==============================================================

# zicompinitと等価のためコメントアウト
# autoload -Uz compinit && compinit

setopt auto_menu            # 補完キー連打で順に補完
setopt auto_list            # 候補が複数の時、list表示
# setopt menu_complete        # 候補が複数の時、先頭の候補を補完
setopt auto_param_keys      # カッコの対応などを自動補完
setopt auto_param_slash     # ディレクトリ名補完で末尾の / を自動付加
setopt complete_aliases     # aliasを候補に含める
setopt correct              # コマンドをtaipo実行した時、候補を表示
setopt hist_verify          # ヒストリから実行する時、一度編集をする
setopt mark_dirs            # ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt list_types           # 候補一覧でファイル種別の識別マークを表示
setopt list_packed          # 候補を詰めて表示
# setopt interactive_comments # コマンドラインで # 以降をコメントと見なす
setopt magic_equal_subst    # コマンドライン引数で --prefix=/usr など = 以降も補完

setopt complete_in_word     # 語の途中でもカーソル位置で補完
setopt always_last_prompt   # カーソル位置は保持したままファイル名一覧を順次その場で表示

setopt print_eight_bit      # 8ビット文字を通す
setopt extended_glob        # 拡張globで補完
setopt globdots             # .の指定をせずに.で始まるファイルをマッチ
setopt nomatch              # メタ文字でマッチした場合にエラーとしない

zstyle ':completion:*:default' menu select
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history

# pwdを候補から除外
zstyle ':completion:*' ignore-parents parent pwd

# オブジェクトファイルとか中間ファイルとかはfileとして補完させない
zstyle ':completion:*:*files' ignored-patterns '*?.o' '*?~' '*\#'

# マッチ種別を分けて表示
zstyle ':completion:*' group-name ''

# 大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# zstyle ':completion:*:options' description 'yes'

# 色設定
zstyle ':completion:*:messages' format $YELLOW'%d'$DEFAULT
zstyle ':completion:*:warnings' format $RED'No matches for:'$YELLOW' %d'$DEFAULT
zstyle ':completion:*:descriptions' format $YELLOW'completing %B%U%d%u%b'$DEFAULT
zstyle ':completion:*:corrections' format $YELLOW'%B%d '$RED'(errors: %e)%b'$DEFAULT
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# ==============================================================
# alias
# ==============================================================

alias ls="ls -lhF --color=auto"

# ==============================================================
# function
# ==============================================================

# cd後に自動的でls
chpwd() {
    if [[ $(pwd) != $HOME ]]; then;
        ls -A
    fi
}

# ==============================================================
# plugins
# ==============================================================

### Added by Zinit's installer
if [[ ! -f $HOME/.zsh/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zsh/.zinit" && command chmod g-rwX "$HOME/.zsh/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zsh/.zinit/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "${ZDOTDIR}/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit wait"0" lucid light-mode for \
atload"zicompinit; zicdreplay" \
zdharma-continuum/fast-syntax-highlighting \
atload"_zsh_autosuggest_start" \
zsh-users/zsh-autosuggestions \
blockf atpull'zinit creinstall -q .' \
zsh-users/zsh-completions \
mafredri/zsh-async \
zdharma-continuum/history-search-multi-word \
zsh-users/zsh-history-substring-search \
supercrabtree/k \
chrissicool/zsh-256color

zinit light romkatv/powerlevel10k

# zdharma-continuum/fast-syntax-highlighting 実行可能なコマンドに色付け
# zsh-users/zsh-autosuggestions コマンド履歴を灰色でサジェスト
# zsh-users/zsh-completions コマンドの補完の強化
# mafredri/zsh-async 非同期処理
# zdharma-continuum/history-search-multi-word "Ctrl+r"でコマンド履歴を検索
# zsh-users/zsh-history-substring-search コマンド入力途中に上下キーで履歴が出る
# chrissicool/zsh-256color 256色表示
# romkatv/powerlevel10k テーマ
# supercrabtree/k gitの変更を表示できるls（文字化け問題: brew zshで解決）

### End of Zinit's installer chunk

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if [[ $TERM_PROGRAM == "" ]] ; then
    [[ ! -f ${ZDOTDIR}/.p10k.zsh ]] || source ${ZDOTDIR}/.p10k.zsh
else
    [[ ! -f ${ZDOTDIR}/.p10k.zsh ]] || source ${ZDOTDIR}/.p10k.zsh
    # [[ ! -f ${ZDOTDIR}/.p10k.vscode.zsh ]] || source ${ZDOTDIR}/.p10k.vscode.zsh
fi

[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"

# # 起動時間計測用
# if (which zprof > /dev/null 2>&1) ;then
#   zprof
# fi
