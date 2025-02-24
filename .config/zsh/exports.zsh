
# Path to your oh-my-zsh installation.
export PATH="$HOME/.bin:${PATH}"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/scripts/bin:$PATH"


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
    --border=double
      "


export PASSWORD_STORE_ENABLE_EXTENSIONS=true
export PASSWORD_STORE_ENABLE_EXTENSIONS=true pass fzf

export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

export PASS_GIT_HELPER_SKIP=""
export EDITOR=/usr/bin/nvim
export LIBVIRT_DEFAULT_URI="qemu:///system"
