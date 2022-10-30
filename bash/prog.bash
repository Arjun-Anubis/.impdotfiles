# FZF 
export FZF_DEFAULT_COMMAND="ag --hidden --ignore .git --ignore .fonts -f -g \"\""
export FZF_DEFAULT_OPTS="--border"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Zoxide (cd)
eval "$(zoxide init bash)"


# Powerline

repository_root=/usr/lib/python3/dist-packages
# From pip show powerline-status

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. $repository_root/powerline/bindings/bash/powerline.sh
