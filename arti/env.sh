#!/bin/bash

if [ -d "$( dirname -- $0; )/generator/bin" ]; then
    export PATH="$PATH:$( dirname -- $0; )/generator/bin"
fi

if [ -d "$( dirname -- $0; )/sub/bin" ]; then
    export PATH="$PATH:$( dirname -- $0; )/sub/bin"
fi

if [ -d "$( dirname -- $0; )/spotify/bin" ]; then
    export PATH="$PATH:$( dirname -- $0; )/spotify/bin"
fi
