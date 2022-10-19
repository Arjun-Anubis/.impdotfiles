#!/bin/bash

pkill polybar
(cd ~/.config/polybar/ && echo $PWD && polybar main -c themes/gruvbox/config.ini &)
(sleep 0.5 && polybar-msg cmd hide)
