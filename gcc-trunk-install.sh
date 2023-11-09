#!/bin/env bash

VAR_GCC_SUFFIX=-13
VAR_GCC_GIT_BRANCH=releases/gcc-13.2.0

mkdir -p ~/dev/thirdparty

# git clone --depth 1 --branch "${VAR_GCC_GIT_BRANCH}" git://gcc.gnu.org/git/gcc.git ~/dev/thirdparty/gcc-src

cd ~/dev/thirdparty/gcc-src

# git checkout $VAR_GCC_GIT_BRANCH

if [ -d ~/dev/thirdparty/gcc$VAR_GCC_SUFFIX ]; then
    sudo rm -fr ~/dev/thirdparty/gcc$VAR_GCC_SUFFIX
fi

mkdir ~/dev/thirdparty/gcc$VAR_GCC_SUFFIX

cd ~/dev/thirdparty/gcc$VAR_GCC_SUFFIX

~/dev/thirdparty/gcc-src/configure --enable-languages=c,c++ \
    --program-suffix=$VAR_GCC_SUFFIX \
    --with-multilib-list=m32,m64,mx32 \
    --enable-libstdcxx-backtrace=yes \
    --enable-libstdcxx-time=yes \
    --target=x86_64-linux-gnu \
    --enable-libstdcxx-debug \
    --enable-linker-build-id \
    --build=x86_64-linux-gnu \
    --host=x86_64-linux-gnu \
    --enable-threads=posix \
    --enable-clocale=gnu \
    --disable-bootstrap \
    --enable-multiarch \
    --enable-gold=yes \
    --enable-multilib \
    --enable-plugins \
    --disable-werror \
    --enable-ld=yes \
    --with-abi=m64 \
    --enable-lto \
    --prefix=/opt/gcc$VAR_GCC_SUFFIX

make -j8

sudo make install

sudo update-alternatives --install /usr/bin/g++ g++ /opt/gcc$VAR_GCC_SUFFIX/bin/g++$VAR_GCC_SUFFIX 10
sudo update-alternatives --install /usr/bin/gcc gcc /opt/gcc$VAR_GCC_SUFFIX/bin/gcc$VAR_GCC_SUFFIX 10
