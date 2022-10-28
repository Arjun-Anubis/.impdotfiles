#Do nothing if not started as source
case $- in
	*i*) ;;
	*) return;;
esac


#Shell options
shopt -s histappend
shopt -s globstar

#History options
HISTSIZE=1000
HISTFILESIZE=2000



export FZF_DEFAULT_COMMAND="ag --hidden --ignore .git --ignore .fonts -f -g \"\""
export FZF_DEFAULT_OPTS="--border"





bind -x '"\C-l":clear'
#Something to do with less
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

netns="[ $(ip netns identify) ] "
PS1='\[\033[03;32m\]\u\[\033[03;32m\]@\[\033[03;32m\]\h\[\033[00m\]:\[\033[00;34m\]\w\[\033[00m\]\$ '

#ls colors and aliases
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
alias dapt='doas apt'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -alF'
alias la='ls -a'
alias l='ls -l'
alias cpv='rsync -ah --info=progress2'
alias m='ncmpcpp -q'
alias sys='doas systemctl'
alias suctl='systemctl --user'
alias ls='exa'
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


alias qusr="cd ~/.local/share/qutebrowser/userscripts/"
alias sc="cd school"
# alias rec="arecord -r 16000"
alias vedit="sox"
alias serva="python3.11 -m http.server"
alias neovide="~/.cargo/bin/neovide --multigrid"

# alias graph='manimgl ~/math_proofs/graph.py'

#Helper functions


denoise() {
	sox $1 /tmp/noise-audio.wav trim 0 0.9
	sox /tmp/noise-audio.wav -n noiseprof /tmp/noise.prof
	sox $1 $2 noisered /tmp/noise.prof 0.21
}

nss() {
	doas ip netns exec $1 bash
}
Ip() {
	doas ip $@
}

PYENVDIR="$HOME/.pyenvs"
pyenvs=$(ls $PYENVDIR )

vact() {
	source $PYENVDIR/$1/bin/activate
}

complete -W "$pyenvs" vact

vnew() {
	cd $pyenvdir
	python3 -m venv $PYENVDIR/$1
}

#Setting path
PATH+=:/home/anubi/bin/:/home/anubi/.local/bin:


#FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash



# if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
#   exec startx 
# fi
if [ $(tty) = "/dev/tty1" ]; then
	exec startx
fi

export WINEDEBUG="-all"
export EDITOR=vim
export VISUAL=vim
export QT_QPA_PLATFORMTHEME='gnome'

# xrdb -merge ~/.Xresources
. "$HOME/.cargo/env"

export WASMTIME_HOME="$HOME/.wasmtime"
export PATH="$WASMTIME_HOME/bin:$PATH"
bind Space:magic-space
figlet Welcome | lolcat
eval "$(zoxide init bash)"
export PATH=$PATH:/home/anubi/.spicetify
HISTTIMEFORMAT="%F %T "        # for e.g. “1999-02-29 23:59:59”
