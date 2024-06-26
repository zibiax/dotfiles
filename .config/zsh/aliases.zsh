# Basic aliases
alias rm='rm -rIv'   # Recursive, interactive, and verbose `rm`
alias cp='cp -rv'   # Recursive and verbose `cp`
alias mv='mv -v'    # Verbose `mv`
alias mkdir='mkdir -vp'  # Recursive, verbose `mkdir`
alias grep='rg'     # Use `ripgrep` instead of `grep`
alias cat='bat'     # Use `bat` instead of `cat`
alias c='clear' # clear
alias q='exit' # exit

# `exa` aliases for more informative and colored output
alias la='exa --icons -a --group-directories-first'  # List all files and directories, including hidden ones
alias ll='exa --icons -lah --group-directories-first'  # List in long format with permissions and human-readable sizes
alias ls='exa --icons --group-directories-first'  # List files and directories

# `exa` alias for displaying directory trees
alias tree='exa --icons --tree'

# Git aliases
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gc='git commit --verbose'
alias gcam='git commit --all --message'
alias gd='git diff'
alias gp='git push'

# Misc aliases
alias updates='checkupdates; paru -Qum'  # Check system and AUR updates
alias rs='curl --data-binary @- https://paste.rs | wl-copy'  # Share output to a pastebin and copy to clipboard
alias vim='nvim' # Editor
alias n='nvim .' # Start nvim in directory
alias upgrade='yay && sudo pacman -Syuu && paru' # update script
alias restart-plex='sudo systemctl restart plexmediaserver'
alias tmux-save='/home/martin/bin/tmux-script.sh save' # save state of tmux
alias tmux-restore='/home/martin/bin/tmux-script.sh restore' # save state of tmux
alias killtree='/home/martin/bin/killtree.sh' # kill parent and child process. Used like this "killtree 21321"
