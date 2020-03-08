[TOC]


# 我的vimrc
## 运行环境
`windows10 1909`+[`gvim8.2`](https://github.com/vim/vim-win32-installer)+[`python38`](https://www.python.org/)
## 特征
+ 利用[`airline`](https://github.com/vim-airline/vim-airline)状态栏美化，[`vim-one`](https://github.com/rakr/vim-one)提供好看的语法高亮
+ 利用[`coc.nvim`](https://github.com/neoclide/coc.nvim)提供基于`LSP`的语义补全
+ 利用[`ale`](https://github.com/dense-analysis/ale)提供实时代码检查
+ 利用[`neofornat`](https://github.com/sbdchd/neoformat)进行代码格式化。其实[`coc.nvim`](https://github.com/neoclide/coc.nvim)集成了语法检查和代码格式化，但是个人觉得体验不佳，就把这两项功能分离开来。
+ 支持`c`,`c++`，`fortran`,`python`,`LaTeX`语言的补全，编译，运行。
## 插件安装
### 插件管理工具`vim-plug`
选择一个插件安装目录，在`gvim`里面输入`:version`命令，查看设置文件的目录。
这里选择`$HOME/vimfiles/autoload`然后去[`vim-plug`](https://github.com/junegunn/vim-plug)官网下载`plug.vim`文件，将其放入`$HOME/vimfiles/autoload`文件夹里面。
[![3zsKWq.png](https://s2.ax1x.com/2020/03/08/3zsKWq.png)](https://imgchr.com/i/3zsKWq)
例如
```vim
call plug#begin('$HOME/vimfiles/plugged') " 插件安装目录$HOME/vimfiles/plugged
Plug 'junegunn/vim-easy-align'  "github上插件地址
call plug#end()
```
### 其他插件
```vim
"----------------插件-------------------------"
call plug#begin('$HOME/vimfiles/plugged') 
Plug 'scrooloose/nerdcommenter' "注释
Plug 'junegunn/vim-easy-align'  "对齐
Plug 'dense-analysis/ale'   "语法检查
" use pre build
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }  "markdownpreview
Plug 'vim-airline/vim-airline'  "状态栏 
Plug 'vim-airline/vim-airline-themes'  
Plug 'rakr/vim-one'  "语法高亮
Plug 'joshdick/onedark.vim'   
Plug 'preservim/nerdtree',{'on':'NERDTreeFind'}  "文件树
Plug 'neoclide/coc.nvim', {'branch': 'release'}  "补全
Plug 'lervag/vimtex',{'for':'tex'}  "latex
Plug 'honza/vim-snippets'  "代码片段
Plug 'Yggdroot/indentLine'  "代码缩进参考线
Plug 'yianwillis/vimcdoc'  "中文帮助文档
Plug 'sbdchd/neoformat'  "格式化
call plug#end()
let g:plugged#enable_at_startup = 1 
"-------------------------------------------"
```
## 设置
### `vim`自身设置
```vim
set novb  " 取消响铃
set vb t_vb="<Esc>|0f"
au GuiEnter * set t_vb=
set backspace=2   "启用退格"
set nocompatible    " 设置不兼容VI
set nobackup  " 备份与缓存
set nowritebackup
set noundofile
set noswapfile
set softtabstop=4  " 统一缩进为4
set shiftwidth=4
set tabstop=4  
set autoindent    " 设置自动缩进.智能缩进
set smartindent   
set hlsearch      " 开启高亮显示结果
set incsearch   " 显示查找匹配过程
set cursorline  "高亮显示当前
set showmatch  " 高亮显示匹配的括号
set number  " 显示行号
set relativenumber  "相对行号
set mouse=a " 启用鼠标
set wrap  "自动折行
filetype indent on          " 针对不同的文件类型采用不同的缩进格式
filetype plugin on          " 针对不同的文件类型加载对应的插件
filetype plugin indent on
filetype on                 
set autoread                " 当文件在外部被修改，自动更新该文件
"let &pythonthreedll = 'D:/Software/Python/Python38-32/python38.dll'
set clipboard+=unnamed  " Vim 的默认寄存器和系统剪贴板共享

let mapleader="\\"   "Leader 快捷键
nmap <leader>v :tabnew<cr>:e $HOME/vimfiles/vimrc<cr>
nmap <leader>c :tabnew<cr>:e $HOME/vimfiles/coc-settings.json<cr>
nmap <leader>fp :let @+=expand('%')<cr>
map <C-s> :w<CR>  
imap <C-s> <ESC>:w<CR>a
vmap <C-s> <ESC>:w<CR>
nmap <leader>w :w<cr>
imap <leader>w <ESC>:w<cr>a
"切换buff"
nmap <leader>t :tabnew<cr>
nmap <leader>bn :bn<cr> 

```
### `gui`设置
```vim
syntax enable 
set syntax=on " 语法高亮
set background=dark        " for the light version
let g:one_allow_italics = 1 " I love italic for comments
colorscheme one 
" 标签页
 set showtabline=2          " 总是显示标签栏
set showcmd   " 状态栏显示目前所执行的指令
set laststatus=2 " 开启状态栏信息
set cmdheight=1    " 命令行的高度
set guifont=Consolas\ NF:h12 "gui字体"
"不显示工具/菜单栏
set guioptions-=T "工具栏
"set guioptions-=m "菜单栏
set guioptions-=L "左边滚动条
set guioptions-=r "右边滚动条
set guioptions-=b " 底部滚动条
set guioptions-=e " 使用内置 tab 样式而不是 gui
let g:airline_powerline_fonts = 1  "关于状态栏的配置
" 缺省自动匹配主题
let g:airline_theme='one' 
let g:airline#extensions#tabline#enabled = 1  " Air-line 显示上面的buffer tab
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#coc#enabled = 1 "coc
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're usin
```
### 编码设置
```vim
"Vim 在与屏幕/键盘交互时使用的编码(取决于实际的终端的设定)        
" 编码设置
set encoding=utf-8
set fileencodings=utf-8,cp936,gb2123
if has("win32")
	set fileencoding=utf-8
else
	set fileencoding=utf-8
endif
source $VIMRUNTIME/delmenu.vim  "解决菜单乱码
source $VIMRUNTIME/menu.vim
language messages zh_CN.utf-8  "解决consle输出乱码
```
### 插件和一些其他功能
```vim
"------------自动匹配括号---------------------"
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
autocmd Syntax html,vim inoremap < <lt>><Esc>i| inoremap > <c-r>=ClosePair('>')<CR>
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap } <c-r>=CloseBracket()<CR>
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>
function ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endf
function CloseBracket()
	if match(getline(line('.') + 1), '\s*}') < 0
		return "\<CR>}"
	else
		return "\<Esc>j0f}a"
	endif
endf
function QuoteDelim(char)
	let line = getline('.')
	let col = col('.')
	if line[col - 2] == "\\"
		return a:char
	elseif line[col - 1] == a:char
		return "\<Right>"
	else
		return a:char.a:char."\<Esc>i"
	endif
endf
"------------------------------------------"


" --------------编译、运行------------------"
func! CompileC()  " 编译C源文件
    exec "w"
    exec "!clang -Wall %"
endfunc
func! CompileCpp()  " 编译C++源文件
    exec "w"
    exec "!clang++ -Wall %"
endfunc
func! Compilefortran()  " 编译fortran源文件
    exec "w"
	exec "!gfortran -Wall %"
endfunc 
func! RunLua()  " 运行Lua源文件
    exec "w"
    exec "!lua %"
endfunc
func! RunPerl()  " 运行Perl源文件
    exec "w"
    exec "!perl %"
endfunc
func! RunPython()  " 运行Python源文件
    exec "w"
    exec "!python %"
endfunc
func! CompileCode()  " 根据文件类型自动选择相应的编译函数
    exec "w"
    if &filetype == "c"
        exec "call CompileC()"
    elseif &filetype == "cpp"
        exec "call CompileCpp()"
    elseif &filetype == "fortran"
        exec "call Compilefortran()"
    elseif &filetype == "lua"
        exec "call RunLua()"
    elseif &filetype == "perl"
        exec "call RunPerl()"
    elseif &filetype == "python"
        exec "call RunPython()"
    endif
endfunc
func! RunResult()  " 运行可执行文件
    exec "w"
    if  &filetype == "c"
        exec "w"
        exec "!clang % -Wall -std=c99 -O2 -o %<.exe"
        exec "!start cmd /c  \"\"%<.exe\" & pause & del *.exe\""
    elseif &filetype == "cpp"
        exec "w"
        exec "!clang++ % -Wall -std=c++11 -O2 -o %<.exe"
        exec "!start cmd /c  \"\"%<.exe\" & pause & del *.exe\""
    elseif &filetype == "fortran"
        exec "w"
        exec "!gfortran % -Wall  -O2 -o %<.exe"
        exec "!start cmd /c  \"\"%<.exe\" & pause & del *.exe\""
    elseif &filetype == "lua"
        exec "!start cmd /c lua %<.lua & pause"
    elseif &filetype == "perl"
        exec "!start cmd /c perl %<.pl & pause"
    elseif &filetype == "python"
		exec "w"
        exec "!start cmd /c \"python  %<.py & pause\""
	elseif &filetype == "markdown"
		exec "w"
		exec "MarkdownPreview"
    endif
endfunc
" Ctrl + f5 一键保存、编译
map <C-f5> :call CompileCode()<CR>  
imap <C-f5> <ESC>:call CompileCode()<CR>
vmap <C-f5> <ESC>:call CompileCode()<CR>
" Ctrl + b 一键保存、运行
map <C-b> :call RunResult()<CR>    
imap <C-b> <ESC>:call RunResult()<CR>
vmap <C-b> <ESC>:call RunResult()<CR>
"-----------------------------------------"
```
### 完整的`vimrc`文件
完整的[`vimrc`](https://github.com/krisfans/vimfiles.git)

运行截图
![3zQvy6.png](https://s2.ax1x.com/2020/03/08/3zQvy6.png)