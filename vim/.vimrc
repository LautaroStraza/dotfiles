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

" Disable beeping.
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

syntax on           " Habilitar: syntax highlighting.
set number          " Habilitar: número de renglon.
set relativenumber  " Habilitar: números relativos de renglones.
set hlsearch        " Habilitar: resaltar palabras buscadas.
set incsearch       " Habilitar: resaltar buscado mientras escribo.
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
set encoding=utf-8

"------------"
" Re-mapping "
"------------"

" Cambio leader key de \ a <espacio>.
let mapleader =" "
" Recargar configuracion
nnoremap <leader>r :source ${HOME}/.vimrc<CR>
" Pone/Quita el resaltado en las busquedas
nnoremap <leader>h :set hlsearch!<CR>

" Copiar y pegar a xclipboard
"vnoremap <C-y> "*y :let @+=@*<CR>
"vnoremap <C-x> "*d :let @+=@*<CR>
"nnoremap <C-p> "+P

" Selección visual dentro de parentesis o corchetes.
nnoremap % v%

" Deshabilita las flechas dentro de <insert mode>.
nnoremap <Up>        <Nop>
nnoremap <Down>      <Nop>
nnoremap <Left>      <Nop>
nnoremap <Right>     <Nop>

" Remapeo para buffers.
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprev<CR>
nnoremap <leader>d :bdelete<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" Remapeo para moverme entre ventanas.
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Remapeo para plugins.
nnoremap <leader>i  :PluginInstall<CR>:bd<CR>
nnoremap <leader>t  :NERDTreeToggle<CR>
nnoremap <leader>g  :Goyo<CR>
nnoremap <F4>       <Esc>:call ToggleHardMode()<CR>

" Remueve espacios en blanco extras
" al final de cada linea al guardar
"                     el documento.
autocmd BufWritePre * %s/\s\+$//e

" Mostrar/Ocultar numero de lineas
nnoremap <F3>       :set nu! rnu!<CR>

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
" GENERALES
Plugin 'mboughaba/i3config.vim'
Plugin 'ervandew/supertab'
Plugin 'junegunn/goyo.vim'
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'wikitopian/hardmode'
Plugin 'tpope/vim-fugitive'
Plugin 'ycm-core/YouCompleteMe'
"Plugin 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
"Plugin 'davidhalter/jedi-vim'
Plugin 'kien/ctrlp.vim'

" COLOR THEME
"Plugin 'haishanh/night-owl.vim'
Plugin 'dylanaraps/wal.vim'

" MARKDOWN
"Plugin 'plasticboy/vim-markdown'
"Plugin 'suan/vim-instant-markdown', {'rtp': 'after'}

" LATEX
"Plugin 'xuhdev/vim-latex-live-preview'

" JAVA

" PYTHON
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'

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
" Open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if the only window left open is a NERDTree
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
"if (has("termguicolors"))
 "set termguicolors
"endif
"syntax enable
"colorscheme night-owl

" -- > dylanaraps/wal.vim
colorscheme wal

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

"-------------"
"  Lenguajes  "
"-------------"

" JR
aug javaJR_ft_detection
  au!
  au BufNewFile,BufRead *.jr set filetype=java
aug end


" PYTHON
" Remapeo para hacer ejecutable un script
nnoremap <F2> :!clear && python %<CR>

let python_highlight_all=1

" Cargar python-main Template
function PythonMain()
   :-1read ~/.vim/templates/python-main
endfunction

" Dews!
