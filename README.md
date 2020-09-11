# Dotfiles - Straza
Archivos de configuraciones para los distintos programas que uso.

## Importantes
- Vim

## Dependencias
- Python3
- Stow

Habilitar los repositorios multilib
$ sudo nano /etc/pacman.conf
Descomentar las lineas
[multilib]
Include = /etc/pacman.d/mirrorlist

Y por último hay que actualizar
$ sudo pacman -Syyu

## Configuraciones disponibles
- Vim

## TODO
- Bspwm
- Tmux

## Instalación
Clonar el repositorio en $HOME y ejecutar el instalador.

```bash
$ git clone https://github.com/lautarostraza/dotfiles $HOME/dotfiles
$ cd $HOME/dotfiles
$ ./install.py
```
A continuación seleccionar la configuración que se quiere instalar.

## Recomendaciones
Como terminal uso *konsole*.

## Agradecimientos
Gracias a **Brandon Invergo** por la [idea](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html).
