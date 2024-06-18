# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
#plug "zettlrobert/simple-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "zap-zsh/vim"
plug "zsh-history-substring-search"
plug "ap-zsh/supercharge"
plug "zap-zsh/exa"
plug "kutsan/zsh-system-clipboard"

# Example sourcing of local files
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/privat_aliases.zsh"
plug "$HOME/.config/zsh/exports.zsh"


fpath=(~/.zsh.d/ $fpath)
# Load and initialise completion system
autoload -Uz compinit
autorestic completion zsh > "${fpath[1]}/_autorestic"
compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(zoxide init --cmd cd  zsh)"

# Enable substitution in the prompt.
setopt prompt_subst

# Function to get the current Git branch name.
function git_branch_name() {
  # Get the current Git branch name.
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')

  # If a branch name is found, format it for display.
  if [[ -n $branch ]]; then
    echo "%F{yellow} ($branch)%f"
  fi
}

# Function to set the prompt based on the exit code.
function set_prompt() {
  # Check the exit code of the last command.
  if [[ $? -eq 0 ]]; then
    # Exit code is 0 (success): set the prompt indicator to white.
    PS1='%F{white}%~$(git_branch_name) %F{green}>%f '
  else
    # Exit code is not 0 (error): set the prompt indicator to white.
    PS1='%F{white}%~$(git_branch_name) %F{red}>%f '
  fi
}

# Add the set_prompt function to precmd functions to update the prompt before each new command.
precmd_functions+=(set_prompt)

