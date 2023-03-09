if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi


# Zsh
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="artichoke"
CASE_SENSITIVE="true"

plugins=(systemd sudo git lxd)

source $ZSH/oh-my-zsh.sh


# Env vars
export EDITOR='nvim'
export VIRTUAL_ENV_DISABLE_PROMPT=1

# FZF Sugar

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)

export FZF_DEFAULT_COMMAND='rg --files --fixed-strings --hidden --follow --glob "!.git/*"'


# Personal binaries
if [ -d /opt/arti/generator/bin ]; then
    export PATH=$PATH:/opt/arti/generator/bin
    export PATH=$PATH:/opt/arti/subs/bin
fi

# Spicetify
if [ -d $HOME/.spicetify ]; then
    export PATH=$PATH:$HOME/.spicetify
fi

# Rust
source "$HOME/.cargo/env"

# Miniconda
__conda_setup="$($HOME/miniconda3/bin/conda 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else              
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else                 
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi            
fi                
unset __conda_setup


# Functions

function files() {
    nautilus $@ &>/dev/null & disown
}

# Aliases

alias cat='batcat -p -P'
