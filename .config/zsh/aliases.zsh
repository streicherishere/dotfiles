# alias.sh

alias ip='ip -color=auto'

alias kali='lxc start gui-kali; lxc kali gui-kali'
alias kali-stop='lxc stop gui-kali;'
alias sshs='~/scripts/sshs.sh'
alias hosts='cat /etc/hosts | grep -v "^#" | tr " " "\n" | fzf | xclip'

#alias
alias lock="i3lock --color 000000"

alias mem='ps -eo pid,ppid,cmd,comm,%mem,%cpu --sort=-%mem | head -20'
alias cpu='ps -eo pid,ppid,cmd,comm,%mem,%cpu --sort=-%cpu | head -20'
alias rmbranch='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'
alias vim="nvim"
alias ssh='TERM=xterm-256color ssh'

alias lg='lazygit'
alias p='pass fzf'

alias clipmenu-clear='~/scripts/clipmenu-clear.sh'
alias ps_mem='ps -ax --format=pid,rss,comm --sort=-rss,pid | head -20 | awk '\''BEGIN{suffixes_len=split("kB MB GB TB",suffixes)} {n_suffix=1; while($2 > 1000 && n_suffix < suffixes_len) {$2 /= 1024; n_suffix++;}; printf "%5s %7.2f %2s %s\n",$1,$2,suffixes[n_suffix],substr($0, index($0,$3))}'\'' | sed '\''1s/0.00 MB/MEM/'\'''
alias ps_cpu='ps -axo pid,pcpu,comm --sort=-pcpu | head -20'

alias dm='sudo dmesg --color=always | less -R'


alias pacman_list="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"
