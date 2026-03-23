#!/bin/bash

echo "🧹 Removing Hyprland, Kitty, ML4W..."

# Remove packages
sudo pacman -Rns --noconfirm \
  hyprland kitty waybar rofi dunst wlogout hyprpaper \
  xdg-desktop-portal-hyprland

# Remove configs
echo "🗑️ Deleting configs..."
rm -rf ~/.config/hypr
rm -rf ~/.config/waybar
rm -rf ~/.config/rofi
rm -rf ~/.config/kitty
rm -rf ~/.config/dunst
rm -rf ~/.config/wlogout
rm -rf ~/.config/ml4w

# Remove ML4W files
rm -rf ~/.local/share/ml4w
rm -rf ~/.cache/ml4w
rm -rf ~/ml4w

# Clean user scripts (careful)
echo "⚠️ Cleaning ~/.local/bin ..."
rm -rf ~/.local/bin/*

# Remove unused dependencies
echo "🧽 Cleaning unused packages..."
sudo pacman -Rns $(pacman -Qtdq) --noconfirm 2>/dev/null

echo "🔍 Final check..."
find ~ -iname "*ml4w*" 2>/dev/null

echo "✅ CLEAN COMPLETE!"
echo "👉 Reboot your system"
