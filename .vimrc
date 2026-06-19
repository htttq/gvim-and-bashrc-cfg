syntax on
set nu 
set cursorline
set cursorcolumn
set showmatch 
set hls
set tabstop=4 
set shiftwidth=4 
set autoindent  

set paste  

set guioptions-=T

set incsearch

colorscheme desert

set guifont=Monospace\ 14

if has("gui_running") && has("unix")
    set lines=999 columns=999
endif

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936 
set termencoding=utf-8
set encoding=utf-8 

set ruler  
