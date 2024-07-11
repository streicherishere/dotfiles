# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
plug "romkatv/powerlevel10k"
plug "kutsan/zsh-system-clipboard"

# Example sourcing of local files
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/privat_aliases.zsh"
plug "$HOME/.config/zsh/exports.zsh"


# Load and initialise completion system
autoload -Uz compinit
autorestic completion zsh > "${fpath[1]}/_autorestic"
compinit
source <(kubectl completion zsh)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(zoxide init --cmd cd  zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
