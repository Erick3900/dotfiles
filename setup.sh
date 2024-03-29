#!/usr/bin/env bash

echo "Updating apt"
sudo apt-get update

echo "Installing programs"
sudo apt-get install -y ripgrep tmux fzf bat gcc g++ gcc-12 g++-12 gcc-11 g++-11 gcc-11-multilib gcc-12-multilib cmake make ninja-build autoconf automake autotools-dev bison clang-15 clang-format-15 clang-tidy-15 clang-tools-15 clangd-15 curl wget git fd-find gettext golang python3 python3-venv python3-pip python-is-python3 ipython3 lua5.4 neofetch net-tools rlwrap ruby sqlite3 tree unrar valgrind xclip zsh

git config --global user.name "Erick3900"
git config --global user.email "erick.guzmanra@anahuac.mx"
git config --global init.defaultBranch "main"

echo "Clonning or pulling dotfiles repo"

if ! [ -d ~/dotfiles ]; then
    git clone https://github.com/Erick3900/dotfiles ~/dotfiles || { echo >&2 "Failed to clone dotfiles repo with $?"; exit 1; }
else
    git -C ~/dotfiles pull || { echo >&2 "Failed to pull dotfiles repo with $?"; exit 1; }
fi

echo "Configuring alternatives for gcc & g++"
sudo update-alternatives --remove-all gcc
sudo update-alternatives --remove-all g++

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-11 40
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-12 20
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/clang-15 10

sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-11 40
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-12 20
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/clang++-15 10

sudo update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 30
sudo update-alternatives --set cc /usr/bin/gcc

sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 30
sudo update-alternatives --set c++ /usr/bin/g++

echo "Installing Conan"
sudo pip install conan

echo "Installing Rust"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

echo "Installing MiniConda"
wget https://repo.anaconda.com/miniconda/Miniconda3-py310_23.1.0-1-Linux-x86_64.sh -O /tmp/miniconda.sh
bash /tmp/miniconda.sh -u -b -p $HOME/miniconda3

echo "Installing Oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
chsh -s $(which zsh)

echo "Removing existing dotfiles"
mkdir -p ~/.conan2
mkdir -p ~/.config 

rm -rf ~/.vim ~/.vimrc ~/.zshrc ~/.tmux ~/.tmux.conf ~/.clang-format ~/.profile ~/.bashrc ~/.config/nvim ~/.conan2/profiles ~/.config/coc ~/.tmux.conf ~/.tmux 2> /dev/null

echo "Creating symlinks"
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/clangd ~/.clangd
ln -s ~/dotfiles/condarc ~/.condarc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/clang-format ~/.clang-format
ln -s ~/dotfiles/conan-profiles ~/.conan2/profiles
ln -s ~/dotfiles/artichoke.zsh-theme ~/.oh-my-zsh/themes/artichoke.zsh-theme

echo "Installing NodeJS & Yarn"
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update

sudo apt-get install nodejs yarn 

echo "Configuring Tmux"
mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Installing Neovim"
zsh ~/dotfiles/nvim-install.sh

if [ "$(id -u)" -ne 0 ]; then
    echo "Installing OhMyZsh for root"
    sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    sudo chsh -s $(which zsh)

    echo "Removing existing dotfiles"
    sudo rm -rf /root/.vim /root/.vimrc /root/.conan2 /root/.zshrc /root/.tmux /root/.tmux.conf /root/.clang-format /root/.profile /root/.bashrc /root/.config/nvim /root/.local/share/nvim /root/miniconda3 /root/.cargo /root/.rustup /root/.config/coc /root/.conan /root/.tmux /root/.tmux.conf 2> /dev/null

    echo "Creating symlinks"
    sudo mkdir -p /root/.config
    sudo mkdir -p /root/.local/share

    sudo ln -s ~/.tmux /root/.tmux
    sudo ln -s ~/.cargo /root/.cargo
    sudo ln -s ~/.conan2 /root/.conan2
    sudo ln -s ~/.rustup /root/.rustup
    sudo ln -s ~/miniconda3 /root/miniconda3
    sudo ln -s ~/.config/coc /root/.config/coc
    sudo ln -s ~/.local/share/nvim /root/.local/share/nvim

    sudo ln -s ~/dotfiles/zshrc /root/.zshrc
    sudo ln -s ~/dotfiles/clangd /root/.clangd
    sudo ln -s ~/dotfiles/condarc /root/.condarc
    sudo ln -s ~/dotfiles/nvim /root/.config/nvim
    sudo ln -s ~/dotfiles/tmux.conf /root/.tmux.conf
    sudo ln -s ~/dotfiles/clang-format /root/.clang-format
    sudo ln -s ~/dotfiles/artichoke.zsh-theme /root/.oh-my-zsh/themes/artichoke.zsh-theme
fi

zsh ~/dotfiles/arti/install.sh

echo "Finished, restart your session to start in the new configured shell!"
