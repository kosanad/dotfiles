filetype off
filetype plugin indent off

syntax on
set nu
set hlsearch
set paste

if has('vim_starting')
  set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/dotfiles/.vim/bundle/'))

" インストールしたいプラグイン
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'The-NERD-tree'

"--------------------------------------------------
"NERDTree用の設定
"隠しファイルを表示する。
let NERDTreeShowHidden = 1 
"引数なしで実行したとき、NERDTreeを実行する
let file_name = expand("%:p")
if has('vim_starting') &&  file_name == ""
  autocmd VimEnter * execute 'NERDTree ./'
endif
"NERDTreeのツリーの幅
"Default: 31.
let g:NERDTreeWinSize=70
"--------------------------------------------------

NeoBundleCheck

filetype plugin indent on

