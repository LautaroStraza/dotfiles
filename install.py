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
paquetes = [
    'Graficos',
    'Gnome',
    'Escritorio-I3',
    'Vim-Tmux',
    'Utilidades',
]
programas = [
    'Vim',
    'Urxvt',
    'Tmux',
    'Xinit',
    'Bash',
    'I3',
    'Polybar',
    'Rofi',
    'Inputrc',
]
programas_de_aur = [
]
dic_programas = {
    'Graficos': ['xorg', 'xf86-video-intel', 'mesa', 'lib32-mesa', 'xf86-input-libinput', 'xorg-drivers', 'vulkan-intel'],
    'Gnome': ['gnome', 'gnome-extra', 'gdm'],
    'Escritorio-I3': ['i3'],
    'Vim-Tmux': ['vim', 'tmux'],
    'Utilidades': ['wget', 'git'],
}
configuraciones_disponibles = os.listdir()
configuraciones_disponibles.remove('.git')
configuraciones_disponibles.remove('install.py')
configuraciones_disponibles.remove('README.md')
configuraciones_disponibles.remove('mirrorlist')

servicios = {
    'gdm': ['enable', 'gdm.service'],
}

def instalar_configuracion(programas=None):
    if programas != None:
        for p in programas:
            if p in configuraciones_disponibles:
                print(f'Instalando configuracion de {p}')
                input('Continuar...')
                run(['stow', p])
        
            if p in servicios:
                # Habilito el servicio
                run(['sudo', 'systemctl'] + servicios[p])


def main():
    op = 0
    op_salida = len(paquetes) + len(programas)

    while op != op_salida:
        # Limpio la pantalla
        run('clear')

        # Imprimo el encabezado
        print("-- Configuraciones de Straza --")
        print("- Seleccionar configuraciones -")

        # Menu
        print()
        print('# PAQUETES #')
        for i, paquete in enumerate(paquetes):
            print(f'{i}- {paquete}')

        print()
        print('# PROGRAMAS #')
        for i, programa in enumerate(programas, len(paquetes)):
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

    #Se instalarán todas las configuraciones
        if op >= 0 and op < len(paquetes):
            para_instalar = []
            print('Se instalarán los siguientes programas:')
            for p in dic_programas[paquetes[op]]:
                print(p)
                para_instalar.append(p)
            #print(' '.join(para_instalar))
            run(['sudo', 'pacman', '-S', '--noconfirm'] + para_instalar)
            instalar_configuracion(para_instalar)
#           exito = instalar(programas[1:])
#
#            print('Se han instalado todas las configuraciones: ' + str(exito))
#            input('Continuar...')
#        else:
#            try:
#                seleccion = programas[op]
#            except IndexError as e:
#                print(e)
#                continue
#            else:
#                print('Se instalarán las configuraciones de ' + seleccion)
#                exito = instalar(seleccion)
#                print('Configuración de ' + seleccion + ' instalada con exito: ' + str(exito))
#                input('Continuar...')
#
# Llamada main
if __name__ == '__main__':
    main()
    print('Dews!')
