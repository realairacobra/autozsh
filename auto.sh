#!/bin/bash

# Update package lists
sudo apt update

# Install zsh
sudo apt install -y zsh

# Install Oh My Zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Set funky theme
echo "ZSH_THEME=\"funky\"" >> ~/.zshrc

# Install basic Zsh autocompletions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# Add autosuggestions to plugins
echo "plugins=(git autosuggestions)" >> ~/.zshrc

# Reload Zsh configuration
source ~/.zshrc

# Inform user
echo "Oh My Zsh with funky theme and basic autocompletions installed!"
