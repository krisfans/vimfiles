"----------------插件-------------------------"
call plug#begin('$HOME/vimfiles/plugged') 
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/vim-easy-align'
Plug 'dense-analysis/ale'
" use pre build
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
"状态栏的例子
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
Plug 'preservim/nerdtree',{'on':'NERDTreeFind'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
""Plug 'fannheyward/coc-texlab',{'for':'tex'}
Plug 'lervag/vimtex',{'for':'tex'}
Plug 'honza/vim-snippets'
Plug 'Yggdroot/indentLine'
Plug 'yianwillis/vimcdoc'
Plug 'rakr/vim-one'
Plug 'sbdchd/neoformat'
Plug 'majutsushi/tagbar'                           "浏览tag 
call plug#end()
let g:plugged#enable_at_startup = 1 
"-------------------------------------------"


"-----------------vim自身设置----------------"
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

"------------------------------------------"


"----------------Gui------------------------"
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
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
	if (has("nvim"))
		"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
		let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	endif
    "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
    "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
    " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
	if (has("termguicolors"))
		set termguicolors
	endif
endif
"-------------------------------------------"


"--------------------设置编码----------------" 
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
"--------------------------------------------"
  
 
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


"---------------vimtex设置---------------"
let g:tex_flavor  = 'latex'    
" "let g:vimtex_compiler_progname = 'nvr'
"正向搜索 
let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_view_general_options
    \ = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'
"反向搜索
let g:vimtex_view_general_options
    \ = '-reuse-instance -forward-search @tex @line @pdf'
    \ . ' -inverse-search "' . exepath(v:progpath)
    \ . ' --servername ' . v:servername
    \ . ' --remote-send \"^<C-\^>^<C-n^>'
    \ . ':execute ''drop '' . fnameescape(''\%f'')^<CR^>'
    \ . ':\%l^<CR^>:normal\! zzzv^<CR^>'
    \ . ':call remote_foreground('''.v:servername.''')^<CR^>^<CR^>\""'

let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
    \ 'background' : 1,
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'options' : [
    \   '-shell-escape',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \ }

let g:vimtex_compiler_latexmk_engines = {
    \ '_'                : '-xelatex',
    \ 'xelatex'          : '-xelatex',
    \ 'pdflatex'         : '-pdf',
    \ }
" 隐藏模式"
set conceallevel=1
let g:tex_conceal = 'mg'
"-------------------------------------------"


"--------------coc 设置---------------------"
hi CocFloating guifg=Gray
nmap <leader>ff :Neoformat<cr> 
set updatetime=200
" diagnostics appear/become resolved.
set signcolumn=yes
" Use `[g` and `]g` to navigate diagnostics
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" TextEdit might fail if hidden is not set.
set hidden
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
nmap <leader>s :CocCommand snippets.openSnippetFiles<cr>
"-----------------------------------------"


"-----------Nerd Tree 文件树--------------"
"autocmd vimenter * NERDTree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"let NERDChristmasTree=0
"let NERDTreeWinSize=30
"let NERDTreeChDirMode=2
"let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
"" let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
"let NERDTreeShowBookmarks=1
let NERDTreeWinPos = "left"
"let NERDTreeAutoDeleteBuffer=1
let NERDTreeShowHidden=1
nmap <f4> :NERDTreeFind<CR> 
nmap <f3> :NERDTreeToggle<CR> 
"----------------------------------------"


"---------------ale---------------------"
" Always show the signcolumn, otherwise it would shift the text each time
let g:ale_sign_column_always = 1 
"keep the sign gutter open
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_lint_on_text_changed = 'always'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1   " use quickfix list instead of the loclist
nmap <leader>ep <Plug>(ale_previous_wrap)
nmap <leader>en <Plug>(ale_next_wrap)
"<Leader>d查看错误或警告的详细信息
nmap <Leader>ed :ALEDetail<CR>  
"------------------------------------"


"---------------comment--------------"
nmap <leader>/ <plug>NERDCommenterToggle
vmap <leader>/ <plug>NERDCommenterToggle

"-----------------------------------"

"---------markdown-preview--- ------"
"let g:mkdp_browser = 'D:/Software/Mozilla Firefox/firefox.exe'
"----------------------------------"


"--------------tagbar--------------"
nmap <F5> :TagbarToggle<CR>
"----------------------------------"
