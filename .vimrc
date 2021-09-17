syntax on
colorscheme slate

" Sets line numbers
set number

" Titles
set title

" set Tab to be 4 spaces wide
set tabstop=4
set shiftwidth=4
filetype plugin indent on

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" :W sudo saves the file 
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!
