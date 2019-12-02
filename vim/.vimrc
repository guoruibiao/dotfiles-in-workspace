filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"Plugin 'Lokaltog/vim-powerline'
"Plugin 'klen/python-mode'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tomasr/molokai'
" 史上最难安装的插件之一YouCompleteMe
"Plugin 'Valloric/YouCompleteMe'
Plugin 'tmhedberg/SimpylFold'
"Plugin 'altercation/solarized'
Plugin 'hdima/python-syntax'
Plugin 'scrooloose/syntastic'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'jiangmiao/auto-pairs'
Plugin 'Townk/vim-autoclose'
"装一个go语言的插件
Plugin 'fatih/vim-go'
call vundle#end()
filetype plugin indent on
set nu!
" 自动化判断什么模式下使用什么主题
if has('gui_running')
    set background=dark
    colorscheme desert
else
    " molokai 配置原始背景色
    let g:molokai_original = 1
    set background=dark
    colorscheme molokai
endif
" 为vim-markdown插件添加format使用
let g:vim_markdown_frontmatter=1
" 为ultisnips添加触发器
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=["snippets", "bundle/ultisnips/UltiSnips"]
" 为Python语法提供高亮显示,根植于python-syntax
let python_highlight_all = 1
" 如果希望看到这代代码的文档字符串，就可以设置如下选项
let g:SimpylFold_docstring_preview=1

set encoding=utf-8
syntax on
syntax enable
set clipboard+=unnamed
"set background=dark
"colorscheme desert
set magic
set fo-=r

" 底部状态栏显示文件名，总行数，字符数
set laststatus=2 "长久显示：1
"文件格式之前需要添加%完成转义，空格，竖线等特殊字符需要使用斜杠\完成转义。
set statusline=[%F]\ %t\ %y\ format:\ %{&ff};\ [Column=%c,Row=%l]\ %p%%\ [Len=%L]


" vim-airline 设置特殊字体，如箭头等
if !exists('g:airline_symbols')                                                                                                                                             
    let g:airline_symbols = {}
endif
let g:airline_theme="molokai"
let g:airline_powerline_fonts = 1
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒' 
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'

"高亮显示tab，行尾结束符，空息
"set list listchars=tab:>.,trail:.,extends:#,nbsp:~
"highlight WhitespaceEOL ctermbg=green guibg=green
"match WhitespaceEOL /\s+$/
"  告诉vim在当前的目录下找不到tags文件的话，就到上层目录中去查找
set tags=tags;/
" 告诉VIM可以使用quickfix窗口显示cscope的查找列表
set cscopequickfix=s-,c-,d-,i-,t-,e-
if has("cscope")
    set csprg=/usr/local/bin/cscope
    set csto=1
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
endif

" 给cscope的关键命令添加快捷键支持
nmap <C-_>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d <C-R>=expand("<cword>")<CR><CR>

" 添加nerdtree插件支持，让VIM显示一个目录树
"nmap <silent>n :NERDTreeToggle<CR><CR>
"set ruler
set foldmethod=indent
set foldlevel=99
set cmdheight=2

set cursorline
set cursorcolumn
set tabstop=4
set shiftwidth=4
set softtabstop=4

set noautoindent
set nocindent
set fo-=r

set expandtab
set wrap

set wildmenu
set showmatch
set showcmd

set ignorecase
set nobackup
set noswapfile
set nowritebackup

set autowrite
set autoread
set hlsearch
set incsearch
set ignorecase
set smartcase

set nowrapscan
set nocompatible
set backspace=2

set mouse=c
set selection=exclusive
set selectmode=mouse,key
" 在上下移动光标时，光标的上方或者下放至少会保留显示的行数
set scrolloff=7

filetype plugin on
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" 配置VIM一间运行Python脚本
autocmd FileType python nnoremap <buffer> <F10> :w<CR>:!python3 %<CR>
" 配置另外的快捷键： <C-r>即Ctrl+r； <CR>代表Enter键； <S-r>即Shift+r; 如下，Ctrl+r一键运行当前python脚本
autocmd FileType python nnoremap <buffer> <C-r> :w<CR>:!python3 %<CR>
autocmd FileType php nnoremap <buffer> <F10> :w<CR>:!php %<CR>
autocmd FileType sh nnoremap <buffer> <F10> :w<CR>:!bash %<CR>
autocmd FileType go nnoremap <buffer> <F10> :w<CR>:!go run %<CR>
autocmd FileType c nnoremap <buffer> <F10> :w<CR>:!gcc % && ./a.out && rm a.out<CR>
autocmd FileType lua nnoremap <buffer> <F10> :w<CR>:!lua %<CR>
" 下面是自己玩的
" normal 状态下 Ctrl+d 删除一行
"nmap <C-d> dd 
" 括号自动补全
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
"inoremap < <><Esc>i
inoremap 《 《》<Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i
"""
" 测试一些自定义的快捷键
let mapleader = ';'
nmap <leader>w :w!<cr>
nmap <leader>q :q!<cr>
" 干掉方向键，强迫自己使用hjkl
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>
"""


" 给不同的文件填上不同的头
func! SetTitle()
    if &filetype == "python"
        call setline(1, "#!/usr/bin python")
        call append(line("."), "#coding:utf8")
        call append(line(".")+1, "\###############################################")
        call append(line(".")+2, "\# File Name: ".expand("%"))
        call append(line(".")+3, "\# Author: 郭 璞")
        call append(line(".")+4, "\# mail: marksinoberg@gmail.com")
        call append(line(".")+5, "\# Created Time: ".strftime("%c"))
        call append(line(".")+6, "\# Description: ")
        call append(line(".")+7, "\###############################################")
        call append(line(".")+8, "")
    elseif &filetype == "php"
        call setline(1, "<?php")
        call append(line("."), "require '/home/wwwroot/api.newtv.com/common/common.inc.php';")
        call append(line("")+1, "")
    elseif &filetype == "bash"
        call setline(1, "#!/usr/bin bash")
        call append(line("")+1, "")
    endif
    normal G
endfunc
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.py,*.java,*.php exec ":call SetTitle()"
function! SetEndLine()
    let lastlinenumber = a:lastline
    echom lastlinenumber
    let endline = "Edited by VIM at".strftime("%c")
    if &filetype == "python"
        let str = "# ".endline
    elseif &filetype == "php"
        let str = "// ".endline
    endif
    call append(lastlinenumber, str)
endfunction
"autocmd BufWritePre *.py,*.php exec ":call SetEndLine()"
