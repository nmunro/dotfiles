# dotfiles

Managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Setup on a new machine

### 1. Clone the repo

```bash
git clone --recurse-submodules https://github.com/nmunro/dotfiles ~/.dotfiles
```

The `--recurse-submodules` flag is required to pull TPM alongside the rest of the config.

### 2. Stow packages

From `~/.dotfiles`, run `stow <package>` for each package you want:

```bash
cd ~/.dotfiles
stow tmux
stow doom
```

### 3. Install tmux plugins

Start a tmux session and press `prefix + I` (capital I) to install plugins via TPM.

---

## Packages

### tmux

Manages:
- `~/.config/tmux/tmux.conf` — tmux configuration
- `~/.config/tmux-powerline/config.sh` — tmux-powerline segment/theme config
- `~/.config/tmux/plugins/tpm` — [TPM](https://github.com/tmux-plugins/tpm) (git submodule)

Plugins declared in `tmux.conf` are installed by TPM at runtime and are not tracked in this repo.

### doom

Manages:
- `~/.config/doom/` — Doom Emacs configuration

---

## Adding a new package

```bash
mkdir -p ~/.dotfiles/<package>/<path>
mv ~/.<config> ~/.dotfiles/<package>/<path>/
cd ~/.dotfiles && stow <package>
```

## Updating submodules

```bash
cd ~/.dotfiles
git submodule update --remote
```
