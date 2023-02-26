#!/usr/bin/env bash

echo "Updating apt"
sudo apt-get update

echo "Installing programs"
sudo apt-get install -y ripgrep fzf bat gcc g++ gcc-12 g++-12 gcc-11 g++-11 cmake make ninja-build autoconf automake autotools-dev bison clang-14 clang-15 clang-format-15 clang-tidy-15 clang-tools-15 clangd-15 curl wget git fd-find gettext golang python3 python3-venv python3-pip python-is-python3 ipython3 lua5.4 neofetch net-tools rlwrap ruby sqlite3 tree unrar valgrind xclip zsh

git config --global user.name "Erick3900"
git config --global user.email "erick.guzmanra@anahuac.mx"
git config --global init.defaultBranch "main"

echo "Configuring alternatives for gcc & g++"
sudo update-alternatives --remove-all gcc
sudo update-alternatives --remove-all g++

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 10
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-12 20
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/clang-14 10
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/clang-15 20

sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-11 10
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-12 20
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/clang++-14 10
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/clang++-15 20

sudo update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 30
sudo update-alternatives --set cc /usr/bin/gcc

sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 30
sudo update-alternatives --set c++ /usr/bin/g++

echo "Installing Conan (v1.59.0)"
sudo pip install conan==1.59.0
mkdir -p ~/.conan
rm -fr ~/.conan/profiles 
ln -s ~/dotfiles/conan-profiles ~/.conan/profiles

echo "Installing Rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

echo "Installing MiniConda"
wget https://repo.anaconda.com/miniconda/Miniconda3-py310_23.1.0-1-Linux-x86_64.sh -O /tmp/miniconda.sh
bash /tmp/miniconda.sh -b -p $HOME/miniconda3

echo "Installing Oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
chsh -s $(which zsh)

echo "Installing Neovim"
wget -P /tmp https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.deb
sudo apt-get install -y /tmp/nvim-linux64.deb

echo "Removing existing dotfiles"
rm -rf ~/.vim ~/.vimrc ~/.zshrc ~/.tmux ~/.tmux.conf ~/.clang-format ~/.profile ~/.bashrc ~/.config/nvim 2> /dev/null

echo "Creating symlinks"
mkdir -p ~/.config 

ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/clang-format ~/.clang-format
ln -s ~/dotfiles/artichoke.zsh-theme ~/.oh-my-zsh/themes/artichoke.zsh-theme

echo "Installing NodeJS & Yarn"
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update

sudo apt-get install nodejs yarn 

echo "Installing Packer.nvim"
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

echo "Configuring Neovim"
mkdir -p ~/.config/nvim
cp ~/dotfiles/nvim-pre-install.lua ~/.config/nvim/init.lua

nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerInstall'

rm -fr ~/.config/nvim
ln -s ~/dotfiles/nvim ~/.config/nvim

if ! [[ -d ~/.config/coc ]]; then
    mkdir -p ~/.config/coc
fi


yarn --cwd ~/.local/share/nvim/site/pack/packer/start/coc.nvim install

if [ "$(id -u)" -ne 0 ]; then
    echo "Installing OhMyZsh for root"
    sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    sudo chsh -s $(which zsh)

    echo "Removing existing dotfiles"
    sudo rm -rf /root/.vim /root/.vimrc /root/.conan /root/.zshrc /root/.tmux /root/.tmux.conf /root/.clang-format /root/.profile /root/.bashrc /root/.config/nvim /root/.local/share/nvim /root/miniconda3 /root/.cargo /root/.rustup /root/.config/coc 2> /dev/null

    echo "Creating symlinks"
    sudo mkdir -p /root/.config
    sudo mkdir -p /root/.local/share

    sudo ln -s ~/miniconda3 /root/miniconda3
    sudo ln -s ~/.cargo /root/.cargo
    sudo ln -s ~/.conan /root/conan
    sudo ln -s ~/.rustup /root/.rustup
    sudo ln -s ~/dotfiles/nvim /root/.config/nvim
    sudo ln -s ~/.local/share/nvim /root/.local/share/nvim
    sudo ln -s ~/.config/coc /root/.config/coc
    sudo ln -s ~/dotfiles/zshrc /root/.zshrc
    sudo ln -s ~/dotfiles/clang-format /root/.clang-format
    sudo ln -s ~/dotfiles/artichoke.zsh-theme /root/.oh-my-zsh/themes/artichoke.zsh-theme
fi

echo "Finished!"

zsh
