filetype off
filetype plugin indent off

syntax on
set nu
set hlsearch
set ignorecase
set cursorline

set list
set listchars=tab:»-,trail:»,eol:↲,extends:»,precedes:«,nbsp:% " 不可視文字の表示記号指定

"--------------------------------------------------
"インデントをタブじゃなくてスペース4つにする
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
"--------------------------------------------------

if has('vim_starting')
  set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/dotfiles/.vim/bundle/'))

" インストールしたいプラグイン
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
"NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'The-NERD-tree'
NeoBundle 'scrooloose/syntastic'

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
let g:NERDTreeWinSize=40
"--------------------------------------------------

"--------------------------------------------------
"neocomplete用の設定
let g:neocomplete#enable_at_startup = 1
"--------------------------------------------------

"--------------------------------------------------
"syntastic用の設定
let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_javascript_checkers = [
      \ 'jshint',
      \ 'jscs',
      \ ]
" AngularJSのエラーを回避
let g:syntastic_html_tidy_ignore_errors = [' proprietary attribute "ng-']
let g:syntastic_mode_map = { 'mode': 'active',
      \ 'active_filetypes': ['perl'],
      \ 'passive_filetypes': ['php']
      \ }

" ,scで構文チェック
nnoremap ,sc :<C-u>SyntasticCheck<CR>

autocmd BufReadPost,BufNewFile .jshintrc setl filetype=json
"--------------------------------------------------

"--------------------------------------------------
"neosnippet用の設定
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" 自分用 snippet ファイルの場所
let s:my_snippet = '~/dotfiles/snippet/'
let g:neosnippet#snippets_directory = s:my_snippet
"--------------------------------------------------

"--------------------------------------------------
noremap <Space>h ^
noremap <Space>l $
nnoremap <Space>w <C-w>
"--------------------------------------------------

NeoBundleCheck

filetype plugin indent on

