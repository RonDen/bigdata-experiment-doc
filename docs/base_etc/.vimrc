set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-airline/vim-airline'
Plugin 'mhinz/vim-startify'
Plugin 'majutsushi/tagbar'
"Plugin 'Valloric/YouCompleteMe'
call vundle#end()            " required
filetype plugin indent on    " required

" set the line number
set nu

" nerdtree settings
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "NERDTree是最后一个窗口，自动关闭
let NERDTreeIgnore=['\.pyc','\~$','\.swp']  "忽略带此后缀名的文件
"let g:nerdtree_tabs_open_on_console_startup=1 "如果安装了vim-nerdtree-tabs，tabs之间共享nerdtree
autocmd FileType nerdtree noremap <buffer> <tab> <nop> "tab 键对于nerdtree窗口无效（防止在nerdtree窗口切换buffer）
autocmd FileType nerdtree noremap <buffer> <S-tab> <nop>"Shift-tab 键对于nerdtree窗口无效

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }  "自定义注释符


let g:NERDDefaultAlign = 'left'             "左对齐 注释符
let g:NERDCompactSexyComs = 1      " 和上一个一起使用，多行注释 ,注释符全部都在行首

let g:NERDTrimTrailingWhitespace = 1    "uncomment的时候，修减行末的空格

let g:startify_files_number = 5  "每个列表长度
let g:startify_session_autoload = 1 "自动会话

" 设置书签
let g:startify_bookmarks = [       
            \ '~/Project/test.cpp',
            \]

" 设置头部信息
let g:startify_custom_header = [
            \ '                                  ',
            \ '            __                 ',
            \ '    __  __ /\_\    ',
            \ '   /\ \/\ \\/\ \ /'' __` _',
            \ '   \ \ \_/\ \',
            \ '    \ \\ \_\   ',
            \ '     \/__/    \/_/\/_    ',
            \ '                              ',
            \ ]

" You compelete me
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>"定义申明之间跳转
set completeopt-=preview " 在接受补全后不分裂出一个窗口显示接受的项
"let g:ycm_seed_identifiers_with_syntax = 1"关键字补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
let g:ycm_show_diagnostics_ui = 0                           " 禁用语法检查

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename 
let g:airline#extensions#tabline#fnamemod = ':t'

map <leader>1 <Plug>AirlineSlectTab1 "\1 映射成 ：选择第一个buffer
map <leader>2 <Plug>AirlineSlectTab2
map <leader>3 <Plug>AirlineSlectTab3
map <leader>4 <Plug>AirlineSlectTab4
map <leader>5 <Plug>AirlineSlectTab5
map <leader>6 <Plug>AirlineSlectTab6
map <leader>7 <Plug>AirlineSlectTab7
map <leader>8 <Plug>AirlineSlectTab8
map <leader>9 <Plug>AirlineSlectTab9

"auto-pair
let g:AutoPairsFlyMode =1  "飞行模式开启，默认不开启，可以跨括号跳出，如  ([foo|])  按）之后会直接跳出来 ([foo]) |
let g:AutoPairsMapSpace = 1 " 把SPACE键映射为在括号两侧添加空格

" ctag
set tags+=~/.vim/systags



