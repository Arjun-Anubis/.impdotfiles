#ls colors and aliases
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
alias dapt='doas apt-get'
alias grep='grep --color=auto'
alias ls='exa --icons'
alias ll='ls -alF'
alias la='ls -a'
alias l='ls -l'
alias cpv='rsync -ah --info=progress2'
alias m='ncmpcpp -q'
alias sys='doas systemctl'
alias suctl='systemctl --user'
alias notif="dunstify"
alias notic="dunstify -u critical"
alias notil="dunstify -u low"
alias curl="curl -s"
alias get="http"
alias post="http post"
alias put="http put"
alias tv="kitty +kitten icat"
alias remake="make clean && make"
alias dl="cd ~/temp/whatsapp_local/download/"
alias graph="manimgl /home/anubi/math_proofs/graph.py"
alias vi="nvim"
alias pup="pup -c"
alias vedit="sox"
alias serva="python3.11 -m http.server"
