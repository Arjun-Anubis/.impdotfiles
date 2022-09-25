#Do nothing if not started as source
case $- in
	*i*) ;;
	*) return;;
esac


export ZSH=$HOME/.oh-my-zsh
source ~/github/zsh-snap/znap.zsh
plugins=(git)

source $ZSH/oh-my-zsh.sh
#Shell options
# shopt -s histappend
# shopt -s globstar
setopt auto_cd
setopt auto_pushd
setopt auto_list
setopt hist_append

#History options
HISTSIZE=1000
HISTFILESIZE=2000




# bind -x '"\C-l":clear'
#Something to do with less
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# PS1='\[\033[03;32m\]\u\[\033[03;32m\]@\[\033[03;32m\]\h\[\033[00m\]:\[\033[03;34m\]\w\[\033[00m\]\$ '
PS1=$'%{\x1b[3m%}%F{green}%n@%m:%F{blue}%~%F{white}%(#.#.$)%f%{\x1b[0m '

#ls colors and aliases
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
alias ls='ls --color=auto'
alias sysctl='systemctl'
alias dapt='doas apt'
alias cpv='rsync -ah --info=progress2'
alias suctl='systemctl --user'
alias grep='grep --color=auto'
alias ls='exa'
alias ll='ls -alF'
alias la='ls -A'
# alias l='ls -CF'
alias m='ncmpcpp'

#Setting path
PATH+=:/home/anubi/bin/:/home/anubi/.local/bin:


#FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh



# if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
#   exec startx 
# fi
#
if [ $(tty) = "/dev/tty1" ]; then
	exec startx
fi

export WINEDEBUG="-all"
export EDITOR=vim
export VISUAL=vim
export FZF_DEFAULT_COMMAND="ag --hidden --ignore .git --ignore .fonts -f -g \"\""
 # load module for list-style selection
 zmodload zsh/complist

 # use the module above for autocomplete selection
 zstyle ':completion:*' menu yes select

 # now we can define keybindings for complist module
 # you want to trigger search on autocomplete items
 # so we'll bind some key to trigger history-incremental-search-forward function
 bindkey -M menuselect '?' history-incremental-search-forward
