#Shell options
shopt -s histappend
shopt -s globstar

#History options
HISTSIZE=1000
HISTFILESIZE=2000
HISTTIMEFORMAT="%F %T "        # for e.g. “1999-02-29 23:59:59”

#Something to do with less
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
