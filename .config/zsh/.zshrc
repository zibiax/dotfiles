#!/usr/bin/env zsh

export ZDOTDIR="$HOME/.config/zsh"

# Source ZSH configs
source ${ZDOTDIR}/options.zsh # Source zsh options
source ${ZDOTDIR}/compinit.zsh # Source completion conf
source ${ZDOTDIR}/aliases.zsh # Source zsh aliases
source ${ZDOTDIR}/keybinds.zsh # Source zsh keybinds
source ${ZDOTDIR}/functions.zsh # Source custom functions
source ${ZDOTDIR}/zgenom.zsh # Source zgenom for plugins
source ${ZDOTDIR}/keybinds-late.zsh # Source late load keybinds

# Function to get the current Git branch with color
git_branch() {
    local branch_name
    branch_name=$(git branch 2>/dev/null | sed -n '/\* /s///p')
    
    if [ -n "$branch_name" ]; then
        echo -n "%F{green}[${branch_name}]%f "
    fi
}

# Customize your Zsh prompt
PROMPT='%F{blue}%n%: %~ $(git_branch)%F{reset}% '

# Check if Miniconda is installed
if [[ -d "/opt/miniconda3" ]]; then
    # Add Miniconda to PATH
    export PATH="/opt/miniconda3/bin:$PATH"
    export CONDA_EXE="/opt/miniconda3/bin/conda"

    # Activate conda base environment
    . "/opt/miniconda3/etc/profile.d/conda.sh"
    conda activate base
fi

# Add system Python to PATH
export PATH="/bin:$PATH"

# PROMPT='%F{yellow}%3~%f $ '
# Run fetch script on zsh start
macchina --theme fazzi
#fetch.sh

#parse_git_branch() {
#     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
#}
# export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

#export QT_QPA_PLATFORM=wayland

#__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
#        . "/opt/miniconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/opt/miniconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<

