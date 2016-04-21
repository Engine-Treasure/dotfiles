
" __author__ = \"Engine\"
" __date__   = 2016-04-01

" Basic Settings -------------{{{
" I use pathogen to manage my vim plugins, so add this command above all other commands to make all plugins work well.
execute pathogen#infect()

" Boolean Options
set number           			" set number on
set numberwidth=4               
set wrap                        " okay, I don't know how to explain this in English- -
set shiftround              	" round indent to multiple of shiftwidth to make the indent just you want, instead of a stable number
set showmatch	        		" high light the matched bracket
set matchtime=1                 " set matchtime=100ms
set encoding=utf-8              " set the character encode inside vim
filetype indent on              " 
set expandtab                   " change tab to space
set tabstop=4                   " 
set shiftwidth=4
set softtabstop=4
set laststatus=2                " always show the statusline
set foldlevelstart=0

syntax enable                   " the following commands are set for solarized, the colorscheme
set background=dark
" let g:solarized_termcolors=256
set t_Co=256
" colorscheme solarized
colorscheme evening

"set my leader key
let mapleader = "-"
"set my localleader
let maplocalleader = "\\"
" }}}

" emmet.vim settings -------------------------------{{{

let g:user_emmet_mode = "inv"   " enable all functions in all mode.
" enable just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"}}}

" Status Line settings ------------------------{{{
set statusline=%<%f             " Path to the file
set statusline+=\ -\            " separetor
set statusline+=%y              " Filetype
set statusline+=%m              " Modified?
set statusline+=%r              " read only?
set statusline+=%=              " switch to the right side
set statusline+=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k                           " okay, I copy this from web,showing the fileencoding
set statusline+=%-14.(%l,%c%V%)  " show line and column & virtual column
set statusline+=\ %P            " show percent
" }}}

" Python file settings ------------------------{{{
augroup filetype_python
    autocmd!
    autocmd filetype python     nnoremap <buffer> <localleader>c I#<esc>
    autocmd filetype python     iabbrev  <buffer>  ptt   #!/usr/bin/env python3<cr># -*- coding: utf-8 -*-<cr><cr>''<cr><cr>__author__ = 'Engine'
    autocmd filetype python     iabbrev <buffer> iff if:<left>
    autocmd filetype python     iabbrev  <buffer>  ifn if<space>__name__<space>==<space>'__main__':<cr>
augroup END
" }}}

" JavaScript file settings ------------------------{{{
augroup filetype_js
    autocmd!
    autocmd filetype javascript nnoremap <buffer> <localleader>c I//<esc>
    autocmd filetype javascript iabbrev <buffer> iff if ()<left>
augroup END
" }}}

" shell file settings ------------------------{{{
augroup filetype_shell
    autocmd!
    autocmd filetype shell nnoremap <buffer> <localleader>c I#<esc>
augroup END
" }}}

" markdown file settings ------------------------{{{
augroup filetype_markdown
    autocmd!
    "autocmd filetype markdown   colorscheme default 
    autocmd filetype markdown   inoremap <buffer> <localleader>/ <esc>I><space><esc>A
    autocmd filetype markdown   inoremap <buffer> <localleader>bb ****<left>
    autocmd filetype markdown   inoremap <buffer> <localleader>ii **<left>
    autocmd filetype markdown   inoremap <buffer> <localleader>`` ``<left>

    
    autocmd filetype markdown   onoremap <buffer> ih1 :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
    autocmd filetype markdown   onoremap <buffer> ah1 :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rg_vk0"<cr>
    autocmd filetype markdown   onoremap <buffer> ih2 :<c-u>execute "normal! ?^--\\+$\r:nohlsearch\rkvg_"<cr>
    autocmd filetype markdown   onoremap <buffer> ah2 :<c-u>execute "normal! ?^--\\+$\r:nohlsearch\rg_vk0"<cr>
    autocmd filetype markdown   iabbrev  <buffer> mdtt ---<cr>layout:<tab><tab>post<cr>title:<cr>subtitle:<cr>date:<cr>author:<cr>header-img:<cr>tas:<cr><tab>-<space><cr>---

augroup END
" }}}

" html,css file settings ------------------------{{{
augroup filetype_html
    autocmd!
    " close the block
    auto filetype html nnoremap <buffer> <localleader>f Vatzf
    
augroup END
" }}}

" Vimscript file settings ------------------------{{{
augroup filetype_vim
    autocmd!
    autocmd filetype vim setlocal foldmethod=marker
augroup END
" }}}

" Mappings ---------------------------------------{{{
" move down the current line
map <leader>- ddp
" move up the current line
" there's a bug: if the current line is the first line, the command will just delete it. 
map <leader>_ ddkP
" when insert, press Ctrl-u to Up the finished word
inoremap <leader><c-u> <esc>viwUea
" when normal, press Ctrl-u to Up the selected word
nnoremap <leader><c-u> viwU
" open .vimrc in a vertical split window instantly
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" source $MYVIMRC
nnoremap <leader>sv :source $MYVIMRC<cr>
" add \"" or '' to a selected word
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
" add \"" or \\ to the finished word
inoremap <leader>' '<esc>hbi'<esc>lela
inoremap <leader>" "<esc>hbi"<esc>lela
" Upper the word's first letter
nnoremap <leader>u viwbU
" remap 'H' & 'L'
nnoremap H 0
nnoremap L $
" set a <esc> abbreviation key
inoremap jk <esc> 
inoremap :: <esc>
inoremap (     ()<left>
inoremap ()    ()
inoremap ))     <right>
inoremap {     {}<left>
inoremap }}      <right>
inoremap [     []<left>
inoremap ]]      <right>
inoremap <     <><left>
inoremap >>     <right>
inoremap ""    ""<left>

onoremap in( :<c-u>normal! f(vi(<cr>
onoremap ip( :<c-u>normal! F)vi(<cr>
onoremap in" :<c-u>normal! f"vi(<cr>
onoremap ip" :<c-u>normal! F"vi(<cr>
onoremap in{ :<c-u>normal! f{vi(<cr>
onoremap ip} :<c-u>normal! F}vi(<cr>
onoremap in[ :<c-u>normal! f[vi(<cr>
onoremap ip] :<c-u>normal! F]vi(<cr>
onoremap in' :<c-u>normal! f'vi(<cr>
onoremap ip' :<c-u>normal! F'vi(<cr>
"onoremap in@ :<c-u>execute "normal! /*@*.com\rBviw"<cr>
" }}}

" Abbreviations ------------------{{{
" make abbreviation for my email address
iabbrev @@ enginechen07@gmail.com
" make others abbreviaionts
iabbrev js JavaScript
" }}}
