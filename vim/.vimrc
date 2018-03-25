filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"Plugin 'Lokaltog/vim-powerline'
"Plugin 'klen/python-mode'
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
    colorscheme molokai
endif
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

filetype plugin on
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" 配置VIM一间运行Python脚本
autocmd FileType python nnoremap <buffer> <F10> :w<CR>:!python %<CR>
autocmd FileType php nnoremap <buffer> <F10> :w<CR>:!php %<CR>
