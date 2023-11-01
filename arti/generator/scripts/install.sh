#!/bin/bash

mkdir -p ~/dev

git clone https://github.com/Erick3900/arti-gen.git ~/dev/arti-gen
conan install --output-folder=$HOME/dev/arti-gen/build ~/dev/arti-gen --build=missing -s build_type=Release

cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_TOOLCHAIN_FILE=conan_toolchain.cmake -S ~/dev/arti-gen -B ~/dev/arti-gen/build
cmake --build ~/dev/arti-gen/build

sudo mkdir -p /opt/arti/generator/bin

sudo cp ~/dev/arti-gen/build/arti-gen /opt/arti/generator/bin/arti-gen

sudo ln -s ~/dotfiles/arti/generator/config /opt/arti/generator/config
