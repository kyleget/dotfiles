# Dotfiles

Personal dotfiles managed with **GNU Stow**.

This repo is the **source of truth**. Files are **symlinked**, not copied.

---

## Requirements

- macOS or Linux
- `git`
- `stow`

On macOS:
```bash
brew install stow
```

On Debian/Ubuntu:
```bash
sudo apt install stow
```

---

## Repo Layout

Each top‑level directory is a **stow package** and mirrors `$HOME`.

```text
dotfiles/
├── zsh/
│   └── .zshrc
├── vim/
│   └── .vimrc
├── nvim/
│   └── .config/
│       └── nvim/
│           └── init.vim
├── git/
│   └── .gitconfig
└── bin/
    └── bootstrap.sh
```

---

## Bootstrap (New Machine)

### 1. Clone the repo

```bash
git clone git@github.com:YOUR_USERNAME/dotfiles.git ~/projects/dotfiles
cd ~/projects/dotfiles
```

---

### 2. Back up or remove existing dotfiles

Stow **will not overwrite existing files**.

If you already have dotfiles, back them up or remove them first:

```bash
mv ~/.zshrc ~/.zshrc.bak
mv ~/.vimrc ~/.vimrc.bak
mv ~/.gitconfig ~/.gitconfig.bak
```

(Adjust as needed.)

---

### 3. Run bootstrap

```bash
bin/bootstrap.sh
```

This will:
- Install `stow` if missing
- Create symlinks into `$HOME`
- Leave existing files untouched unless you removed them first

---

## Manual Usage

You can also run stow directly:

```bash
stow zsh git vim nvim
```

Re‑apply symlinks after changes:

```bash
stow -R zsh
```

Remove a package:

```bash
stow -D vim
```

---

## Notes

- This repo **does not** use `stow --adopt`
- Existing dotfiles are never moved automatically
- The goal is predictable, explicit behavior

---

## Local Overrides (Recommended)

For machine‑specific or sensitive settings:

### Zsh

Create `~/.zshrc.local`:

```bash
# machine‑specific settings
```

Add to `.zshrc`:

```bash
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
```

### Git

Create `~/.gitconfig.local`:

```ini
[user]
  email = work@example.com
```

Add to `.gitconfig`:

```ini
[include]
  path = ~/.gitconfig.local
```

Ignore these files in git.

---

## Philosophy

- Minimal
- Explicit
- No magic
- Repo is the source of truth
- Humans make destructive decisions once
- Tools stay boring

---

## License

MIT License. See the `LICENSE` file for details.
