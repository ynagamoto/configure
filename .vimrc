set number
set autoindent
set smartindent
set showcmd
nnoremap <Esc><Esc> :nohlsearch<CR><Esc>
set expandtab
set shiftwidth=2
set tabstop=2
set title
set encoding=utf-8
set ambiwidth=double
"set cursorline
set mouse=a
" 補完ウィンドウの設定
set completeopt=menuone

" ビープ音消す
"set visualbell 
"set vb t_vb=
set noerrorbells
set vb t_vb=

"クリップボードの共有化
set guioptions+=a
"set clipboard+=unnamed ",autoselect
set clipboard+=unnamedplus

"vmap <C-c> :w !xsel -ib<CR><CR>

" NeoBundle

if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'vim-scripts/wombat256.vim'
NeoBundle 'miyakogi/seiya.vim'
NeoBundle 'cohama/lexima.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'alvan/vim-closetag'
" インデントガイドの導入
NeoBundle 'nathanaelkane/vim-indent-guides'
"------------neocomplcacheの設定らしい------------"

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
"-------------------end------------------"

call neobundle#end()

NeoBundleCheck

set t_Co=256
colorscheme wombat256mod
syntax enable

let g:seiya_auto_enable=1


" ------------- NERDTree ------------- "

autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType")     && b:NERDTreeType == "primary") | q | endif

let g:NERDTreeIgnore=['\.clean$', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowHidden=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrows=0
let g:NERDTreeQuitOnOpen=0
let g:NERDTreeWinSize=20

map <C-n> :NERDTreeToggle<CR>


" -------------- lexima ------------- "
inoremap ( ()<ESC>i
inoremap <expr> ) ClosePair(')')
inoremap { {}<ESC>i
inoremap <expr> } ClosePair('}')
inoremap [ []<ESC>i
inoremap <expr> ] ClosePair(']')
" pair close checker.
" from othree vimrc ( http://github.com/othree/rc/blob/master/osx/.vimrc )
function ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf
"---------------------------------------"
let g:user_emmet_leader_key='<C-y>'
"---------------------------------------"
"-------closetagのオプションらしい--------"
" filenames like *.xml, *.html, *.xhtml, ...
" Then after you press <kbd>&gt;</kbd> in these files, this plugin will try to close the current tag.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non closing tags self closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" integer value [0|1]
" This will make the list of non closing tags case sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'



" キーマッピング
nnoremap :t :NERDTreeToggle

" ステータスラインの色の変更
au InsertEnter * hi StatusLine guifg=black guibg=white gui=none ctermfg=black ctermbg=white cterm=none
au InsertLeave * hi StatusLine guifg=white guibg=black gui=none ctermfg=white ctermbg=black cterm=none

" 全角スペースの強調
highlight FullWidthSpace ctermbg=Red
match FullWidthSpace /　/

" フォールディング
set foldmethod=syntax
let perl_fold=1
set foldlevel=100

" 単語検索時のハイライト
set hlsearch
hi Search ctermbg=Yellow

" インデントガイドの導入
let g:indent_guides_eable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=8
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=15
"let g:indent_guides_color_change_percent=0
let g:indent_guides_guide_size=1
