#!/bin/bash

mkdir -p ~/dev

git clone https://github.com/Erick3900/arti-sub.git ~/dev/arti-sub
conan install -if ~/dev/arti-sub/conan ~/dev/arti-sub --build=missing -s build_type=Release

cmake -DCMAKE_BUILD_TYPE=Release -S ~/dev/arti-sub -B ~/dev/arti-sub/build
cmake --build ~/dev/arti-sub/build

sudo mkdir -p /opt/arti/sub/bin

sudo cp ~/dev/arti-sub/build/arti-sub /opt/arti/sub/bin/arti-sub
