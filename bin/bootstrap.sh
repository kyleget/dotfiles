#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$HOME/projects/dotfiles"
PACKAGES=( zsh git vim nvim )

command_exists() {
  command -v "$1" >/dev/null 2>&1
}

install_stow() {
  command_exists stow && return

  if command_exists brew; then
    brew install stow
  elif command_exists apt; then
    sudo apt update && sudo apt install -y stow
  else
    echo "❌ Please install stow manually"
    exit 1
  fi
}

main() {
  install_stow

  for package in "${PACKAGES[@]}"; do
    if [ ! -d "$DOTFILES_DIR/$package" ]; then
      echo "Skipping missing package: $package"
      continue
    fi

    echo "Stowing $package"
    stow --verbose \
         --dir="$DOTFILES_DIR" \
         --target="$HOME" \
         "$package"
  done

  echo "✅ Dotfiles successfully stowed"
}

main "$@"
