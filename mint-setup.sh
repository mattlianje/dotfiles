#!/bin/bash

# Update packages and Upgrade system
echo "***** Updating the system *****"
sudo apt-get update -y

# List of packages to install
packages=(
  git
  zsh
  rofi
  polybar
  vim
  neovim
  vifm
  zathura
  mpv
  cmus
  feh
  i3blocks
  brightnessctl
  ncspot
  dunst
)

for package in "${packages[@]}"; do
  echo "***** Installing ${package} *****"
  sudo apt-get install -y $package
done

echo "***** Installing Rust and Cargo *****"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
source $HOME/.cargo/env

# Alacritty has to be installed from source on Linux Mint
echo "***** Installing Alacritty (A GPU-accelerated terminal emulator) *****"
sudo apt-get install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev python3
git clone https://github.com/alacritty/alacritty.git
cd alacritty
cargo build --release
sudo cp target/release/alacritty /usr/local/bin # moves the alacritty executable to /usr/local/bin/
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg # adds a desktop entry
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database

echo "***** Setting NeoVim as default for Vim and Vi *****"
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor

echo "***** Installing i3 *****"
curl https://baltocdn.com/i3-window-manager/signing.asc | sudo apt-key add -
sudo apt install apt-transport-https --yes
echo "deb https://baltocdn.com/i3-window-manager/i3/i3-autobuild-ubuntu/ all main" | sudo tee /etc/apt/sources.list.d/i3-autobuild.list
sudo apt update
sudo apt install i3

#Restart system to apply changes
echo "***** Rebooting *****"
sudo reboot

