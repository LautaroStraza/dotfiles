"##############################"
"      _                       "
"  ___| |_ _ __ __ _ ______ _  "
" / __| __| '__/ _` |_  / _` | "
" \__ \ |_| | | (_| |/ / (_| | "
" |___/\__|_|  \__,_/___\__,_| "
"                              "
"------------------------------"
"    Configuración - Vim       "
"                              "
"##############################"

"-------------"
" Basic setup "
"-------------"

"Disable beeping.
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

syntax on           " Habilitar: syntax highlighting.
set number          " Habilitar: número de renglon.
set relativenumber  " Habilitar: números relativos de renglones.
set hlsearch        " Habilitar: resaltar palabras buscadas.
set tabstop=4      	" Determina: cantidad de espacios de un caracter Tab.
set softtabstop=4
set shiftwidth=4  	" Determina: cantidad de espacios de una identación.
set expandtab       " Convierte los caracteres Tabs en espacios.
set smarttab        " Asigna shiftwidth o tabstop cuando corresponda.
set autoindent      " Habilita: la nueva linea mantiene el identado anterior.
set showmatch       " Show matching brackets.
set matchtime=5	    " Bracket blinking.
set history=50      " Habilita: historial de comandos.
set ruler           " Show the cursor position all the time.
set laststatus=2    " Always display the status line.
set hidden          " Configuración para poder ocultar buffers.
set wildmode=longest,list,full "Habilita el autocompletado de archivos.
