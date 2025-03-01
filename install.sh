#!/bin/bash

DOTFILES="$HOME/.dotfiles"
STOW_FOLDERS="zsh nvim tmux vim-2022 i3 awesomewm"

# Create backup directory
mkdir -p "$DOTFILES/backup"

# Backup existing dotfiles that might conflict
for config in .zshrc .config/nvim .tmux.conf .vimrc .config/i3 .config/awesome; do
[ -e "$HOME/$config" ] && mv "$HOME/$config" "$DOTFILES/backup/"
done

# Change to dotfiles directory
cd "$DOTFILES"

# Use stow to create symbolic links for each package
for folder in $STOW_FOLDERS; do
echo "Stowing $folder"
stow -D "$folder" # Remove any existing links
stow "$folder"    # Create new links
done

echo "✨ Dotfiles installation complete!"
