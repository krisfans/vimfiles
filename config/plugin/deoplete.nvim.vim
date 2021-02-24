"--deoplete设置--"
" let g:deoplete#enable_at_startup = 1 " 自启动
"" 补全结束或离开插入模式时，关闭预览窗口
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
call deoplete#custom#option({
            \ 'auto_complete_delay': 80,
            \ 'smart_case': v:true,
            \ 'sources': {'_':[]},
            \ })
            " 用户输入至少两个字符时再开始提示补全
call deoplete#custom#source('LanguageClient',
			\ 'min_pattern_length',
			\ 1)

nmap <space>ed :call deoplete#enable()<cr>