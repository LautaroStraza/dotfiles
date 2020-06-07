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

# Lista de programas
programas = ['Todos', 'Vim', 'Urxvt', 'Tmux', 'Xinit', 'Bash', 'I3', 'Polybar', 'Rofi', 'Inputrc']

from subprocess import run

def instalar(programa=None):
    if(programa != None):
        if(isinstance(programa, list)):
            for p in programa:
                run(['stow', p.lower()])
        else:
            run(['stow', programa.lower()])
        return True
    else:
        return False

def main():
    op = 0
    while (op != len(programas)):
        # Limpio la pantalla
        run('clear')

        # Imprimo el encabezado
        print("-- Configuraciones de Straza --")
        print("- Seleccionar configuraciones -")

        # Menu
        for i, programa in enumerate(programas):
            print(str(i)+'- '+ programa)
        print(str(len(programas))+'- Salir')

        #Leo el ingreso
        try:
            op = int(input('#--> '))
        except ValueError as e:
            print(e)
            continue

        # Condición de salida
        if(op == len(programas)):
            break

	#Se instalarán todas las configuraciones
        if(op == 0):
            for p in programas[1:]:
                print('Se instalarán las configuraciones de ' + p)

            exito = instalar(programas[1:])

            print('Se han instalado todas las configuraciones: ' + str(exito))
            input('Continuar...')
        else:
            try:
                seleccion = programas[op]
            except IndexError as e:
                print(e)
                continue
            else:
                print('Se instalarán las configuraciones de ' + seleccion)
                exito = instalar(seleccion)
                print('Configuración de ' + seleccion + ' instalada con exito: ' + str(exito))
                input('Continuar...')

# Llamada main
if __name__ == '__main__':
    main()
    print('Dews!')
