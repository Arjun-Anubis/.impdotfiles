xrdb -override ~/.Xresources
xset +fp /home/anubi/.local/share/fonts
xset fp rehash
/* [[ -f ~./xmodmap ]] && xmodmap .xmodmap */
/* exec i3 */
exec dbus-launch --autolaunch=$(cat /var/lib/dbus/machine-id) i3

