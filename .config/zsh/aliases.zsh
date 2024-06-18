# alias.sh
#
# function
#


alias ip='ip -color=auto'
alias sshs='sshs.sh'
alias hosts='cat /etc/hosts | grep -v "^#" | tr " " "\n" | fzf | xclip'

alias cal='open-calendar.sh'


#alias
alias lock="i3lock --color 000000"
alias "la"="ls -lagh"
alias "ll"="ls -lgh"
alias "diff"="delta"

alias mem='ps -eo pid,ppid,cmd,comm,%mem,%cpu --sort=-%mem | head -20'
alias cpu='ps -eo pid,ppid,cmd,comm,%mem,%cpu --sort=-%cpu | head -20'
alias rmbranch='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'
alias vim="nvim"
alias ssh='TERM=xterm-256color ssh'
alias sshadd='sshadd.sh'

alias lg='lazygit'
alias p='pass.sh fzf'
alias pass='pass.sh fzf'
alias pass-edit='pass.sh fzf -s | xargs pass edit'
alias pe='pass.sh fzf -s | xargs pass edit'
alias pw='create_pass_entry.sh'
alias pm='selected=$(p -s) && echo -n "Neuer Name/Pfad [$selected]: " && read new_name && pass.sh mv "$selected" "${new_name:-$selected}"'
alias h='cht.sh'

alias clipmenu-clear='clipmenu-clear.sh'
alias ps_mem='ps -ax --format=pid,rss,comm --sort=-rss,pid | head -20 | awk '\''BEGIN{suffixes_len=split("kB MB GB TB",suffixes)} {n_suffix=1; while($2 > 1000 && n_suffix < suffixes_len) {$2 /= 1024; n_suffix++;}; printf "%5s %7.2f %2s %s\n",$1,$2,suffixes[n_suffix],substr($0, index($0,$3))}'\'' | sed '\''1s/0.00 MB/MEM/'\'''
alias ps_cpu='ps -axo pid,pcpu,comm --sort=-pcpu | head -20'

alias dm='sudo dmesg --color=always | less -R'

alias pacman_list="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"

alias paca="~/scripts/commands/commands.sh"

alias yu='yay -Syua'        # Synchronize with repositories and upgrade packages, including AUR packages.
alias yi='yay -S'           # Install a specific package from repos added to the system
alias yil='yay -U'          # Install specific package that has been downloaded to the local system
alias yr='yay -R'           # Remove package but retain configs and required dependencies
alias yrall='yay -Rns'      # Remove package or packages , its configuration and all unwanted dependencies
alias yip='yay -Si'         # Display information about a given package located in the repositories
alias ys='yay -Ss'          # Search for package or packages in the repositories
alias yil='yay -Qi'         # Display information about a given package in the local database
alias ysl='yay -Qs'         # Search for package(s) in the local database
alias yll='yay -Qe'         # List installed packages, even those installed from AUR (they're tagged as "local")
alias yro='yay -Qtd'        # Remove orphans using yay
alias pacu='sudo pacman -Syu'       # Update the system and upgrade all system packages.
alias paci='sudo pacman -S'         # Install a specific package from repos added to the system
alias pacl='sudo pacman -U'         # Install specific package that has been downloaded to the local system
alias paci='pacman -Si'             # Display information about a given package located in the repositories
alias pacs='pacman -Ss'             # Search for package or packages in the repositories
alias pacr='sudo pacman -R'         # Remove the specified package but retain its configuration and deps
alias pacrall='sudo pacman -Rns'    # Remove package, its configuration and all unwanted dependencies
alias pacsl='pacman -Qi'            # Display information about a given package in the local database
alias paclocs='pacman -Qs'          # Search for package/packages in the local database

alias host='sudo vim /etc/hosts'

# Move cursor by word
bindkey "^[[1;5D" backward-word   # Ctrl + Left Arrow
bindkey "^[[1;5C" forward-word    # Ctrl + Right Arrow


alias sd='selected=$(find * -type d -o -type f | fzf) && if [ -d "$selected" ]; then cd "$selected"; else vim "$selected"; fi'

alias cit='glab ci trace'
alias cip='glab ci view'
