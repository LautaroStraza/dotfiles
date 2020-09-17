#!/usr/bin/env python3
################################
#      _                       #
#  ___| |_ _ __ __ _ ______ _  #
# / __| __| '__/ _` |_  / _` | #
# \__ \ |_| | | (_| |/ / (_| | #
# |___/\__|_|  \__,_/___\__,_| #
#                              #
#------------------------------#
#       Configuraciones        #
#                              #
################################

from subprocess import run
import os

# Lista de programas
programas = [
    'Graficos',
    'Escritorio-Gnome',
    'Escritorio-I3',
    'Vim-Tmux',
    'Utilidades',
]
#programas = [
#    'Vim',
#    'Urxvt',
#    'Tmux',
#    'Xinit',
#    'Bash',
#    'I3',
#    'Polybar',
#    'Rofi',
#    'Inputrc',
#]
dic_programas = {
    'Graficos': ['xorg', 'xf86-video-intel', 'mesa', 'lib32-mesa', 'xf86-input-libinput', 'xorg-drivers', 'vulkan-intel'],
    'Escritorio-Gnome': ['gnome', 'gnome-extra', 'gdm'],
    'Escritorio-I3': ['i3', 'dmenu', 'rofi', 'polybar', 'rxvt-unicode', 'urxvt-perls', 'ttf-anonymous-pro', 'ranger', 'python-pywal', 'ttf-inconsolata', 'ttf-dejavu', 'noto-fonts', 'otf-inconsolata-lgc', 'nerd-fonts-inconsolata'],
    'Vim-Tmux': ['vim', 'tmux'],
    'Utilidades': ['wget', 'git', 'arandr', 'compton', 'network-manager-applet', 'joplin'],
}
programas_de_aur = [
        'polybar',
        'joplin', 
        'otf-inconsolata-lgc', 
        'nerd-fonts-inconsolata', 
]
configuraciones_disponibles = os.listdir()
print()
print('Configuraciones disponibles:')
print(configuraciones_disponibles)
servicios = {
    'gdm': ['enable', 'gdm.service'],
}

def instalar_configuracion(programas=None):
    if programas != None:
        for p in programas:
            if p in configuraciones_disponibles:
                #print(f'Instalando configuracion de {p}')
                #input('Continuar...')
                run(['stow', p])
        
            if p in servicios:
                # Habilito el servicio
                run(['sudo', 'systemctl'] + servicios[p])

def main():
    op = 0
    op_salida = len(programas)

    while op != op_salida:
        # Limpio la pantalla
        run('clear')

        # Imprimo el encabezado
        print("-- Configuraciones de Straza --")
        print("- Seleccionar configuraciones -")

        # Menu
        print()
        print('# PROGRAMAS #')
        for i, programa in enumerate(programas):
            print(f'{i}- {programa}')

        print()
        print(f'{op_salida}- Salir')

        #Leo el ingreso
        try:
            op = int(input('#--> '))
        except ValueError as e:
            print(e)
            continue

        # Condición de salida
        if op == op_salida:
            break

        #Instalar programas seleccioados
        if op >= 0 and op < len(programas):
            instalar_pacman = []
            instalar_aur = []
            print()
            print('Se instalarán los siguientes programas')
            for p in dic_programas[programas[op]]:
                if p in programas_de_aur:
                    instalar_aur.append(p)
                else:
                    instalar_pacman.append(p)
            print('Desde PACMAN')
            print(instalar_pacman)
            print('Desde AUR')
            print(instalar_aur)
            run(['sudo', 'pacman', '-S', '--noconfirm'] + instalar_pacman)
            run(['yay', '-S', '--noconfirm'] + instalar_aur)
            instalar_configuracion(instalar_pacman + instalar_aur)

# Llamada main
if __name__ == '__main__':
    main()
    print('Dews!')
