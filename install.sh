#!/bin/bash

# Define the list of dotfiles to symlink
dotfiles=(
  ".tmux.conf"
  ".zshrc"
  ".zshenv"
  ".config/nvim/init.lua"
  ".config/git/ignore"
  ".config/git/config"
  ".config/ghostty/config.ghostty"
  ".config/neovide/config.toml"
  ".config/mise/config.toml"
)

# Get the absolute path of the dotfiles directory
dotfiles_dir="$(cd "$(dirname "$0")" && pwd)"

for file in "${dotfiles[@]}"; do
  target="$HOME/$file"
  source="$dotfiles_dir/$file"
  
  # Create symlink
  mkdir -p "$(dirname "$target")"
  echo "Linking $source -> $target"
  rm -rf "$target"
  ln -sf "$source" "$target"
done

command -v brew >/dev/null && brew bundle --file="$dotfiles_dir/Brewfile"
command -v mise >/dev/null && mise install

echo "Dotfiles installation complete!"
