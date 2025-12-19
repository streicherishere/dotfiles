
# Path to your oh-my-zsh installation.
export PATH="$HOME/.bin:${PATH}"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/scripts/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden --glob "!{.git,node_modules}/*"'
export FZF_CTRL_R_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_COMMAND='rg --files --follow --hidden --glob "!{.git,node_modules}/*"'
export FZF_DEFAULT_OPTS="--height=40% --layout=reverse --info=inline --border
    --margin=1 --padding=1 --multi --preview '[[ -f {} ]] && bat --color=always {}' --no-mouse \
    --color=fg:-1,bg:-1,hl:#b6d5f5 \
    --color=fg+:#ffffff,bg+:#0a0909,hl+:#99d94c \
    --color=info:#e3ba62,prompt:#b6d5f5,pointer:#ff0000 \
    --color=marker:#ffffff,spinner:#ffe100,header:#ffe100 \
    --border=double --exact
      "

export PASSWORD_STORE_ENABLE_EXTENSIONS=true
export PASSWORD_STORE_ENABLE_EXTENSIONS=true pass fzf

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

export PASS_GIT_HELPER_SKIP=""
export EDITOR=/usr/bin/nvim
export LIBVIRT_DEFAULT_URI="qemu:///system"

# Share history between multiple Zsh sessions
setopt HIST_IGNORE_DUPS  # Ignore duplicate commands
setopt HIST_IGNORE_SPACE # Ignore commands starting with a space
setopt HIST_SAVE_NO_DUPS # Don't save duplicate history
setopt SHARE_HISTORY     # Share history across all sessions
setopt APPEND_HISTORY    # Append history to the history file (instead of overwriting it)
HISTFILE=~/.zsh_history  # Use a shared history file
HISTSIZE=10000           # Set the maximum number of commands to remember
SAVEHIST=10000

export BROWSER=firefox

export CM_SELECTIONS=primary
export CM_DIR=$HOME/.cache/clipmenu_primary

# FZF-Tab configuration
# Disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# Set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# Set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# Preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
# Switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'

