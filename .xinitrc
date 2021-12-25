exec i3
xset +fp /home/anubi/.local/share/fonts
xset fp rehash

[[ -f ~./xmodmap ]] && xmodmap .xmodmap
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
