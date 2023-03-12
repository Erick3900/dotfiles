#!/bin/bash

echo "Installing Arti Tools"

zsh ~/dotfiles/arti/generator/scripts/install.sh
zsh ~/dotfiles/arti/sub/scripts/install.sh

ln -s ~/dotfiles/arti/env.sh /opt/arti/env.sh
