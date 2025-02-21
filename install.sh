#!/bin/bash

DOTFILES="$HOME/.dotfiles"

# Create backup directory
mkdir -p "$DOTFILES/backup"

# Backup existing dotfiles
[ -f "$HOME/.bashrc" ] && mv "$HOME/.bashrc" "$DOTFILES/backup/"
[ -f "$HOME/.gitconfig" ] && mv "$HOME/.gitconfig" "$DOTFILES/backup/"
[ -f "$HOME/.vimrc" ] && mv "$HOME/.vimrc" "$DOTFILES/backup/"
[ -f "$HOME/.zshrc" ] && mv "$HOME/.zshrc" "$DOTFILES/backup/"

# Create symbolic links
ln -sf "$DOTFILES/bash/.bashrc" "$HOME/.bashrc"
ln -sf "$DOTFILES/git/.gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTFILES/vim/.vimrc" "$HOME/.vimrc"
ln -sf "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"

echo "✨ Dotfiles installation complete!"
