#!/bin/sh
# Merge xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Teclado latinoamericano para la interfaz gráfica
setxkbmap latam &

#Iniciar numlockx
numlockx &

#Inicio i3
exec i3
