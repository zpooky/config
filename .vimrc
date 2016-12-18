" pathogen plugin manager
execute pathogen#infect()

"
if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
  set t_Co=256
  " let g:solarized_termcolors = 256
endif

" Tagbar
let g:tagbar_show_linenumbers = 1 " display line number in the tagbar pane

" general
" set cursorline                    " Higlight current line
let mapleader = "\<Space>"        " map leader to  <space>
set relativenumber                " relative line numbers
set number                        " both relative and absolute number
set nocompatible                  " Turn off vi compatibility.
" set mouse=a                       " Enables scrolling in the terminal.

" search
set incsearch                     " search wile you type
set smartcase                     " Case insensitive search, except when capital letters are used.
set ic                            " ignore case when searching
set hls                           " highligt search?

" language
set spelllang=en_gb,sv              " Specify the spell checking language.
set nospell                       " Disable spell checking by default.
"
scriptencoding utf-8
set encoding=utf-8

" theme
syntax enable                         " Highlight the syntax.
" colorscheme solarized
" if has('gui_running')
"     set background=light
" let g:solarized_contrast="high"
" else
"     set background=dark
" endif 

"
set nowrap        " don't wrap lines
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set shiftwidth=2  " number of spaces to use for autoindenting
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
"
set ruler                         " Display the ruler
" Tab config
set tabstop=2
set shiftwidth=2
set expandtab

"
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting

" file type specific indentention support 
filetype plugin on                " Enable file type plug-ins
filetype on                       " Enable file type detection
set smartindent                   " smart indentation
" vim2hs
let g:haskell_conceal_wide = 1

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" syntastic conf
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=5 " height of error split

"
let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

"syntastic c++
let g:syntastic_cpp_compiler = 'gcc'
" let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = "-std=c++14 -Wall -Wextra -Wpedantic"
" let g:syntastic_cpp_compiler_options = ' -std=c++14 -stdlib=libc++'
let g:syntastic_cpp_check_header = 1
"let g:syntastic_cpp_checkers=["clang_check","g++","cpp_check"]
let g:syntastic_cpp_checkers=["gcc","cppcheck","cpplint"]
let g:syntastic_cppcheck_config_file="~/.syntastic_cppcheck_config"

" YouCompleteMe
let g:ycm_show_diagnostics_ui = 0
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_confirm_extra_conf = 0                  " disable confirm
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra'

hi clear SpellBad
hi SpellBad cterm=underline

" clang format
let g:clang_format#style_options = {
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "Cpp11",
            \ "AllowShortFunctionsOnASingleLine" : "None",
            \ "BasedOnStyle" : "LLVM"}
" clang format - map to <Leader>cf in C++ code(\cf)
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>f :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>f :ClangFormat<CR>

" ctags - look in the current directory for 'tags',
" and work up the tree towards root until one is found
set tags=./.tags;/
" open tag
map <silent> <F3> <c-]>
" open tag in vertical split
map <silent> <leader><F3> <a-]>
" previous 
map <silent> <A-Left> <c-t>

" TComment
nmap <leader>c :TComment<CR>
nmap <leader>= :TCommentBlock<CR>

" Tcomment visual
vmap <leader>c :TComment<CR>
vmap <leader>= :TCommentBlock<CR>

" tagbar
nmap <silent> <F10> :TagbarToggle<CR>
imap <silent> <F10> <ESC>:TagbarToggle<CR>
cmap <silent> <F10> <ESC>:TagbarToggle<CR>

" nerdtree
map <silent> <F8> :NERDTreeToggle<CR>
imap <silent> <F8> <ESC>:NERDTreeToggle<CR>
cmap <silent> <F8> <ESC>:NERDTreeToggle<CR>
let NERDTreeIgnore = [
    \ '\.pyc$',
    \ '\.class$',
    \ '\.cm\(x\(a\)\?\|i\|t\)$',
    \ '\.sp\(o\|i\)t$',
    \ '\.o\(\(pt\|mc\)\)\=$',
\ '\.annot$'] " Ignores

let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowHidden=1  " show hidden dotfiles

" CommandT
noremap <silent> <leader>r <Esc>:CommandT<CR>
" noremap <silent> <leader>O <Esc>:CommandTFlush<CR>
noremap <silent> <leader>m <Esc>:CommandTBuffer<CR>
noremap <silent> <leader>. :CommandTTag<cr>

" vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1 " Highlighting of class scope
let g:cpp_experimental_template_highlight = 1 " Highlighting of template functions

":CommandTMRU

" Alias
" set pastetoggle=<F2>

" Alternative save
nnoremap <leader>w :wa<CR>
" Alternative quit
nnoremap <leader>q :q<CR>
" map å to page up
map <silent> å <PageUp>
" map ä to page down
map <silent> ä <PageDown>

" resize split
map <silent> <leader>- <C-W><
map <silent> <leader>+ <C-W>>
" navigate between splits
" pane Left
map <silent> <leader><Left> <C-W><Left>
" pane Right
map <silent> <leader><Right> <C-W><Right>
" pane Up
map <silent> <leader><Up> <C-W><Up>
" pane Down
map <silent> <leader><Down> <C-W><Down>

" Create vertical pane
nnoremap <leader>s :vsplit<enter>


" new line above and below without entering insert mode
map <silent> <leader>o o<esc>
map <silent> <leader>O O<esc>

map <silent> ö <C-D>
map <silent> Ö <C-U>

" insert character(space+*char*)
" nmap <Space> i_<Esc>r " Need to have another than space it is now the leadr
" nmap <S-Enter> O<Esc>j

" YouCompleteMe - Install
" cd ~/.vim/bundle/YouCompleteMe;./install.sh --clang-completer

"
set history=1000         " remember more commands and search history
set undolevels=1000      " use many levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title

"
set novisualbell         " don't beep
set noerrorbells         " don't beep

"
set nobackup            " no bak
set noswapfile          " no swap
set autoread            " auto reload when changes

" Get rid of nasty lag on ESC (timeout and ttimeout seem useless) sp??
au InsertEnter * set timeoutlen=1
au InsertLeave * set timeoutlen=1000
set timeoutlen=1000 ttimeoutlen=0

" Stop that stupid window from popping up
map q: :q

"
au BufNewFile,BufRead *.md set ft=markdown
au FileType markdown,python set ts=2 sw=2 expandtab
au FileType gitcommit,md,txt set spell      " turn of spelling for thease types

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

" vim-autotool
let g:autotagTagsFile=".tags" " the ctag file name
" a.vim
" toggle between header and source
autocmd FileType c,cpp,objc,h map <silent> <F2> :A<CR>
" open source or header in vertical split
autocmd FileType c,cpp,objc,h map <silent> <leader><F2> :AV<CR>

" Powerline
set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
" Always show statusline
set laststatus=2
