#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# Autostart X at login
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
	#echo "Seleccionar administrador de ventana"
	#OPCIONES=("i3" "gnome")
	#select op in "${OPCIONES[@]}"
	#do
		#case $op in
			#"i3"	) xinit i3; break;;
			#"gnome"	) xinit gnome-session; break;;
			#*       ) xinit i3; break;;
		#esac
	#done
fi

# Autostart Gnome-keyring
if [ -n "$DESKTOP_SESSION" ];then
    eval $(gnome-keyring-daemon --start)
    export SSH_AUTH_SOCK
fi
