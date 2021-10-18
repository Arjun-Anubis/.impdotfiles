exec i3

[[ -f ~./xmodmap ]] && xmodmap .xmodmap
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
