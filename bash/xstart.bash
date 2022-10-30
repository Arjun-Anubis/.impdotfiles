xserver="sway"
if [ $(tty) = "/dev/tty1" ]; then
	exec $xserver
fi

