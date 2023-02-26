# Artichoke Dotfiles

The script `setup.sh` installs and configures my basic setup.

This includes:

* Installing
  * Gcc & Clang
  * Nodejs & Yarn
  * Rust
  * Python
  * Lua
  * Zsh
  * Miniconda
* Configuring the `update-alternatives` options for c++ and cc
* Installing and configuring OhMyZsh with my custom theme
* Installing and configuring Neovim with my personal configs
* Creating the symlinks for my dotfiles
* Installing other programs i use (from apt)

## Usage

Follow this simple steps.

1. Run `setup.sh` after clonning the repo (or this oneliner `sh -c "$(curl -fsSL https://raw.githubusercontent.com/Erick3900/dotfiles/main/setup.sh)"`)
2. If the script asks for it, confirm and provide params
3. Wuuu! Finished!

## Additional steps

```bash
conda config --set auto_activate_base false
conda config --set changeps1 False
```
