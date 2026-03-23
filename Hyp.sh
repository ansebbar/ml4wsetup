#!/bin/bash

echo "🧹 Updating system..."
sudo pacman -Syu --noconfirm

echo "📦 Installing stable dependencies..."
sudo pacman -S --needed --noconfirm \
git wget unzip rsync jq xdg-desktop-portal-hyprland \
hyprland hyprpaper hyprlock hyprpicker kitty waybar rofi dunst \
networkmanager pavucontrol papirus-icon-theme breeze breeze-icons \
python-pywalfox python-gobject ttf-font-awesome otf-font-awesome

echo "🌐 Enabling NetworkManager..."
sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager

echo "🗑️ Cleaning previous ML4W configs (if any)..."
rm -rf ~/.config/hypr ~/.config/waybar ~/.config/rofi ~/.config/kitty ~/.config/dunst ~/.config/wlogout ~/.config/ml4w
rm -rf ~/.local/share/ml4w ~/.cache/ml4w ~/ml4w

echo "⬇️ Downloading ML4W stable v2.11.1..."
git clone --branch v2.11.1 https://github.com/mylinuxforwork/dotfiles.git ~/ml4w

echo "📋 Copying ML4W configs..."
mkdir -p ~/.config
cp -r ~/ml4w/dotfiles/.config/* ~/.config/

echo "🧹 Cleaning unsafe references in Hyprland config..."
sed -i '/ml4w/d' ~/.config/hypr/hyprland.conf 2>/dev/null

echo "✅ ML4W 2.11.1 stable config installed!"
echo "👉 Reboot your system and start Hyprland with: Hyprland"
