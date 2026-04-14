# dotfiles

Personal dotfiles for a terminal-first development environment. Used by [install.snowy-burbot.com](https://install.snowy-burbot.com) — the Shark-no-Shitaku bootstrap installer.

## What's included

| Config | Description |
|--------|-------------|
| `nvim/` | Neovim (LazyVim-based) — tokyonight theme, neo-tree, snacks |
| `starship/` | Starship prompt — minimal cyan theme with git status |
| `tmux/` | tmux — C-Space prefix, vi copy mode, clean status bar |
| `lazygit/` | lazygit — delta pager, nerd fonts |
| `lazydocker/` | lazydocker — default layout, CPU/memory graphs |
| `btop/` | btop — braille graphs, vim keys, truecolor |
| `fastfetch/` | fastfetch — hardware + software info in bordered sections |
| `git/` | git — sensible defaults (template, fill in name/email) |
| `shell/` | Modular shell config — exports, aliases, functions, hooks |

## Automated install

```bash
curl -fsSL https://install.snowy-burbot.com | bash
```

The installer handles:
- Package installation (Arch/Ubuntu, x86_64/aarch64)
- Symlink creation with backup of existing files
- Editor selection
- Dry-run mode by default

## Manual install

### With GNU Stow

```bash
git clone https://github.com/HaiNick/dotfiles ~/.dotfiles
cd ~/.dotfiles

# Install all configs
stow nvim starship tmux lazygit lazydocker btop fastfetch git

# Shell: place files manually (stow doesn't handle renames well)
mkdir -p ~/.config/shell
cp shell/aliases.sh shell/exports.sh shell/functions.sh shell/hooks.sh ~/.config/shell/
cp shell/bashrc ~/.bashrc
cp shell/zshrc ~/.zshrc   # optional
```

### Without Stow (manual symlinks)

```bash
git clone https://github.com/HaiNick/dotfiles ~/.dotfiles
cd ~/.dotfiles

ln -sf ~/.dotfiles/nvim ~/.config/nvim
ln -sf ~/.dotfiles/starship/starship.toml ~/.config/starship.toml
mkdir -p ~/.config/tmux && ln -sf ~/.dotfiles/tmux/tmux.conf ~/.config/tmux/tmux.conf
ln -sf ~/.dotfiles/lazygit ~/.config/lazygit
ln -sf ~/.dotfiles/lazydocker ~/.config/lazydocker
ln -sf ~/.dotfiles/btop ~/.config/btop
ln -sf ~/.dotfiles/fastfetch ~/.config/fastfetch
ln -sf ~/.dotfiles/git ~/.config/git

mkdir -p ~/.config/shell
ln -sf ~/.dotfiles/shell/aliases.sh ~/.config/shell/aliases.sh
ln -sf ~/.dotfiles/shell/exports.sh ~/.config/shell/exports.sh
ln -sf ~/.dotfiles/shell/functions.sh ~/.config/shell/functions.sh
ln -sf ~/.dotfiles/shell/hooks.sh ~/.config/shell/hooks.sh
ln -sf ~/.dotfiles/shell/bashrc ~/.bashrc
```

## Post-install

Edit `~/.config/git/config` to set your name and email:

```ini
[user]
    name = Your Name
    email = you@example.com
```

## Tools

These dotfiles are designed around the following tools:

| Tool | Purpose |
|------|---------|
| [neovim](https://neovim.io) + [LazyVim](https://lazyvim.org) | Editor |
| [tmux](https://github.com/tmux/tmux) | Terminal multiplexer |
| [starship](https://starship.rs) | Shell prompt |
| [lazygit](https://github.com/jesseduffield/lazygit) | Git TUI |
| [lazydocker](https://github.com/jesseduffield/lazydocker) | Docker TUI |
| [btop](https://github.com/aristocratos/btop) | System monitor |
| [fastfetch](https://github.com/fastfetch-cli/fastfetch) | System info |
| [eza](https://github.com/eza-community/eza) | Better `ls` |
| [bat](https://github.com/sharkdp/bat) | Better `cat` |
| [fzf](https://github.com/junegunn/fzf) | Fuzzy finder |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | Smarter `cd` |
| [ripgrep](https://github.com/BurntSushi/ripgrep) | Fast grep |
| [fd](https://github.com/sharkdp/fd) | Fast find |
| [delta](https://github.com/dandavison/delta) | Better git diffs |
