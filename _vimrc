set encoding=utf-8
set nu
autocmd BufWritePost $MYVIMRC source $MYVIMRC  " 让配置变更立即生效
set nocompatible
set backspace=indent,eol,start
"===================================================================
"key mapping
"===================================================================
let mapleader = "\<Space>"  "定义空格键为leader键
set incsearch " 动态查找

" 分号和冒号互换
nnoremap ; :
nnoremap : ;

" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至vim
nmap <Leader>p "+p

" 定义快捷键在结对符之间跳转
nmap <Leader>m %

" Ctrl + a全选文本
map <C-a> ggVG 

nmap <leader>b 0
nmap <leader>e $
" 插入模式下的移动
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-a> <Home>
inoremap <C-e> <End>

noremap <delete> dw
noremap <BS>  db
map <leader>k <leader>ci   “” 注释和取消注释，nerdcommenter插件依赖
"cmap sw w !sudo tee >/dev/null %  "root权限保存文件

" 翻页，vim默认的上翻是C-u,有时候会忘记Ctrl，所以替换为alt-d.借用emacs的概念
noremap <M-d> <C-u>



"===================================================================
" vundle 环境设置
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
" vundle 管理的插件列表必须位于 vundle#begin() 和 vundle#end() 之间
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-scripts/phd'
Plugin 'majutsushi/tagbar'  "基于标签的标识符列表插件
Plugin 'Valloric/YouCompleteMe'  " 补全插件
Plugin 'Lokaltog/vim-powerline'  "状态栏美化
Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'
Plugin 'jiangmiao/auto-pairs'  "括号和引号自动匹配
Plugin 'tell-k/vim-autopep8'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-expand-region'
Plugin 'fholgado/minibufexpl.vim' "快速浏览和操作buffer
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'  "super search. key-map: <C-p>
" Zen coding
"Plugin 'mattn/emmet-vim'
"Plugin 'davidhalter/jedi-vim'
Plugin 'ternjs/tern_for_vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'iamcco/markdown-preview.vim'
" 插件列表结束
call vundle#end()
filetype plugin indent on

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)
"===================================================
"简单的样式设置
"===================================================
" 配色方案
set background=dark
colorscheme solarized
"colorscheme molokai
"colorscheme phd

" 禁止光标闪烁
set gcr=a:block-blinkon0

" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T

" 设置 gvim 显示字体
set guifont=YaHei\ Consolas\ Hybrid:h12 

" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on

"===============================================================
"缩进相关
"===============================================================
" 自适应不同语言的智能缩进
filetype indent on
noremap <leader>il :IndentLinesToggle<CR>

" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
" 高亮显示当前行/列
set cursorline
set cursorcolumn
" 高亮显示搜索结果
set hlsearch

" 禁止折行
set nowrap

" 设置状态栏主题风格
let g:Powerline_colorscheme='solarized256'

"控制是否全屏
if has("gui_running") && has("win32")
    map <F11> :call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>
endif

" 启动窗口自动最大
au GUIEnter * simalt ~x

"===============================================================
"nerdtree设置
"===============================================================
"F2开启和关闭树"
noremap <F2> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
"显示书签"
let NERDTreeShowBookmarks=1
"设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
"窗口大小"
let NERDTreeWinSize=25

"===============================================================
"tagbar
" toggle tagbar display
noremap <F9> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1


"缩进指示线"
let g:indentLine_char='┆'
let g:indentLine_enabled = 1

"autopep8设置"
let g:autopep8_disable_show_diff=1

"===============================================================
"miniBuffer相关设置
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
" buffer 切换快捷键
noremap <C-Tab> :bn<CR>
noremap <C-S-Tab> :bp<CR>

let g:ycm_autoclose_preview_window_after_completion=1
let g:pydiction_location = '~/.vim/tools/pydiction/complete-dict'  


"===============================================================
"ycm
"===============================================================
set completeopt=longest,menu
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_remove_include_errors = 1
let g:ycm_python_binary_path = 'python'

