"scriptencoding utf-8
set encoding=utf-8
"----------------插件-------------------------"{{{
call plug#begin('$HOME/.cache/vim/plugins') 
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" 关闭buffer而不关闭窗口
Plug 'rbgrouleff/bclose.vim', {'on': 'Bclose'}
"UI" 查看启动时间
Plug 'dstein64/vim-startuptime', {'on':'StartupTime'}
"Plug 'itchyny/lightline.vim'
"Plug 'mengelbrecht/lightline-bufferline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhinz/vim-startify'
Plug 'ryanoasis/vim-devicons' 
Plug 'rakr/vim-one'
Plug 'mhartington/oceanic-next'
Plug 'liuchengxu/space-vim-theme'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'
"文件树和图标
Plug 'Shougo/defx.nvim' 
Plug 'kristijanhusak/defx-icons'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

Plug 'https://gitee.com/krisfan_zhang/coc.nvim.git', {'branch': 'release'}
Plug 'Yggdroot/LeaderF', { 'do': '.\install.bat' }
"Plug 'dense-analysis/ale'
Plug 'neomake/neomake'
Plug 'lervag/vimtex',{'for':'tex'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } , 'for': ['markdown', 'vim-plug']}
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'
Plug 'yianwillis/vimcdoc'
Plug 'sbdchd/neoformat'
Plug 'octol/vim-cpp-enhanced-highlight',{'for':['c','cpp']}
Plug 'machakann/vim-highlightedyank'
Plug 'elzr/vim-json'
Plug 'vim-scripts/gnuplot-syntax-highlighting'
Plug 'vim-python/python-syntax'
call plug#end()
let g:plugged#enable_at_startup = 1 "}}}


"-----------------vim自身设置----------------"{{{
set novb                  " 取消响铃
set vb t_vb="<Esc>|0f"
au GuiEnter * set t_vb=
set backspace=2           " 启用退格"
set nocompatible          " 设置不兼容VI
set nobackup              " 备份与缓存
set nowritebackup
set noundofile
set noswapfile
set softtabstop=4         " 统一缩进为4
set shiftwidth=4
set tabstop=4  
set autoindent            " 设置自动缩进.智能缩进
set smartindent   
set hlsearch              " 开启高亮显示结果
set incsearch             " 显示查找匹配过程
set cursorline            " 高亮显示当前
set ignorecase            " 设置默认进行大小写不敏感查找
set smartcase             " 如果有一个大写字母，则切换到大小写敏感查找
set showmatch             " 高亮显示匹配的括号
set number                " 显示行号
set relativenumber        " 相对行号
set mouse=a               " 启用鼠标
set wrap                  " 自动折行
set shortmess+=c		  " Avoid showing message extra message when using completion
filetype indent on        " 针对不同的文件类型采用不同的缩进格式
filetype plugin on        " 针对不同的文件类型加载对应的插件
filetype plugin indent on
filetype on                 
set autoread              " 当文件在外部被修改，自动更新该文件
set foldmethod=marker     "折叠方式为缩进，自动保存折叠
au BufWinLeave vimrc mkview
au BufWinEnter vimrc silent loadview
if has("autocmd")         " 跳转到上次打开的位置
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | 
endif
if has('clipboard')
	if has('unnamedplus') " When possible use + register for copy-paste
		set clipboard=unnamed,unnamedplus
	else                  " On mac and Windows, use * register for copy-paste
		set clipboard=unnamed
	endif
endif
"set clipboard+=unnamed  " Vim 的默认寄存器和系统剪贴板共享
"set pythonthreedll=C:\Users\qiaod\AppData\Local\Programs\Python\Python36-32\python36.dll
"set pythonthreehome=~\AppData\Local\Programs\Python\Python38
"set pythonthreedll=~\AppData\Local\Programs\Python\Python38\python38.dll
let g:python3_host_prog = expand('D:\Software\Python38-32\python.exe')
let g:python_highlight_all = 1
let mapleader=" "  "leader 快捷键
nnoremap <leader>v :tabnew<cr>:e $HOME/vimfiles/vimrc<cr>
nnoremap <leader>c :tabnew<cr>:e $HOME/vimfiles/coc-settings.json<cr>
nnoremap <leader>fp :let @+=expand('%')<cr>
nnoremap <leader>fe :set fileencoding=utf8<cr>
nnoremap ;p o<ESC>p
nnoremap <C-s> :w<CR>  
imap <C-s> <ESC> :w<CR>a
vmap <C-s> <ESC> :w<CR>
nnoremap <leader>w :w<cr>
"切换buff"
nnoremap <leader>t :tabnew<cr>
nnoremap q :close<cr>
nnoremap ct :tabclose<cr>
nnoremap <leader>bn :bn<cr> 
" 删除当前缓冲区
nnoremap <leader>bd :bdelete %<cr>  
nnoremap R :source $MYVIMRC<cr>
"autocmd FileType json syntax match Comment +\/\/.\+$+
nnoremap ;a ggVG  
nnoremap x "_x
vnoremap x "_x
nnoremap X "_X
vnoremap X "_X
" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
noremap su :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
noremap se :set splitbelow<CR>:split<CR>
noremap sn :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
noremap si :set splitright<CR>:vsplit<CR>
noremap wd :pwd<cr>
" 重命名
command! -nargs=1 Rename let tpname = expand('%:t') | saveas <args> | edit <args> | call delete(expand(tpname))
autocmd BufNewFile,Bufread *.latexmkrc set filetype=perl
"}}}


"----------------Gui------------------------"{{{
let g:vim_json_syntax_conceal = 0

" 标签页
set showtabline=2            " 总是显示标签栏
set showcmd                  " 状态栏显示目前所执行的指令
set laststatus=2             " 开启状态栏信息
set cmdheight=1              " 命令行的高度
set guifont=Consolas\ NF:h12 " gui字体
" 不显示工具/菜单栏
set guioptions-=T            " 工具栏
" set guioptions-=m          " 菜单栏
set guioptions-=L            " 左边滚动条
set guioptions-=r            " 右边滚动条
set guioptions-=b            " 底部滚动条
set guioptions-=e            " 使用内置 tab 样式而不是 gui
let g:airline_powerline_fonts = 1  "关于状态栏的配置
""let g:airline_left_sep =  "\u25ba"
let g:airline_left_alt_sep = ''
""let g:airline_right_sep = "\u25e2"
let g:airline_right_alt_sep = ''
let g:airline#extensions#whitespace#enabled  = 0
let g:airline#extensions#searchcount#enabled = 1
let g:airline#extensions#localsearch#enabled = 1 " enable/disable localsearch indicator integration >
let g:airline#extensions#tabline#enabled     = 1    " Air-line 显示上面的buffer tab
let g:airline#extensions#neomake#enabled = 1
let g:airline#extensions#coc#enabled         = 1    " coc
let g:airline#extensions#wordcount#filetypes = ['asciidoc', 'help', 'mail', 'markdown', 'org', 'plaintex', 'rst', 'tex', 'text']
"Use ['all'] to enable for all filetypes.
if (empty($TMUX))
	if (has("nvim"))
		"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
		let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	endif
	if (has("termguicolors"))
		set termguicolors
	endif
endif
syntax enable 
syntax on " 语法高亮

set background=dark " for the light version
let g:one_allow_italics = 1 " I love italic for comments
let g:gruvbox_italic    = 1
colorscheme one
"}}}


"--------------------设置编码----------------" {{{{{{
set encoding=utf-8             " Vim 在与屏幕/键盘交互时使用的编码(取决于实际的终端的设定)
set fileencodings=utf-8,cp936,gb2123
source $VIMRUNTIME/delmenu.vim " 解决菜单乱码
source $VIMRUNTIME/menu.vim
language messages zh_CN.utf-8  " 解决consle输出乱码}}}}}}


"----------------格式化--------------------"
let g:neoformat_tex_latexindent = {
			\ 'exe':   'latexindent',
			\ 'args':  ['-l'],
			\ 'stdin': 1
			\ }
nnoremap ff :Neoformat<cr>


"% 当前完整的文件名
"%:h 文件名的头部，即文件目录.例如../path/test.c就会为../path
"%:t 文件名的尾部.例如../path/test.c就会为test.c
"%:r 无扩展名的文件名.例如../path/test就会成为test
"%:e 扩展名
"%    当前文件名
"%:h    文件名的头部.例如../path/test.c就会为../path
"%:t    文件名的尾部.例如../path/test.c就会为test.c
"%:r    无扩展名的文件名.例如../path/test就会成为test
"%:e    扩展名

""--编译、运行--{{{{{{
func! CompileC()       " 编译C源文件
    exec "w"
    exec "!clang -Wall %"
endfunc
func! CompileCpp()     " 编译C++源文件
    exec "w"
    exec "!clang++ -Wall %"
endfunc
func! Compilefortran() " 编译fortran源文件
    exec "w"
    exec "!gfortran -Wall %"
endfunc 
func! CompileTex()     " 编译fortran源文件
    exec "w"
    exec ":VimtexCompile"
endfunc 
func! RunLua()         " 运行Lua源文件
    exec "w"
    exec "!lua %"
endfunc
func! RunPerl()        " 运行Perl源文件
    exec "w"
    exec "!perl %"
endfunc
func! RunPython()      " 运行Python源文件
    exec "w"
    exec "!python %"
endfunc
func! CompileCode()    " 根据文件类型自动选择相应的编译函数
    exec "w"
    if &filetype == "c"
        exec "call CompileC()"
    elseif &filetype == "cpp"
        exec "call CompileCpp()"
    elseif &filetype == "fortran"
        exec "call Compilefortran()"    
    elseif &filetype == "tex"
        exec "call CompileTex()"
    elseif &filetype == "lua"
        exec "call RunLua()"
    elseif &filetype == "perl"
        exec "call RunPerl()"
    elseif &filetype == "python"
        exec "call RunPython()"
    endif
endfunc
func! RunResult()  " 先保存，再格式化，最后运行可执行文件
    exec "w"
    if  &filetype == "c"
        exec "!clang % -Wall -std=c99 -O2 -o %<.exe"
        exec "!start cmd /c  \"\"%<.exe\" & pause & del %:r.exe\""
    elseif &filetype == "cpp"
        exec "!clang++ % -Wall -std=c++11 -O2 -o %<.exe"
        exec "!start cmd /c  \"\"%<.exe\" & pause & del %:r.exe\""
    elseif &filetype == "tex"
        exec ":VimtexCompile"
    elseif &filetype == "fortran"
        exec "!gfortran % -Wall  -O2 -o %<.exe"
        exec "!start cmd /c  \"\"%<.exe\" & pause & del %r:.exe\""
    elseif &filetype == "lua"
        exec "!start cmd /c lua %<.lua & pause"
    elseif &filetype == "perl"
        exec "!start cmd /c perl %<.pl & pause"
    elseif &filetype == "python"
        exec "Neoformat"
        exec "!start cmd /c \"python  %<.py & pause\""
    elseif &filetype == "markdown"
        exec "MarkdownPreview"
    elseif &filetype == "gnuplot"
        exec "!start cmd /c  \"gnuplot % & pause \""
        exec "!pause"
    endif
endfunc
" Ctrl + f5 一键保存、编译
nnoremap <C-f5> :call CompileCode()<CR>  
imap <C-f5> <ESC>:call CompileCode()<CR>
vmap <C-f5> <ESC>:call CompileCode()<CR>
" Ctrl + b 一键保存、运行
nnoremap <C-b> :call RunResult()<CR>    
imap <C-b> <ESC>:call RunResult()<CR>
vmap <C-b> <ESC>:call RunResult()<CR>
"}}}}}}


"------对齐-----------"
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nnoremap ga <Plug>(EasyAlign)


"---------------vimtex设置---------------"{{{
au Filetype tex let g:AutoPairs['$']='$'
let g:tex_flavor  = 'latex'    
let g:vimtex_view_general_options_latexmk = '-reuse-instance'

let g:vimtex_imaps_disabled = []    " Disable \alpha and \beta mappings
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
			\ 'background': 1,
			\ 'build_dir': '',
			\ 'callback': 1,
			\ 'continuous': 0,
			\ 'executable': 'latexmk',
			\ 'options': [
			\   '-shell-escape',
			\   '-file-line-error',
			\   '-synctex=1',
			\   '-interaction=nonstopmode',
			\ ],
			\ }
let g:vimtex_compiler_latexmk_engines = {
			\ '_'        : '-xelatex',
			\ 'xelatex'  : '-xelatex',
			\ 'pdflatex' : '-pdf',
			\ }
" 隐藏模式"
set conceallevel=0
let g:tex_conceal = ''
let g:vimtex_syntax_conceal_default = 0
"}}}


"--------------coc 设置---------------------"{{{
set updatetime=200
" diagnostics appear/become resolved.
"set signcolumn=yes
if has("patch-8.1.1564")
	" Recently vim can merge signcolumn and number column into one
	set signcolumn=number
else
	set signcolumn=yes
endif
" Use `[g` and `]g` to navigate diagnostics
"nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
"nnoremap <silent> ]g <Plug>(coc-diagnostic-next)
" Symbol renaming.
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	elseif (coc#rpc#ready())
		call CocActionAsync('doHover')
	else
		execute '!' . &keywordprg . " " . expand('<cword>')
	endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <leader>a  :<C-u>CocList diagnostics<cr>
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
nnoremap <leader>s :CocCommand snippets.openSnippetFiles<cr>
"nnoremap <space>o :CocList --normal outline<cr>

" popup  coc-translator
" NOTE: do NOT use `nore` mappings
" popup
nmap tp <Plug>(coc-translator-p)
vmap tp <Plug>(coc-translator-pv)
" echo
nmap te <Plug>(coc-translator-e)
vmap te <Plug>(coc-translator-ev) 
"}}}



"-----------defx文件树--------------"{{{
call defx#custom#option('_', {
			\ 'winwidth'           : 30,
			\ 'split'              : 'vertical',
			\ 'direction'          : 'topleft',
			\ 'show_ignored_files' : 1,
			\ 'buffer_name'        : '',
			\ 'toggle'             : 1,
			\ 'resume'             : 1
			\ })
autocmd FileType defx call s:defx_my_settings()
function! s:defx_custom_settings() abort
    nnoremap <silent><buffer><expr> N                   defx#do_action('new_file')                      " 新建文件/文件夹
    nnoremap <silent><buffer><expr> D                   defx#do_action('remove_trash')                  " 删除
    nnoremap <silent><buffer><expr> Y                   defx#do_action('copy')                          " 复制
    nnoremap <silent><buffer><expr> P                   defx#do_action('paste')                         " 粘贴
    nnoremap <silent><buffer><expr> dd                  defx#do_action('move')                          " 剪切
    nnoremap <silent><buffer><expr> R                   defx#do_action('rename')                        " 重命名
    nnoremap <silent><buffer><expr> v                   defx#do_action('toggle_select') . 'j'           " 选择
    nnoremap <silent><buffer><expr> V                   defx#do_action('toggle_select') . 'k'           " 选择
    nnoremap <silent><buffer><expr> *                   defx#do_action('toggle_select')                 " 选择但不移动
    nnoremap <silent><buffer><expr> x                   defx#do_action('execute_system')                " 执行
    nnoremap <silent><buffer><expr> yp                  defx#do_action('yank_path')                     " 复制路径
    nnoremap <silent><buffer><expr> h                   defx#do_action('call', 'DefxSmartH')            " 关闭节点或者返回上一层目录，但不设置cwd
    nnoremap <silent><buffer><expr> l                   defx#do_action('call', 'DefxSmartL')            " 展开或者打开文件
    nnoremap <silent><buffer><expr> L                   defx#do_action('open_tree_recursive')           " 递归展开
    nnoremap <silent><buffer><expr> q                   defx#do_action('quit')                          " 关闭的defx
    nnoremap <silent><buffer><expr> r                   defx#do_action('redraw')
    nnoremap <silent><buffer><expr> <Cr>                defx#do_action('call', 'DefxSmartCr')           " 打开文件或者进入目录
    nnoremap <silent><buffer><expr> <backspace>         defx#do_action('call', 'DefxSmartBackSpace')    " 返回上一级目录并设置cwd
    nnoremap <silent><buffer><expr> W                   defx#do_action('drop', 'vsplit')
    nnoremap <silent><buffer><expr> w                   defx#do_action('drop', 'split')
    nnoremap <silent><buffer><expr> t                   defx#do_action('drop', 'tabedit')
    nnoremap <silent><buffer><expr> .                   defx#do_action('toggle_ignored_files')          " 显示隐藏文件
    nnoremap <silent><buffer><expr> s                   defx#do_action('toggle_sort')                   " 排序
    nnoremap <silent><buffer><expr> ~                   defx#do_action('cd')
    nnoremap <silent><buffer><expr> x                   defx#do_action('execute_command')
    nnoremap <silent><buffer><expr> `                   defx#do_action('cd', getcwd())                  " 回到工作目录
    nnoremap <silent><buffer><expr> cd                  defx#do_action('change_vim_cwd')                " 将当前目录设置为工作目录
    nnoremap <silent><buffer><expr> f                   defx#do_action('search')
endfunction


nnoremap <space>i :Defx -columns=icons:indent:filename:type<cr>
nnoremap <silent> <F10> :Defx `expand('%:p:h')` -search=`expand('%:p')`<cr>
nnoremap <silent> <space>ft :Defx <cr>
"}}}



" When writing a buffer (no delay).
call neomake#configure#automake('w')
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 550)
" When reading a buffer (after 1s), and when writing (no delay).
call neomake#configure#automake('rw', 1000)
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 500ms; no delay when writing).
call neomake#configure#automake('nrwi', 500)
let g:neomake_c_enabled_makers=['clang']
let g:neomake_c_clang_args = '-Wall -O2 -std=c99 '
let g:neomake_error_sign = {
         \ 'text': '✗',
         \ 'texthl': 'NeomakeErrorSign',
         \ }
     let g:neomake_warning_sign = {
         \   'text': '⚡',
         \   'texthl': 'NeomakeWarningSign',
         \ }

"---------------comment--------------"
" 不能使用nnoremap
nmap <leader>/ <plug>NERDCommenterToggle
vmap <leader>/ <plug>NERDCommenterToggle


"-----------------Leaderf settings---
" should use `Leaderf gtags --update` first
let g:Lf_GtagsAutoGenerate = 1 
let g:Lf_Gtagslabel = 'native-pygments'
"let g:Lf_Gtagslabel = 'default'
noremap <leader>fr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fd :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>fo :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>fn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>fp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
noremap <leader>o :LeaderfFunction!<cr>
" 文件搜索
nnoremap <silent> <Leader>f :Leaderf file<CR>   
" 历史打开过的文件
nnoremap <silent> <Leader>m :Leaderf mru<CR>  
" 函数搜索（仅当前文件里）
nnoremap <silent> <Leader>b :Leaderf buffer<CR> 
" 模糊搜索，很强大的功能，迅速秒搜
nnoremap <silent> <Leader>F :Leaderf function<CR> 

nnoremap <silent> <Leader>rg :Leaderf rg<CR>
"let g:Lf_WindowPosition='right'


" -------neosnippet
imap <expr><tab> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<c-j>" : "\<tab>"
smap <expr><tab> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"

nnoremap <space>s :NeoSnippetEdit<cr>
"deoplete-jedi setting
"let g:deoplete#sources#jedi#server_timeout=100
"let g:deoplete#sources#jedi#statement_length=100

let g:neosnippet#snippets_directory=['$HOME/.cache/vim/plugins/neosnippet-snippets/neosnippets']
"let g:neosnippet#enable_completed_snippet=1
function! s:buffer_close() abort
    redir => val
        exec "buffers"
    redir end
    if len(val) > 0
        exec "Bclose"
    endif
endfunction
nnoremap Q :silent call <SID>buffer_close()<cr>

" startify{{{
set encoding=utf-8
" For startify
let g:startify_padding_left = 10
let g:startify_custom_header = [
\'                                                         ',
\'             ▄█    █▄   ▄█     ▄▄▄▄███▄▄▄▄      ▄████████',
\'            ███    ███ ███   ▄██▀▀▀███▀▀▀██▄   ███    ███',
\'            ███    ███ ███▌  ███   ███   ███   ███    █▀',
\'            ███    ███ ███▌  ███   ███   ███  ▄███▄▄▄',
\'            ███    ███ ███▌  ███   ███   ███ ▀▀███▀▀▀',
\'            ███    ███ ███   ███   ███   ███   ███    █▄',
\'            ███    ███ ███   ███   ███   ███   ███    ███',
\'             ▀██████▀  █▀     ▀█   ███   █▀    ██████████',
\'                                                         ',
\'                                                         ',
\]

let g:startify_files_number = 6
let g:startify_dir_number = 6


" command 命令
let g:startify_commands = [
    \ {'u': ['插件更新', 'DeinUpdate']},
    \ {'t': ['打开终端', 'terminal']},
    \ {'s': ['启动时间', 'StartupTime']},
    \ ]

let g:startify_lists = [
       \ { 'type': 'files',     'header': ['        MRU']            },
       \ { 'type': 'dir',       'header': ['        MRU '. getcwd()] },
       \ { 'type': 'commands',  'header': ['        Commands']       },
       \ ]
"}}}


