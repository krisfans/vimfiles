set encoding=utf-8
"dein Scripts-----------------------------
if &compatible
    set nocompatible               " Be iMproved
endif
" Required:
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
" Required:
if dein#load_state('~/.cache/dein_gvim')
    call dein#begin('~/.cache/dein_gvim')

    " Let dein manage dein
    " Required:
    call dein#add('~/.cache/dein_gvim/repos/github.com/Shougo/dein.vim')
    " Add or remove your plugins here like this:
    call dein#load_toml('~/vimfiles/config/plugins.toml')

    " Add or remove your plugins here like this:
    " 主题
    call dein#add('rakr/vim-one')
    call dein#add('lifepillar/vim-solarized8')
    call dein#add('arcticicestudio/nord-vim')
    call dein#add('morhetz/gruvbox')
    call dein#add('sainnhe/gruvbox-material')
    call dein#add('sainnhe/forest-night')
    call dein#add('hardcoreplayers/oceanic-material')
    call dein#add('kristijanhusak/vim-hybrid-material')
    call dein#add('mhartington/oceanic-next')
    call dein#add('liuchengxu/space-vim-theme')

    " call dein#add('neovim/nvim-lspconfig',{'on_lua':'lsp_config'})
    " Required:
    call dein#end()
    call dein#save_state()
endif
" If you want to install not installed plugins on startup.
" if dein#check_install()
"   call dein#install()
" endif
call dein#call_hook('source')
autocmd VimEnter * call dein#call_hook('post_source')
autocmd CursorHold * silent call CocActionAsync('highlight')
"End dein Scripts-------------------------
for file in split(glob("$HOME/vimfiles/config/*.vim"), '\n')
    execute 'source' file
endfor

" Required:
filetype on
filetype plugin indent on
syntax enable
" 颜色主题放在这里
colorscheme one

if exists("g:loaded_webdevicons")
    call webdevicons#refresh()
endif

