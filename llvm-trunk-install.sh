#!/bin/env bash

VAR_LLVM_SUFFIX=-17
VAR_LLVM_GIT_BRANCH=tags/llvmorg-17.0.4

mkdir -p ~/dev/thirdparty

# if [ -d ~/dev/thirdparty/llvm-src ]; then
#     sudo rm -fr ~/dev/thirdparty/llvm-src
# fi

# git clone --depth 1 https://github.com/llvm/llvm-project.git ~/dev/thirdparty/llvm-src

# cd ~/dev/thirdparty/llvm-src

# git checkout $VAR_LLVM_GIT_BRANCH

if [ -d ~/dev/thirdparty/llvm$VAR_LLVM_SUFFIX ]; then
    sudo rm -fr ~/dev/thirdparty/llvm$VAR_LLVM_SUFFIX
fi

cmake -G Ninja \
    -S ~/dev/thirdparty/llvm-src/llvm \
    -B ~/dev/thirdparty/llvm$VAR_LLVM_SUFFIX \
    -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra;lld" \
    -DLLVM_ENABLE_RUNTIMES="libcxx;libcxxabi" \
    -DCMAKE_BUILD_TYPE=Release

cmake --build ~/dev/thirdparty/llvm$VAR_LLVM_SUFFIX -j8
sudo cmake --install ~/dev/thirdparty/llvm$VAR_LLVM_SUFFIX --prefix /opt/llvm$VAR_LLVM_SUFFIX

sudo update-alternatives --install /usr/bin/g++ g++ /opt/llvm$VAR_LLVM_SUFFIX/bin/clang++ 10
sudo update-alternatives --install /usr/bin/gcc gcc /opt/llvm$VAR_LLVM_SUFFIX/bin/clang 10
