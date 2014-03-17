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
NeoBundle 'Shougo/neomru'
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
"--------------------------------------------------

filetype plugin indent on

