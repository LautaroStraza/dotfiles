#!/bin/sh
# Merge xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Actualizo el PATH
export PATH="${PATH}:~/scripts"

# Variables de entorno para JR.
# Eliminar una vez que apruebe Introducción a la concurrencia!
export PATH=${PATH}:${HOME}/Programas/jdk8u242-b08/bin
export JR_HOME=${HOME}/Programas/jr
export PATH=${PATH}:${HOME}/Programas/jr/bin
export JRSH=/bin/bash
export CLASSPATH=.:${JR_HOME}/classes/jrt.jar:${JR_HOME}/classes/jrx.jar
#export DISPLAY=0.0

# Teclado latinoamericano para la interfaz gráfica
setxkbmap latam &

#Iniciar numlockx
numlockx &

#Inicio i3
exec i3
