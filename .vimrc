" 以下、Vundle設定-----------------
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" 導入したいプラグインを以下に列挙
" Plugin '[Github Author]/[Github repo]' の形式で記入
Plugin 'rust-lang/rust.vim' "Rust
Plugin 'fatih/vim-go' "Golang
Plugin 'tpope/vim-fugitive'  "fugitive
Plugin 'scrooloose/nerdtree' "NERDTree
Plugin 'tell-k/vim-autopep8' "Ptyhonをpep8に自動でフォーマットする
if has('lua') " lua機能が有効になっている場合・・・・・・①
	Plugin 'stephpy/vim-yaml' "yaml
	Plugin 'Shougo/neocomplete.vim' " neocomplete 
	Plugin 'Shougo/neosnippet' " スニペットの補完機能
	Plugin 'Shougo/neosnippet-snippets' " スニペット集
endif

" Color schemes
Plugin 'vim-scripts/twilight'
Plugin 'tomasr/molokai' " molokai
Plugin 'morhetz/gruvbox' " gruvbox

call vundle#end()
" 以上、Vundle設定-----------------

" General

"set expandtab "タブ入力を複数の空白入力に置き換える
"set shiftwidth=4 "自動インデントでずれる幅
"set softtabstop=4 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set tabstop=4 "画面上でタブ文字が占める幅
set autoindent "改行時に前の行のインデントを継続する
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set number "行番号を表示
set noswapfile "スワップファイルは使わない(逐次保存するので)
set modifiable
syntax enable "シンタックスハイライト
colorscheme gruvbox "カラースキーム
filetype plugin indent on "ファイルタイプ検出、プラグイン、インデントの有効化

"括弧の補完--------------
inoremap { {}<Left>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>

" vim-go
let g:go_fmt_command = "goimports"

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

source ~/.vimrc.common " そのたのvimバインディングエディタとの共通設定
source ~/.vimrc.neocomplete "neocomplete用の設定

" Syntastic
let g:syntastic_python_checkers = ['flake8']

" vim-autopep8
let g:autopep8_on_save = 1 "ファイル保存時にフォーマットする
let g:autopep8_disable_show_diff=1 "フォーマット前後の差分を表示しない
