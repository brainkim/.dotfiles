#!/bin/bash

# Define the list of dotfiles to symlink
dotfiles=(
  ".tmux.conf"
  ".vimrc"
  ".config/nvim/init.lua"
)

# Get the absolute path of the dotfiles directory
dotfiles_dir="$(cd "$(dirname "$0")" && pwd)"

for file in "${dotfiles[@]}"; do
  target="$HOME/$file"
  source="$dotfiles_dir/$file"
  
  # Create symlink
  echo "Linking $source -> $target"
  ln -sf "$source" "$target"
done

echo "Dotfiles installation complete!"

