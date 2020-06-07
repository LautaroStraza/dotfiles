#!/bin/sh
# Merge xresources
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

# Actualizo el PATH
export PATH="${PATH}:${HOME}/scripts"
export PATH="${PATH}:${HOME}/Programas"
export PATH="${PATH}:${HOME}/.local/bin"

# Variables de entorno para JR.
# Eliminar una vez que apruebe Introducción a la concurrencia!
export PATH=${PATH}:${HOME}/Programas/jdk8u242-b08/bin
export JR_HOME=${HOME}/Programas/jr
export PATH=${PATH}:${HOME}/Programas/jr/bin
export JRSH=/bin/bash
export CLASSPATH=.:${JR_HOME}/classes/jrt.jar:${JR_HOME}/classes/jrx.jar
#export DISPLAY=0.0

# Variables de entorno para el blog-django
export DJANGO_DBNAME=blog_database
export DJANGO_DBUSER=blog_user
export DJANGO_DBPASSWORD=FSlawliet1994

# Teclado latinoamericano para la interfaz gráfica
setxkbmap latam &

#Iniciar numlockx
numlockx &

#Inicio de windows managers
session=$1
export XDG_SESSION_TYPE=x11
export GDK_BACKEND=x11
#exec $1
exec gnome-session
#exec i3
