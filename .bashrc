#Do nothing if not started as source
case $- in
	*i*) ;;
	*) return;;
esac

CFDIR=~/.config/bash

# Prompt
netns="[ $(ip netns identify) ] "
PS1='\[\033[03;32m\]\u\[\033[03;32m\]@\[\033[03;32m\]\h\[\033[00m\]:\[\033[00;34m\]\w\[\033[00m\]\$ '

source $CFDIR/bind.bash
source $CFDIR/prog.bash
source $CFDIR/conf.bash
source $CFDIR/ali.bash
source $CFDIR/func.bash
source $CFDIR/vars.bash
source $CFDIR/path.bash

 
# Banner
figlet Welcome | lolcat
echo "Path ~"
echo $PATH | sed -r -e "s/:/\n/g" | grep anubi | sed -r "s|/home/anubi/(.*)|~> ~/\1|"

source $CFDIR/xstart.bash

