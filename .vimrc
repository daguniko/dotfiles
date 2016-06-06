" http://hea-www.harvard.edu/~fine/Tech/vi.html
set number
set ignorecase
set incsearch
set nohlsearch
set backspace=2
set smartindent
set softtabstop=4
set shiftwidth=4
set tabstop=4
set expandtab
set fileencodings=utf-8,euc-jp,iso-2022-jp,sjis

syntax on
 " Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif

 if &compatible
   set nocompatible               " Be iMproved
 endif

 " Required:
 set runtimepath^=~/.vim/bundle/neobundle.vim/

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'
 " NeoBundle 'andrep/vimacs'
 NeoBundle 'Shougo/neocomplcache'
 NeoBundle 'Shougo/neosnippet'
 NeoBundle 'Shougo/neosnippet-snippets'
 NeoBundle 'Shougo/vimproc.vim'
 NeoBundle 'scrooloose/nerdtree'
 NeoBundle 'thinca/vim-quickrun'
 NeoBundle 'w0ng/vim-hybrid'
 NeoBundle 'tomasr/molokai'
 " Unite
 NeoBundle 'Shougo/unite.vim'
 NeoBundle 'Shougo/neoyank.vim'
 let g:unite_enable_start_insert=1
 let g:unite_source_history_yank_enable =1
 let g:unite_source_file_mru_limit = 200
 nnoremap <silent> ,uy :<C-u>g:neoyank#file<CR>
 nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
 nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
 nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
 nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>

 NeoBundle 'ujihisa/unite-colorscheme'
 NeoBundle 'Shougo/neocomplete.vim'
 NeoBundle 'soramugi/auto-ctags.vim'
 NeoBundle 'kien/ctrlp.vim'

 "  NeoBundle 'yonchu/accelerated-smooth-scroll'

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!

 call neobundle#end()

 colorscheme molokai
 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck
 map <C-o> :NERDTreeToggle<CR>


 " unite.vimの設定
 " noremap <C-s><C-F> :Unite -buffer-name=file file<CR>
 " noremap <C-s><C-R> :Unite file_mru<CR>
 au FileType unite nnoremap <silent> <buffer> <expr> <C-i> unite#do_action('split')
 au FileType unite inoremap <silent> <buffer> <expr> <C-i> unite#do_action('split')

 " ESCキーを2回押すと終了する
 au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
 au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q


 " Disable AutoComplPop.
 let g:acp_enableAtStartup = 0
 " " Use neocomplete.
 let g:neocomplete#enable_at_startup = 1
 " " Use smartcase.
 let g:neocomplete#enable_smart_case = 1
 " " Set minimum syntax keyword length.
 let g:neocomplete#sources#syntax#min_keyword_length = 3
 let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
 "
 " " Define dictionary.
 let g:neocomplete#sources#dictionary#dictionaries = {
     \ 'default' : '',
         \ 'vimshell' : $HOME.'/.vimshell_hist',
             \ 'scheme' : $HOME.'/.gosh_completions'
                     \ }
 "                     " Define keyword.
                     if !exists('g:neocomplete#keyword_patterns')
                         let g:neocomplete#keyword_patterns = {}
                     endif
                         let g:neocomplete#keyword_patterns['default'] = '\h\w*'

 "                         " Plugin key-mappings.
                         inoremap <expr><C-g> neocomplete#undo_completion()
                         inoremap <expr><C-l> neocomplete#complete_common_string()
 "
 "                         " Recommended key-mappings.
 "                         " <CR>: close popup and save indent.
                         inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
                         function! s:my_cr_function()
                           return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
   " For no inserting <CR> key.
   "   "return pumvisible() ? "\<C-y>" : "\<CR>"
 endfunction
   "   " <TAB>: completion.
   inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
   "   " <C-h>, <BS>: close popup and delete backword char.
   inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
   inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
   "   " Close popup by <Space>.
   inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"
   "
   "   " AutoComplPop like behavior.
   let g:neocomplete#enable_auto_select = 1
   "
   "   " Shell like behavior(not recommended).
   "   "set completeopt+=longest
   "   "let g:neocomplete#enable_auto_select = 1
   "   "let g:neocomplete#disable_auto_complete = 1
   "   "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
   "
   "   " Enable omni completion.
   autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
   autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
   autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
   autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
   autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
   "
   "   " Enable heavy omni completion.
   if !exists('g:neocomplete#sources#omni#input_patterns')
     let g:neocomplete#sources#omni#input_patterns = {}
   endif
   "     "let g:neocomplete#sources#omni#input_patterns.php = '[^.
   "     \t]->\h\w*\|\h\w*::'
   "     "let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:]
   "     *\t]\%(\.\|->\)'
   "     "let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:]
   "     *\t]\%(\.\|->\)\|\h\w*::'
   "
   "     " For perlomni.vim setting.
   "     " https://github.com/c9s/perlomni.vim
   let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
   hi WarningMsg guifg=bg


   inoremap <C-e> <Esc>$a
   inoremap <C-a> <Esc>^a
   noremap <C-e> $
   noremap <C-a> 0
   noremap <C-i> i
   map <C-x> <nop>
   map <C-q> <nop>
   nnoremap <C-x><C-s> :wq<CR>
   set pastetoggle=<C-l>
   noremap <C-h> gT
   noremap <C-l> gt
   noremap <C-q> <C-d>
   nnoremap <C-l> pastetoggle
   set pastetoggle=<C-l>
   autocmd FileType * setlocal formatoptions-=ro

" let g:unite_enable_start_insert=1
" let g:unite_source_history_yank_enable =1
" let g:unite_source_file_mru_limit = 200
" nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
" nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
" nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
" nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
"


"   noremap <C-x> :set nopaste

   " noremap <C-w> <C-w>s
   " noremap <C-w>o <C-w>w
   let NERDTreeShowHidden = 1
   autocmd VimEnter * NERDTree
   autocmd BufWinEnter * NERDTreeMirror
   " autocmd vimenter * if !argc() | NERDTree | endif


let g:quickrun_config = {
            \   "cpp/g++" : {
            \       "cmdopt" : "-std=c++0x",
            \       "hook/time/enable" : 1
            \   },
            \}

let g:ctrlp_use_migemo = 1
let g:ctrlp_clear_cache_on_exit = 0   " 終了時キャッシュをクリアしない
let g:ctrlp_mruf_max            = 500 " MRUの最大記録数
let g:ctrlp_open_new_file       = 1   " 新規ファイル作成時にタブで開く
let g:ctrlp_map = '<c-@>'
" noremap <C-a> <C-d>
   " noremap <C-q> <C-f>
   " noremap <C-u> <C-b>
   " let g:ac_smooth_scroll_no_default_key_mappings = 1
   "    let g:ac_smooth_scroll_enable_accelerating = 0
   "  let g:ac_smooth_scroll_du_sleep_time_msec = 0
   "    let g:ac_smooth_scroll_fb_sleep_time_msec = 0

   " nmap <silent> <C-q> <Plug>(ac-smooth-scroll-c-d)
   " nmap <silent> <C-u> <Plug>(ac-smooth-scroll-c-u)
   " nmap <silent> <C-q> <Plug>(ac-smooth-scroll-c-f)<CR>
   " nmap <silent> <C-q> <Plug>(ac-smooth-scroll-c-b)<CR>
