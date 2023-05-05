#!/bin/bash

echo "Installing Arti Tools"

zsh ~/dotfiles/arti/generator/scripts/install.sh
zsh ~/dotfiles/arti/sub/scripts/install.sh

sudo ln -s ~/dotfiles/arti/env.sh /opt/arti/env.sh
sudo ln -s ~/dotfiles/arti/nvim /opt/arti/nvim

sudo chown -R alcachofa:alcachofa /opt/arti
