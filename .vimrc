" my vim settings
" Author: yuya aoki
"	and Fujie lab members

set number
set noswapfile
set cmdheight=2
set title
set wildmenu
set smartcase
set hlsearch
set background=dark
set incsearch
set whichwrap=b,s,h,l,<,>,[,]
set list
set listchars=tab:>-,extends:<,trail:-
set backspace=indent,eol,start
set tabstop=4

set runtimepath+=~/.vim/

autocmd BufNewFile *.py 0r $HOME/.vim/template/template.py
autocmd BufNewFile *.cpp 0r $HOME/.vim/template/template.cpp

nmap	<Leader>f [unite]

" put esc-key for delete highlight
nmap <silent> <Esc><Esc> :nohlsearch<CR>

if has('vim_starting')
   if &compatible
      set nocompatible               " Be iMproved
   endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif


" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

"NeoBundle 'tpope/vim-pathogen'
NeoBundle 'drillbits/nyan-modoki.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimproc'
NeoBundle 'supermomonga/vimshell-kawaii.vim'
NeoBundle 'Shougo/unite.vim'
"NeoBundle 'SHougo/neocomplete'
NeoBundle 'sjl/badwolf'

NeoBundle 'Shougo/vesting'


call neobundle#end()


" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


" Required:
filetype plugin indent on
"au BufRead,BufNewFile * if &ft=='python' |runtime! ~/.vim//userautoload/python.vim |endif
" runtime! userautoload/python.vim
"execute pathogen#infect()



"let g:noecomplete#enable_at_startup = 1
"let g:neocomplete#enable_ignore_case = 1
"let g:noecomplete#enable_smart_case = 1
"if !exists('g:neocomplete#keyword_patterns')
"	let g:neocomplete#keyword_patterns = {}
"endif
"let g:neocomplete#keyword_patterns._= '\h\w*'
"inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<s-TAB>"



"下の猫がうっとおしかったらこことNeoBundleの部分を消してください
set laststatus=2
set statusline=%F%m%r%h%w[%{&ff}]%=%{g:NyanModoki()}(%l,%c)[%P]
let g:nyan_modoki_select_cat_face_number = 2
let g:nayn_modoki_animation_enabled= 1

syntax on
colorscheme badwolf
highlight Normal ctermbg=none

" Jedi for python
NeoBundleLazy "davidhalter/jedi-vim", {
    \ "autoload": { "filetypes": [ "python", "python3", "djangohtml"] }}



NeoBundleLazy 'hynek/vim-python-pep8-indent'


