#!/bin/bash

echo "🧹 Removing old ML4W / Hyprland configs..."

rm -rf ~/.config/hypr
rm -rf ~/.config/waybar
rm -rf ~/.config/rofi
rm -rf ~/.config/kitty
rm -rf ~/.config/dunst
rm -rf ~/.config/wlogout
rm -rf ~/.config/ml4w

rm -rf ~/.local/share/ml4w
rm -rf ~/.cache/ml4w

echo "📦 Updating system..."
sudo pacman -Syu --noconfirm

echo "📦 Installing stable packages..."
sudo pacman -S --noconfirm \
  hyprland kitty waybar rofi dunst hyprpaper \
  pipewire pipewire-alsa pipewire-pulse wireplumber \
  networkmanager git

echo "🌐 Enabling NetworkManager..."
sudo systemctl enable NetworkManager

echo "📁 Creating config folders..."
mkdir -p ~/.config/hypr
mkdir -p ~/.config/waybar
mkdir -p ~/.config/rofi
mkdir -p ~/.config/kitty

echo "⬇️ Downloading ML4W dotfiles (configs only)..."
rm -rf ~/ml4w
git clone https://github.com/mylinuxforwork/dotfiles.git ~/ml4w

echo "📋 Copying configs..."
cp -r ~/ml4w/.config/hypr/* ~/.config/hypr/ 2>/dev/null
cp -r ~/ml4w/.config/waybar/* ~/.config/waybar/ 2>/dev/null
cp -r ~/ml4w/.config/rofi/* ~/.config/rofi/ 2>/dev/null
cp -r ~/ml4w/.config/kitty/* ~/.config/kitty/ 2>/dev/null

echo "🧹 Cleaning unsafe references..."
sed -i '/ml4w/d' ~/.config/hypr/hyprland.conf 2>/dev/null

echo "✅ Done!"
echo "👉 Reboot and run: Hyprland"
