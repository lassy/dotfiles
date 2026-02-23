"------------------------------------
" NeoBundle
"------------------------------------
set nocompatible               " be iMproved
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
" NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
" NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
" NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'yaymukund/vim-rabl'

" NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'Yggdroot/indentLine'

" for HTML5
NeoBundle 'othree/html5.vim'

" for JSON
NeoBundle 'elzr/vim-json'
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

" for CoffeeScript
" NeoBundle 'kchmck/vim-coffee-script'

" for Chef
" NeoBundle 'ryuzee/neocomplcache_php_selenium_snippet'
" let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet_chef_recipe_snippet/autoload/neosnippet/snippets'

" for Elixir
" NeoBundle 'elixir-editors/vim-elixir'

" for Vue
" NeoBundle 'posva/vim-vue'

call neobundle#end()

filetype plugin indent on     " required!
filetype indent on

"------------------------------------
" 検索関連
"------------------------------------
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch

"------------------------------------
" 装飾関連
"------------------------------------
" シンタックスハイライトを有効にする
if has("syntax")
    syntax on
endif
" 行番号を表示する
set number
" タブ幅を設定する
set tabstop=4
set shiftwidth=4
" 入力中のコマンドをステータスに表示する
set showcmd
" 括弧入力時の対応する括弧を表示
set showmatch
" 検索結果文字列のハイライトを有効にする
set hlsearch
" ステータスラインを常に表示
set laststatus=2
" ステータスラインに文字コードと改行文字を表示する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" Escの2回押しでハイライト消去
nmap <ESC><ESC> :nohlsearch<CR><ESC>
" 保存時に行末の空白を除去する
autocmd BufWritePre * :%s/\s\+$//ge
" タブ(T)と行末の半角スペース(^)を表示する
set list
set listchars=tab:T\ ,trail:^

" theme設定、取りあえず desert
colorscheme desert
set mouse="a"
set nocompatible
set textwidth=0 "文字の折りたたみ禁止
set nobackup
set autoread
set backspace=indent,eol,start "windows等のBSに近い挙動に
set formatoptions=lmoq
set modelines=5
set wrap
set cmdheight=2
set incsearch

"------------------------------------
" コーディング補助
"------------------------------------
" 改行時に自動でインデントを行う
set autoindent
" 自動的にインデントを挿入
set smartindent
" タブをスペースで置き換える
" Pirateではハードタブのため
set expandtab
" set noexpandtab
" PHPファイルの補助
filetype on
autocmd FileType php    :setlocal foldmethod=marker tabstop=4 shiftwidth=4 autoindent
autocmd FileType php    :setlocal makeprg=php\ -l\ %
autocmd FileType php    :setlocal efm=%m\ in\ %f\ on\ line\ %l

autocmd FileType ruby   :setlocal foldmethod=syntax foldlevel=2 tabstop=2 shiftwidth=2 autoindent
autocmd FileType eruby  :setlocal foldmethod=marker tabstop=2 shiftwidth=2 autoindent
autocmd FileType html   :setlocal foldmethod=marker tabstop=2 shiftwidth=2 autoindent
autocmd FileType yaml   :setlocal foldmethod=indent foldlevel=1 tabstop=2 shiftwidth=2 autoindent
autocmd FileType slim   :setlocal foldmethod=marker tabstop=2 shiftwidth=2 autoindent
autocmd FileType rabl   :setlocal foldmethod=marker tabstop=2 shiftwidth=2 autoindent
au BufRead,BufNewFile,BufReadPre *.scss   set filetype=sass
au BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee
autocmd FileType scss   :setlocal foldmethod=marker tabstop=2 shiftwidth=2 autoindent
autocmd FileType sass   :setlocal foldmethod=marker tabstop=2 shiftwidth=2 autoindent
autocmd FileType coffee :setlocal foldmethod=marker tabstop=2 shiftwidth=2 autoindent
autocmd FileType javascript :setlocal foldmethod=marker tabstop=2 shiftwidth=2 autoindent
autocmd FileType json   :setlocal foldmethod=marker tabstop=2 shiftwidth=2 autoindent
" Goファイルの補助
autocmd FileType go     :setlocal foldmethod=marker noexpandtab autoindent
" Elixirファイルの補助
autocmd FileType elixir :imap >> \|><Space>
" Vueファイルの補助
autocmd FileType vue    :setlocal foldmethod=marker tabstop=2 shiftwidth=2 autoindent
autocmd FileType vue    syntax sync fromstart
" Terraformファイルの補助
autocmd FileType Terraform :setlocal foldmethod=marker noexpandtab autoindent
" Protobufファイルの補助
autocmd FileType proto  :setlocal foldmethod=marker tabstop=2 shiftwidth=2 autoindent
" Thorファイルの補助
autocmd FileType thor   :setlocal foldmethod=marker tabstop=2 shiftwidth=2 autoindent

"------------------------------------
" indentLine
"------------------------------------
let g:indentLine_setColors = 0
let g:indentLine_color_term = 239
let g:indentLine_char_list = ['|', '!', '¦']

"------------------------------------
" indent_guides
"------------------------------------
" インデントの深さに色を付ける
" let g:indent_guides_start_level=2
" let g:indent_guides_auto_colors=0
" let g:indent_guides_enable_on_vim_startup=0
" let g:indent_guides_color_change_percent=20
" let g:indent_guides_guide_size=1
" let g:indent_guides_space_guides=1
"
" hi IndentGuidesOdd  ctermbg=235
" hi IndentGuidesEven ctermbg=237
" au FileType coffee,ruby,javascript,python IndentGuidesEnable
" nmap <silent><Leader>ig <Plug>IndentGuidesToggle

"------------------------------------
" 文字コード関連
"------------------------------------
" 改行コードの自動認識
set fileformats=unix,dos,mac
" 文字コードの自動認識
if &encoding !=# 'utf-8'
  set encoding=japan
  set fileencoding=japan
endif
if has('iconv')
  let s:enc_euc = 'euc-jp'
  let s:enc_jis = 'iso-2022-jp'
  " iconvがeucJP-msに対応しているかをチェック
  if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'eucjp-ms'
    let s:enc_jis = 'iso-2022-jp-3'
  " iconvがJISX0213に対応しているかをチェック
  elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
    let s:enc_euc = 'euc-jisx0213'
    let s:enc_jis = 'iso-2022-jp-3'
  endif
  " fileencodingsを構築
  if &encoding ==# 'utf-8'
    let s:fileencodings_default = &fileencodings
    let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
    let &fileencodings = &fileencodings .','. s:fileencodings_default
    unlet s:fileencodings_default
  else
    let &fileencodings = &fileencodings .','. s:enc_jis
    set fileencodings+=utf-8,ucs-2le,ucs-2
    if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
      set fileencodings+=cp932
      set fileencodings-=euc-jp
      set fileencodings-=euc-jisx0213
      set fileencodings-=eucjp-ms
      let &encoding = s:enc_euc
      let &fileencoding = s:enc_euc
    else
      let &fileencodings = &fileencodings .','. s:enc_euc
    endif
  endif
  " 定数を処分
  unlet s:enc_euc
  unlet s:enc_jis
endif
" 日本語を含まない場合は fileencoding に encoding を使うようにする
if has('autocmd')
  function! AU_ReCheck_FENC()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
      let &fileencoding=&encoding
    endif
  endfunction
  autocmd BufReadPost * call AU_ReCheck_FENC()
endif
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
  set ambiwidth=double
endif
" map <C-g> : Gtags
" map <C-h> : Gtags -f %<CR>
" map <C-j> : GtagsCursor<CR>
" map <C-n> : cn<CR>
" map <C-p> : cp<CR>
