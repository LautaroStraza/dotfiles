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


"------------"
" Re-mapping "
"------------"

" Cambio leader key de \ a <espacio>.
let mapleader =" "
" Recargar configuracion
map <leader>r :source ${HOME}/.vimrc<CR>

" Copiar y pegar a xclipboard
vnoremap <C-y> "*y :let @+=@*<CR>
vnoremap <C-x> "*d :let @+=@*<CR>
map <C-p> "+P

" Selección visual dentro de parentesis o corchetes.
noremap % v%

" Deshabilita las flechas dentro de <insert mode>.
map <Up>        <Nop>
map <Down>      <Nop>
map <Left>      <Nop>
map <Right>     <Nop>

" Remapeo para buffers.
map <leader>n :bnext<CR>
map <leader>p :bprev<CR>
map <leader>d :bdelete<CR>
map <leader>w :w<CR>
map <leader>q :q<CR>

" Remapeo para moverme entre ventanas.
map <C-k> <C-w>k
map <C-j> <C-w>j
map <C-h> <C-w>h
map <C-l> <C-w>l

" Remapeo para plugins.
map <leader>i :PluginInstall<CR>:bd<CR>
map <leader>t :NERDTreeToggle<CR>
map <leader>g :Goyo<CR>
map <leader>h <Esc>:call ToggleHardMode()<CR>

" Remueve espacios en blanco extras
" al final de cada linea al guardar
"                     el documento.
autocmd BufWritePre * %s/\s\+$//e

"---------------"
" Vundle Config "
"---------------"
set nocompatible              " be iMproved, required
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

"-------------------------"
" Agregar aca los Plugins "
"-------------------------"
Plugin 'haishanh/night-owl.vim'
Plugin 'mboughaba/i3config.vim'
Plugin 'ervandew/supertab'
Plugin 'junegunn/goyo.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'wikitopian/hardmode'
"Plugin 'plasticboy/vim-markdown'
"Plugin 'suan/vim-instant-markdown', {'rtp': 'after'}
"Plugin 'tpope/vim-fugitive'
"Plugin 'xuhdev/vim-latex-live-preview'


"---------------------------------"
" Finaliza la entrada de plugins "
"---------------------------------"
call vundle#end()            " required
filetype plugin indent on    " required

"--------------------------------"
" Configuraciones de los plugins "
"--------------------------------"
" ---> mboughaba/i3config.vim
aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

" ---> scrooloose/nerdtree && scrooloose/nerdtree
"autocmd vimenter * NERDTree
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" --> vim-airline/vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:powerline_pycmd = 'py3'
"let g:airline_powerline_fonts = 1
"vim-airline/vim-airline-themes
let g:airline_theme='dark_minimal'

" -- > wikitopian/hardmode
"Habilitar predeterminado
"autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

" -- > haishanh/night-owl.vim
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme night-owl

"plasticboy/vim-markdown
"let g:vim_markdown_folding_disabled = 1
"let g:vim_markdown_conceal = 0

"suan/vim-instant-markdown
"let g:instant_markdown_slow = 1
"let g:instant_markdown_autostart = 0
"let g:instant_markdown_autoscroll = 1


"Latex-live-preview
"let g:livepreview_previewer = 'evince'
"let g:livepreview_engine = 'pdflatex'

" Dews!
