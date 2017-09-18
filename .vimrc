execute pathogen#infect()
execute pathogen#helptags()

filetype plugin indent on
syntax on

set t_Co=256                    " set terminal color range
set background=dark
colorscheme zenburn

set number
set numberwidth=4

set wrap                        " okay, I don't know how to explain this in English- -
set shiftround              	" round indent to multiple of shiftwidth to make the indent just you want, instead of a stable number
set showmatch	        	" high light the matched bracket
set matchtime=1                 " set matchtime=100ms
set encoding=utf-8              " set the character encode inside vim
set fileformat=unix
set splitbelow                  " splitting a window will put the new window below the current one
set splitright                  " similar to splitbelow, right to the current one

set expandtab                   " change tab to space
set tabstop=4
set shiftwidth=4
set softtabstop=4
set backspace=indent,eol,start  " same as set backspace=2


set laststatus=2                " always show the statusline

set timeout ttimeout timeoutlen=300 ttimeoutlen=10

"set my leader key
let mapleader = "-"
"set my localleader
let maplocalleader = "\\"

highlight MatchParen cterm=none ctermbg=red ctermfg=black

autocmd BufRead,BufNewFile *.py let python_highlight_all=1

" Status Line settings ------------------------{{{
set statusline=%<%f             " Path to the file
set statusline+=\ -\            " separetor
set statusline+=%y              " Filetype
set statusline+=%m              " Modified?
set statusline+=%r              " read only?
set statusline+=%=              " switch to the right side
set statusline+=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k
set statusline+=%-14.(%l,%c%V%)  " show line and column & virtual column
set statusline+=\ %P            " show percent
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
" }}}


" Python file settings ------------------------{{{
augroup filetype_python
    autocmd!
    autocmd filetype python     iabbrev <buffer> iff if:<left>
    autocmd filetype python     iabbrev <buffer> ifn if<space>__name__<space>==<space>'__main__':
augroup END
    autocmd filetype python nnoremap <silent> <F5> :!clear;python %<CR>
    " autocmd filetype python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>
" }}}

" ctags -------------{{{
"
set tags=tags;  " 必须要有 `;`
set autochdir

" }}}

" cscope -------------{{{
"
if filereadable("cscope.out")
    cs add cscope.out
endif

if has("cscope")
    set cscopetag   " 使支持用 Ctrl+]  和 Ctrl+t 快捷键在代码间跳来跳去
    " check cscope for definition of a symbol before checking ctags:
    " set to 1 if you want the reverse search order.
    set csto=1

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add the database pointed to by environment variable
    elseif $CSCOPE_DB !=""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose

    nmap <C-/>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-/>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-/>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-/>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-/>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-/>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-/>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-/>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif

" }}}

" taglist -------------{{{
"
nnoremap <silent> <F8> :TlistToggle<CR><CR>
inoremap <silent> <F8> :TlistToggle<CR><CR>
let Tlist_Show_One_File=0                    " 只显示当前文件的tags
let Tlist_Exit_OnlyWindow=1                  " 如果Taglist窗口是最后一个窗口则退出Vim
let Tlist_Use_Right_Window=1                 " 在右侧窗口中显示
let Tlist_File_Fold_Auto_Close=1             " 自动折叠

" }}}

" vim-markdown -------------{{{
let g:vim_markdown_folding_disabled = 1

" }}}

" nerdtree -------------{{{
map <C-n> :NERDTreeToggle<CR>
" Start NERDTree
" autocmd VimEnter * NERDTree
" Go to previous (last accessed) window.
autocmd VimEnter * wincmd p

" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" close vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" }}}

" Custom Mapping -------------{{{
" set a <esc> abbreviation key
inoremap jk <esc>

" remap 'H' & 'L'
nnoremap H ^
nnoremap L $
nnoremap yg vg_y
nnoremap U viwU

nnoremap <C-a> ggVG

vnoremap ` di``<esc>P
vnoremap " di""<esc>P
vnoremap ' di''<esc>P
vnoremap * di**<esc>P
vnoremap ( di()<esc>P
vnoremap [ di[]<esc>P
vnoremap < di<><esc>P
vnoremap {} di{}<esc>P
vnoremap $ di$$<esc>P
vnoremap $$ di$$$$<left><esc>P
vnoremap _ di__<esc>P
vnoremap ~ di~~<esc>P


vnoremap <space> di<space><space><esc>P


" open .vimrc in a vertical split window instantly
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
" source $MYVIMRC
nnoremap <leader>sv :source $MYVIMRC<cr>

" }}}
