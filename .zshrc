# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set up the prompt
autoload -Uz promptinit
promptinit
prompt adam1

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

# Use modern completion system
autoload -Uz compinit
compinit

# Homebrew
# https://brew.sh/ja/
if [ -e /home/linuxbrew/.linuxbrew/bin/brew ]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Cargo(Rust)
source "$HOME/.cargo/env"

# Sheldon(zsh plugin manager)
# https://github.com/rossmacarthur/sheldon
eval "$(sheldon source)"

# direnv
eval "$(direnv hook zsh)"

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

# abbr
# https://github.com/olets/zsh-abbr
abbr -S l="ls -lahF --color=auto" >> /dev/null
## Git
abbr -S ga="git branch -a" >> /dev/null
abbr -S gb="git branch" >> /dev/null
abbr -S gbv="git branch -vv" >> /dev/null
abbr -S gd="git diff" >> /dev/null
abbr -S gf="git fetch -p" >> /dev/null
abbr -S gl="git log --oneline --graph --decorate" >> /dev/null
abbr -S gla="git log --oneline --graph --decorate --all" >> /dev/null
abbr -S gp="git pull" >> /dev/null
abbr -S gpoh="git push origin HEAD" >> /dev/null
abbr -S grd="git rebase develop" >> /dev/null
# Ghostscriptをかぶっているのでabbrではなくaliasで上書き
alias gs="git status"
# abbr -S gs="git status" >> /dev/null
abbr -S gsw="git switch" >> /dev/null
abbr -S gswc="git switch -c" >> /dev/null
abbr -S gswd="git switch develop" >> /dev/null
## GitHub
abbr -S ghs="gh status" >> /dev/null
## Lazygit
abbr -S lz="lazygit" >> /dev/null

# Volta
# https://volta.sh/
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# asdf
# export ASDF_DIR="$HOME/.asdf"
# . "$HOME/.asdf/asdf.sh"

# .local/bin
export PATH="$HOME/.local/bin:$PATH"

# sdkman
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Emacs lsp-mode
export LSP_USE_PLISTS=true

# Golang
export PATH=$PATH:/usr/local/go/bin

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
