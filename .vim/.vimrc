" 以下、Vundle設定-----------------
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" 導入したいプラグインを以下に列挙
" Plugin '[Github Author]/[Github repo]' の形式で記入
Plugin 'rust-lang/rust.vim' "Rust
Plugin 'fatih/vim-go' "Golang
Plugin 'tpope/vim-fugitive'  "fugitive (git)
Plugin 'scrooloose/nerdtree' "NERDTree
Plugin 'tell-k/vim-autopep8' "Ptyhonをpep8に自動でフォーマットする
Plugin 'scrooloose/syntastic' " 静的シンタックスチェック
Plugin 'posva/vim-vue' "Vue.jsのシンタックスハイライト

" Color schemes
Plugin 'morhetz/gruvbox' " gruvbox

call vundle#end()
" 以上、Vundle設定-----------------

" General
set number "行番号を表示
set noswapfile "スワップファイルは使わない(逐次保存するので)
syntax enable "シンタックスハイライト
colorscheme gruvbox "カラースキーム
filetype plugin indent on "ファイルタイプ検出、プラグイン、インデントの有効化
set clipboard+=unnamed "clipboard

"括弧の補完--------------
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap ( ()<ESC>i
inoremap (<Enter> ()<Left><CR><ESC><S-o>

" vim-go
let g:go_fmt_command = "goimports"
let g:go_term_mode = 'split' "GoRun, GoTest時にタテにウィンドウ分割する
let g:go_metalinter_autosave = 1 " 保存時に lint, errcheck vet を行う
let g:go_jump_to_error = 0 " lint, errorcheck時に該当箇所にカーソルジャンプしない
let g:go_highlight_types = 1 " 型宣言をハイライトする
let g:go_highlight_functions = 1 " 関数宣言をハイライトする
let g:go_highlight_function_calls = 1 "関数呼び出しをハイライトする

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeShowHidden=1

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_vue_checkers = ['eslint']

" vim-autopep8
let g:autopep8_on_save = 1 "ファイル保存時にフォーマットする
let g:autopep8_disable_show_diff=1 "フォーマット前後の差分を表示しない

" indentインデントの設定
set expandtab "タブ入力を複数の空白入力に置き換える
set shiftwidth=4 "自動インデントでずれる幅
set softtabstop=4 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set tabstop=4 "画面上でタブ文字が占める幅
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する
"sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtabの略
"言語ごとの設定
autocmd FileType vue setlocal sw=2 sts=2 ts=2 et
autocmd FileType js setlocal sw=2 sts=2 ts=2 et
autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et

" 検索するときに大文字小文字を区別しない
set ignorecase

" 検索時に大文字を含んでいたら大/小を区別
set smartcase

" インクリメンタル検索 (検索ワードの最初の文字を入力した時点で検索が開始)
set incsearch

" keymap
inoremap jk <esc>:w<CR> "挿入モード時、jkでノーマルモードに戻る

map leader = "\<Space>" "leaderキーをspaceにする
nnoremap <Leader>w :w<CR> "space+wで保存する