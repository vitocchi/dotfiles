set expandtab "タブ入力を複数の空白入力に置き換える
set tabstop=4 "画面上でタブ文字が占める幅
set shiftwidth=4 "自動インデントでずれる幅
set softtabstop=4 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent "改行時に前の行のインデントを継続する
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set number "行番号を表示

" 以下、Vundle設定-----------------
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" 導入したいプラグインを以下に列挙
" Plugin '[Github Author]/[Github repo]' の形式で記入
Plugin 'rust-lang/rust.vim'

" Color schemes
Plugin 'vim-scripts/twilight'
Plugin 'tomasr/molokai' " molokai
Plugin 'morhetz/gruvbox' " gruvbox

call vundle#end()
" 以上、Vundle設定-----------------

syntax enable "シンタックスハイライト
colorscheme gruvbox "カラースキームはやっぱりtwilight
source ~/.vimrc.common
filetype plugin indent on "ファイルタイプ検出、プラグイン、インデントの有効化
