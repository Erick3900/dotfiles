#!/bin/env bash

echo "Installing Neovim"

wget -P /tmp https://github.com/neovim/neovim/releases/download/v0.8.3/nvim-linux64.deb
sudo apt-get install -y /tmp/nvim-linux64.deb

echo "Installing Packer.nvim"

git clone --depth 1 https://github.com/wbthomason/packer.nvim \
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim

echo "Configuring Neovim"

mkdir -p ~/.config/nvim
cp ~/dotfiles/nvim/lua/alcachofa/packer.lua ~/.config/nvim/init.lua

nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerInstall'

rm -fr ~/.config/nvim
ln -s ~/dotfiles/nvim ~/.config/nvim

echo "Finished installing Neovim"
