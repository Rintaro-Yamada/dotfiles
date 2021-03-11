set encoding=utf-8
scriptencoding utf-8
" ↑1行目は読み込み時の文字コードの設定
" ↑2行目はVim Script内でマルチバイトを使う場合の設定
" Vim scritptにvimrcも含まれるので、日本語でコメントを書く場合は先頭にこの設定が必要になる

" ----------------------------------------------------------------------
" プラグイン
" ----------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

"ツリー状にディレクトリ表示
Plug 'scrooloose/nerdtree'

"NERDTree関係の設定
"----------------------------------------------------
" コントロール+e でツリー表示
nnoremap <silent><C-e> :NERDTreeToggle<CR>
" デフォルトでツリーを表示させる
"let g:nerdtree_tabs_open_on_console_startup=1
" 他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる。
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeCaseSensitiveSort=1 "ファイル表示の自動ソート(0 または 1) 初期値0 : ソートを行わない
let g:NERDTreeIgnore=['\.clean$', '\.swp$', '\.bak$', '\~$','\.rbc$','\.pyc$','\.db$','\sqlite$','__pycache__'] "表示を無視するファイル設定する。
let g:NERDTreeMouseMode=3 "マウスでの操作 1: ダブルクリックでファイル・ディレクトリが開く 2: ディレクトリはダブルクリック・ファイルはシングルクリックで開く 3: シングルクリックでファイル・ディレクトリが開く
"let g:NERDTreeShowHidden=1 "隠しファイルを表示設定
"-----------------------------------------------------

"ステータスライン関係
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasiser/vim-code-dark'
let g:airline#extensions#tabline#enabled = 1 "タブを有効化
nmap <C-p> <Plug>AirlineSelectPrevTab "C-pで前のタブへ
nmap <C-n> <Plug>AirlineSelectNextTab "C-nで次のタブへ
let g:airline_powerline_fonts = 1
"let g:airline_theme = 'molokai'
let g:airline_theme = 'codedark'

"テーマ関係
"Plug 'tomasr/molokai'

"アイコン関係
Plug 'ryanoasis/vim-devicons'
set guifont=Cica:h16
set printfont=Cica:h12
set ambiwidth=double
" フォルダアイコンを表示
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

Plug 'tiagofumo/vim-nerdtree-syntax-highlight' 
let g:NERDTreeLimitedSyntax = 1

"閉じ括弧してくれる
Plug 'cohama/lexima.vim'

"vim-plug
Plug 'lervag/vimtex'
filetype plugin on
filetype indent on
set shellslash
set grepprg=grep\ -nH\ $*
let g:tex_flavor='latex'
let g:Imap_UsePlaceHolders = 1
let g:Imap_DeleteEmptyPlaceHolders = 1
let g:Imap_StickyPlaceHolders = 0
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='dvi,pdf'
"let g:Tex_FormatDependency_pdf = 'pdf'
let g:Tex_FormatDependency_pdf = 'dvi,pdf'
let g:vimtex_compiler_latexmk = {
      \ 'background': 1,
      \ 'build_dir': '',
      \ 'continuous': 1,
      \ 'options': [
      \    '-pdfdvi', 
      \    '-verbose',
      \    '-file-line-error',
      \    '-synctex=1',
      \    '-interaction=nonstopmode',
      \],
      \}

let g:vimtex_view_general_viewer
      \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
let g:vimtex_view_general_options = '-r @line @pdf @tex'
let g:Tex_CompileRule_pdf = 'ptex2pdf -u -l -ot "-synctex=1 -interaction=nonstopmode -file-line-error-style" $*'
"let g:Tex_CompileRule_pdf = 'lualatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_CompileRule_dvi = 'uplatex -synctex=1 -interaction=nonstopmode -file-line-error-style $*'
let g:Tex_BibtexFlavor = 'upbibtex'
let g:Tex_MakeIndexFlavor = 'upmendex $*.idx'
let g:Tex_UseEditorSettingInDVIViewer = 1
"let g:Tex_ViewRule_pdf = 'xdg-open'
"let g:Tex_ViewRule_pdf = 'evince'
"let g:Tex_ViewRule_pdf = 'okular --unique'
let g:Tex_ViewRule_pdf = 'zathura -x "vim --servername synctex -n --remote-silent +\%{line} \%{input}"'
"let g:Tex_ViewRule_pdf = 'qpdfview --unique'
"let g:Tex_ViewRule_pdf = 'texworks'
"let g:Tex_ViewRule_pdf = 'mupdf'
"let g:Tex_ViewRule_pdf = 'firefox -new-window'
"let g:Tex_ViewRule_pdf = 'chromium --new-window'

call plug#end()

"---------------------------------------------------------
" 文字
"----------------------------------------------------------
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=utf-8,euc-jp,cp932 "読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
set ambiwidth=double " □や○文字が崩れる問題を解決
" 不可視文字を表示する
"set list

"if ! has('gui_macvim')
"    " file encoding for JP （MacVim 以外の場合）
"    set fencs=iso-2022-jp,cp932,sjis,euc-jp,utf-8
"endif

" ========== Base Config ==========
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" Backspaceの有効化
set backspace=indent,eol,start
" カーソルが行頭／末にあるときに前／次行に移動できる
set whichwrap=b,s,h,l,<,>,[,]
" バッファが編集中でもその他のファイルを開けるように
set hidden
"開いているがvim上で変更のないファイルについて、外部で変更があった時に自動的に読み込み直す
set autoread
" ターミナル接続を高速化(スクロールが重くなる対策)
set ttyfast
" マクロやコマンドを実行する間、画面を再描画しない(スクロールが重くなる対策)
set lazyredraw
"8進数から10進数に変更
set nrformats=
"構文ハイライトを有効にする
syntax enable
"コマンド ":syntax enable" は現在の色設定を変更しない。そのため、このコマンドを
"使用する前後にコマンド ":highlight" で好みの色を設定することができる。現在の設
"定を破棄して、デフォルトの色を設定させたい場合は次のコマンドを使用する:
"syntax on
set ttimeoutlen=50 "キーコードシーケンスが終了するのを待つ時間を短くする
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite "これらのバックアップファイルはつくらない

"----------------------------------------
" 文字列検索
"----------------------------------------
"インクリメンタル検索
set incsearch
"検索結果をハイライト表示
set hlsearch
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set wrapscan " 検索時に最後まで行ったら最初に戻る
" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

"----------------------------------------------------------
" カーソル
"----------------------------------------------------------
" 行番号を表示
set number
set cursorline " カーソルラインをハイライト
hi clear CursorLine
"----------------------------------------------------------
" カッコ・タグの対応
"----------------------------------------------------------
set showmatch " 括弧の対応関係を一瞬表示する

"----------------------------------------------------------
" キーバインド
"----------------------------------------------------------
"<esc>を<jj>で代用.<ctrl>+<[>でもできる。
inoremap <silent> jj <ESC>
noremap <C-j> <esc>
noremap! <C-j> <esc>

"----------------------------------------------------------
" ステータスライン
"----------------------------------------------------------
set laststatus=2 " ステータスラインを常に表示
set showmode " 現在のモードを表示
set showcmd " 打ったコマンドをステータスラインの下に表示
set ruler " ステータスラインの右側にカーソルの位置を表示する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P " ステータス行の表示設定
" ステータス行に現在のgitブランチを表示する
"set statusline+=%{fugitive#statusline()}
" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title
" ステータスラインの色
highlight StatusLine   term=NONE cterm=NONE ctermfg=black ctermbg=white


"----------------------------------------------------------
"ハイライト
"----------------------------------------------------------
"行番号を黄色にする
"autocmd ColorScheme * highlight LineNr ctermfg=226 

"----------------------------------------------------------
"相対行番号
"----------------------------------------------------------
set relativenumber

"----------------------------------------------------------
" タブ・インデント
"----------------------------------------------------------
set expandtab " タブ入力を複数の空白入力に置き換える
set tabstop=4 " 画面上でタブ文字が占める幅
set softtabstop=4 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent "改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=4 " smartindentで増減する幅

"----------------------------------------------------------
"コマンドライン
"----------------------------------------------------------
" コマンドラインの履歴を100件保存する
set history=100

"----------------------------------------------------------
"スクロール
"----------------------------------------------------------
set scrolloff=5 "画面端でのスクロールに5行分の余裕を持つ

"----------------------------------------------------------
"マウスでカーソル移動とスクロール
"----------------------------------------------------------
if has('mouse')
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif

"----------------------------------------------------------
"クリップボードの同期 
"----------------------------------------------------------
set clipboard+=unnamed

"----------------------------------------------------------
" Syntastic
"----------------------------------------------------------
" 構文エラー行に「>>」を表示
let g:syntastic_enable_signs = 1
" 他のVimプラグインと競合するのを防ぐ
let g:syntastic_always_populate_loc_list = 1
" 構文エラーリストを非表示
let g:syntastic_auto_loc_list = 0
" ファイルを開いた時に構文エラーチェックを実行する
let g:syntastic_check_on_open = 1
" 「:wq」で終了する時も構文エラーチェックする
let g:syntastic_check_on_wq = 1

" カラー設定
set t_Co=256
"set background=dark
" カラースキーマ
"colorscheme murphy "NERDTreeで使うと化ける
"colorscheme molokai
colorscheme codedark
"コマンド補完
set wildmenu
set wildmode=list:longest
set completeopt=menu,preview,menuone
"補完候補を出したまま改行できるようにする
inoremap <expr> <CR> pumvisible() ? "\<C-Y>\<CR>" : "\<CR>"
"Enterで補完決定にする
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<C-G>u\<CR>"
"ESCで補完キャンセルして元のテキストに戻す ※.gvimrcで<ESC>を上書きしてるので動かない
inoremap <expr> <ESC> pumvisible() ? "\<C-E>" : "\<ESC>"
"インクリメンタルに候補を絞り込み、Enterで決定
inoremap <expr> <C-N> pumvisible() ? "\<lt>C-N>" : "\<C-N>\<C-R>=pumvisible() ? \"\\<lt>Down>\" : \"\"\<lt>CR>"
