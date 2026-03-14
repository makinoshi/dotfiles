# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

setopt histignorealldups sharehistory

# パスを直接入力してもcdする
setopt auto_cd

# カッコの対応などを自動的に補完
setopt auto_param_keys

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 10,000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=100000
HISTFILE=~/.zsh_history

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/masa/.docker/completions $fpath)

# Use modern completion system
autoload -Uz compinit
if [[ -n ${ZDOTDIR:-$HOME}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# Homebrew
# https://brew.sh/ja/
if [[ -o login ]] && [ -e /home/linuxbrew/.linuxbrew/bin/brew ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Cargo(Rust)
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# Sheldon(zsh plugin manager)
# https://github.com/rossmacarthur/sheldon
# 初回 or 設定変更時のみ生成
SHELDON_CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/sheldon"
if [[ ! -f "$SHELDON_CACHE/plugins.zsh" ]]; then
  mkdir -p "$SHELDON_CACHE"
  sheldon source > "$SHELDON_CACHE/plugins.zsh"
fi
# 以降はただの source
source "$SHELDON_CACHE/plugins.zsh"

# direnv
DIRENV_CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/direnv-hook.zsh"
if [[ ! -f "$DIRENV_CACHE" ]]; then
  direnv hook zsh > "$DIRENV_CACHE"
fi
source "$DIRENV_CACHE"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# https://github.com/romkatv/powerlevel10k
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
if [[ $IDEA_INITIAL_DIRECTORY ]]; then
  ZSH_THEME="robbyrussell"
else
  ZSH_THEME="powerlevel10k/powerlevel10k"
fi

# fzf
# https://github.com/junegunn/fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Ghostscriptをかぶっているのでabbrではなくaliasで上書き
alias gs="git status"
# abbr の略語は ~/.config/zsh-abbr/user-abbreviations で管理

# Emacs lsp-mode
export LSP_USE_PLISTS=true

# Golang
export PATH=$PATH:/usr/local/go/bin

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# .local/bin
export PATH="$HOME/.local/bin:$PATH"

# mise
# 初回のみ生成、以降はキャッシュを読む
MISE_CACHE="${XDG_CACHE_HOME:-$HOME/.cache}/mise-activate.zsh"
if [[ ! -f "$MISE_CACHE" ]]; then
  mise activate zsh > "$MISE_CACHE"
fi
source "$MISE_CACHE"
# eval "$(mise activate zsh --shims)"
