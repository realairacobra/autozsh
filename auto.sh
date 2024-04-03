#!/bin/bash

# Updates
sudo apt update

# Install zsh
sudo apt install -y zsh nano wget git curl
clear

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended --keep-zshrc
clear

# Set .zshrc file
cd
rm -rf .zshrc
wget https://raw.githubusercontent.com/realairacobra/autozsh/main/.zshrc
clear

# Install zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
clear

chsh -s $(which zsh) #set zsh as default shell
clear
read -p "Are you sure you want to install flatpak and add the flathub repository? (y/N) " yn

while [[ ! $yn =~ ^[YyNn]$ ]]; do
  echo "Invalid input. Please enter y or n."
  read -p "Are you sure you want to continue? (y/N) " yn
done

case $yn in
  [Yy]*)  # Matches any variation of yes (y,Y,yes,YES)
    echo "Installing flatpak and adding flathub repository..."
    sudo apt install -y flatpak && sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    clear
    zsh
    ;;
  [Nn]*)  # Matches any variation of no (n,N,no,NO)
    echo "Exiting"
    zsh
    ;;
esac
