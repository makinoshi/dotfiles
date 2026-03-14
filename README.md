# dotfiles

## Currently in use

- [Zsh and sheldon](#zsh)
- ideavim

## Zsh

### Prerequisites

- [sheldon](https://github.com/rossmacarthur/sheldon) (zsh plugin manager)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [zsh-abbr](https://github.com/olets/zsh-abbr)
- [direnv](https://direnv.net/)
- [mise](https://mise.jdx.dev/)
- [fzf](https://github.com/junegunn/fzf)

### Setup

```bash
# .zshrc
ln -sf ~/repos/makinoshi/dotfiles/.zshrc ~/.zshrc

# sheldon config
ln -sf ~/repos/makinoshi/dotfiles/.config/sheldon ~/.config/sheldon

# zsh-abbr abbreviations
mkdir -p ~/.config/zsh-abbr
ln -sf ~/repos/makinoshi/dotfiles/.config/zsh-abbr/user-abbreviations ~/.config/zsh-abbr/user-abbreviations
```

### Cache

Several tools (sheldon, direnv, mise) cache their initialization scripts in `~/.cache/` for faster startup. To regenerate the cache after updating these tools:

```bash
rm -f ~/.cache/sheldon/plugins.zsh ~/.cache/direnv-hook.zsh ~/.cache/mise-activate.zsh
```

## Not currently in use

- Spacemacs
- fish
- karabiner for macOS
- Keyhac for Windows
