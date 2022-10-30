# Python Environments
PYENVDIR="$HOME/.pyenvs"
pyenvs=$(ls $PYENVDIR )

# Network Super Access
nss() {
	doas ip netns exec $1 bash
}
Ip() {
	doas ip $@
}

vact() {
	source $PYENVDIR/$1/bin/activate
}

vnew() {
	cd $pyenvdir
	python3 -m venv $PYENVDIR/$1
}

# Completions
complete -W "$pyenvs" vact
