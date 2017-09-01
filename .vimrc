" Turn off vi compatibility.(should be set first)
set nocompatible

" TODO
" # tag
" https://github.com/lyuts/vim-rtags
" https://github.com/Andersbakken/rtags/
" https://skebanga.github.io/rtags-with-cmake-in-spacemacs/
"
" https://github.com/rprichard/sourceweb

" # java dev
" http://eclim.org/
" http://www.lucianofiandesio.com/vim-configuration-for-happy-java-coding

" # Help
" :h tips

" # Depth Navigation
" gf        | goto file under cursor
" gd        | goto local declaration
" gD        | goto global declaration

" # Page Navigation
" C+D       | cursor half page DOWN
" C+U       | cursor half page UP

" # View Navigation
" C+e       | view line DOWN
" C+y       | view line UP

" # Text Navigation
" (         | backward sentence
" )         | forward sentence
" {         | backward paragraph
" }         | forward paragraph

" # Historic position navigation
" C+O       | OLDER position
" C+I       | NEWER position

" # Folding
" zi        | toggle global folding on/off
" za        | toggle fold on current line

" # Spelling
" leader+ss     : toggle spell checking TODO: it interferes with split(leader+s)
" gq            : reformat visual
" ctrl-n        : Next word suggestion
" ctrl-p        : Previous word suggestion
"
" z=            : list suggestions for word under cursor
" 1z=           : auto select 1 with showing suggestions
" :spellr       : Repeat the replacement done by z=
"
" ]s            : next wrongly spelled
" {s            : previous
" zg            : add word to dictonary

" #
" augroup   - ensures the autocmds are only applied once
" autocmd!  - directive clears all the autocmd's for the current group.
"             useful to avoid duplicated autocmd when file is sourced twice

" fold markers are {{{ and }}}
" set foldmethod=marker

" # c
" % jump between {} () []

" vim-plug {{{
call plug#begin('~/.vim/plugged')
" # vim        - plug commands
" :PlugInstall - Install plugins
" :PlugUpdate  - Install or update plugins
" :PlugUpgrade - Upgrade vimplug itself
" :PlugStatus  - Check the status of plugins which are loaded and so on
" :PlugDiff

" ###############
" # programming #
" ###############
let programming_ncpp=         {'for':[          'haskell','scala','java','python','vim','bash','sh','xml','markdown','conf','text','zsh','gdb','asm','nasm','make','m4','json','rust','ruby','yaml','sql','go','awk','html','cmake']}
let programming_ncpp_nhaskell={'for':[                    'scala','java','python','vim','bash','sh','xml','markdown','conf','text','zsh','gdb','asm','nasm','make','m4','json','rust','ruby','yaml','sql','go','awk','html','cmake']}
let programming=              {'for':['c','cpp','haskell','scala','java','python','vim','bash','sh','xml','markdown','conf','text','zsh','gdb','asm','nasm','make','m4','json','rust','ruby','yaml','sql','go','awk','html','cmake']}
let programming_nhaskell=     {'for':['c','cpp',          'scala','java','python','vim','bash','sh','xml','markdown','conf','text','zsh','gdb','asm','nasm','make','m4','json','rust','ruby','yaml','sql','go','awk','html','cmake']}
let programming_cpp=          {'for':['c','cpp']}
let programming_haskell=      {'for':'haskell'}
let programming_scala=        {'for':'scala'}

" framework for displaying warnings & errors in source code
Plug 'w0rp/ale',programming
" pane displaying tag information present in current file
Plug 'majutsushi/tagbar',programming_nhaskell
" comment toggle shortcut
Plug 'tomtom/tcomment_vim'
" ctags, cscope & global generation
Plug 'ludovicchabant/vim-gutentags',programming_nhaskell
" gtags support
Plug 'bbchung/gtags.vim',programming_nhaskell
" support for different code formatters
Plug 'Chiel92/vim-autoformat',programming
" exapnds () {} "" '' []
Plug 'Raimondi/delimitMate',programming_nhaskell

" #######
" # cpp #
" #######
Plug 'rhysd/vim-clang-format',programming_cpp
" toggle between src/header
Plug 'vim-scripts/a.vim',programming_cpp
" an alternative to color_coded
Plug 'octol/vim-cpp-enhanced-highlight',programming_cpp

" ###########
" # Haskell #
" ###########
" Haskell code completion
Plug 'eagletmt/neco-ghc',programming_haskell
Plug 'dag/vim2hs',programming_haskell

" #########
" # scala #
" #########
" scala support
Plug 'derekwyatt/vim-scala',programming_scala

" ##########
" # syntax #
" ##########
" rfc syntax
Plug 'vim-scripts/rfc-syntax', { 'for': 'rfc' }
" systemd syntax
Plug 'Matt-Deacalion/vim-systemd-syntax'
" markdown syntax
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

" ##########
" # text   #
" ##########
Plug 'reedes/vim-pencil', { 'for': 'markdown' }
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
autocmd FileType markdown map <F11> :Goyo <bar> :TogglePencil <CR>

" ########
" # tmux #
" ########
" Integrate split navigation with tmux
Plug 'christoomey/vim-tmux-navigator'

" ###########
" # general #
" ###########
" git integration
Plug 'tpope/vim-fugitive'
" file explorer
Plug 'scrooloose/nerdtree',{'on':'NERDTreeToggle'}
" fuzzy search (do step does not work)
Plug 'wincent/command-t',{'do':'rake make'}
" colors scope
Plug 'luochen1990/rainbow'
" Colorschemes
Plug 'flazz/vim-colorschemes'
" historic buffer navigation
Plug 'ton/vim-bufsurf'
" additional *in* support like ci, to change between two ,
Plug 'wellle/targets.vim'
" Centre search result
Plug 'wincent/loupe'

" TODO https://github.com/junegunn/vim-easy-align

" unmap some a.vim mappings
Plug '~/.vim/bundle/after',programming_cpp

" turned off in cygwin since these plugins requires compilation
if !has('win32unix') && !has('win64unix')
  " forked YCM for better cpp suggestions
  Plug '~/.vim/bundle/OblitumYouCompleteMe',programming_cpp
  " vanilla YCM
  Plug '~/.vim/bundle/YouCompleteMe',programming_ncpp_nhaskell
else
endif

call plug#end()
" }}}

" colorscheme
colorscheme railscasts

source $HOME/.standardvimrc

if has('win32unix') || has('win64unix')
  " in cygwin if we save a file not in dos mode outside the 'virtual' linux
  " prompt if it should not be in dos mode instead of the default unix
  " TODO should ignore special buffers like vim msg
  autocmd BufWritePre * if &ff != 'dos' && expand('%:p') =~ "^\/cygdrive\/d\/Worksapce\/" && expand('%:p') !~ "\/Dropbox\/" && input('set ff to dos [y]') == 'y' | setlocal ff=dos | endif
endif

" Pencil {{{
" TODO
" let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
let g:languagetool_jar  = '/opt/languagetool/languagetool-commandline.jar'
" }}}

" Tagbar {{{
let g:tagbar_show_linenumbers = 1 " display line number in the tagbar pane
" }}}

" vim2hs {{{
let g:haskell_conceal_wide = 1
" 0 = disable all conceals, including the simple ones like
" lambda and composition
" let g:haskell_conceal              = 1

" 0 = disable concealing of "enumerations": commatized lists like
" deriving clauses and LANGUAGE pragmas,
" otherwise collapsed into a single ellipsis
" let g:haskell_conceal_enumerations = 1

" }}}

" vim-scala {{{
let g:scala_use_default_keymappings = 0
" }}}

" rainbow scope {{{
" active rainbow scope higlight 
let g:rainbow_active = 1

"\ 'guifgs': ['darkorange3', 'seagreen3', 'deepskyblue', 'darkorchid3', 'forestgreen', 'lightblue', 'hotpink', 'mistyrose1'],
" \ 'operators': '_[\,\+\*\-\&\^\!\.\<\>\=\|\?]_',
", 'lightmagenta'
let g:rainbow_conf =
\ {
\ 'ctermfgs': ['lightblue', 'red', 'cyan', 'darkgreen'],
\ 'operators': '_[\,\-\<\>\.|]_'
\ }

" }}}

" DelimitMate {{{
let delimitMate_expand_cr = 1
" }}}

" ALE {{{
" :ALEInfo - current settings

"'clang', 'clangcheck', 'cpplint','cppcheck', 'clangtidy'
let g:ale_linters = {
\   'cpp': ['g++','cppcheck'],
\}

let g:ale_cpp_gcc_options="-std=c++17 -Wall -Wextra -Wpedantic -Iexternal"

" }}}

" YouCompleteMe {{{
" if exists( "g:loaded_youcompleteme" )
  " YouCompleteMe - Install
  " cd ~/.vim/bundle/YouCompleteMe;./install.sh --clang-completer

  let g:ycm_show_diagnostics_ui = 0
  let g:ycm_collect_identifiers_from_tags_files = 1
  let g:ycm_confirm_extra_conf = 0                        " disable confirm of project specific ycm conf

  let g:ycm_autoclose_preview_window_after_completion = 0 " do not directly close prototype window
  let g:ycm_autoclose_preview_window_after_insertion = 1  " close it when I exit insert mode.
  let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'

  " " ycm ultisnip integration
  " " YCM + UltiSnips works like crap
  " " https://www.youtube.com/watch?v=WeppptWfV-0
  " let g:ycm_use_ultisnips_completer = 1
  " let g:ycm_key_list_select_completion=[]
  " let g:ycm_key_list_previous_completion=[]
  " let g:UltiSnipsExpandTrigger = '<Tab>'
  " let g:UltiSnipsJumpForwardTrigger = '<Tab>'
  " let g:UltiSnipsJumpBackwardTrigger = '<S-Tab>'
  "
  " let g:UltiSnipsMappingsToIgnore = ['autocomplete']
  "
  " let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
  " let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
  " let g:ycm_key_list_accept_completion = ['<C-y>']

  " using Ycm to navigate
  " https://github.com/Valloric/YouCompleteMe#goto-commands
  map <silent> <F3> <esc>:YcmCompleter GoTo<CR>
  "
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

" endif
" }}}

" gdb {{{
" function! JobCallback(self, data) abort
"   echom string([a:self, a:data])
" endfunction
function! GDBBreak()
  let l:command1 = "echo 'break \"" . bufname("%") . ":" .line(".") . "\"' >> .gdb_breakpoints"
  let l:command2 = "cat .gdb_breakpoints | sort | uniq > .gdb_breakpoints"

  if v:version < 800
      silent execute "!" . l:command1
      silent execute "!" . l:command2
      execute ':redraw!'
    return
  endif
  let l:shell_command = [&shell, &shellcmdflag, l:command1 . "&&" . l:command2]
  let j = job_start(l:shell_command) ", {'out_cb': 'JobCallback', 'exit_cb': 'JobCallback'}
endfunction

command! GDBBreak :call GDBBreak()
autocmd FileType c,cpp,objc nnoremap <silent> <leader>j <esc>:GDBBreak<CR>
" }}}

" vim-cpp-enhanced-highlight {{{
let g:cpp_class_scope_highlight = 0 " Highlighting of class scope
let g:cpp_experimental_template_highlight = 1 " Highlighting of template functions
" }}}

" clang format {{{
let g:clang_format#style_options = {
            \ "AlwaysBreakTemplateDeclarations" : "true",
            \ "Standard" : "Cpp11",
            \ "AllowShortFunctionsOnASingleLine" : "None",
            \ "BasedOnStyle" : "LLVM"}
" clang format - map to <Leader>cf in C++ code(\cf)
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>f <esc>:<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>f <esc>:ClangFormat<CR>
" }}}

" format json {{{
function! FormatJson()
  :mark o
  " format json file using 2 space indentation
  exec "%!python ~/dotfiles/lib/json_format.py 2"
  :normal `o
endfunction!
command! FormatJson :call FormatJson()
autocmd FileType json nnoremap <buffer><leader>f <esc>:FormatJson<CR>
" }}}

" yapf {{{
" framework for code formatters

" format python
let g:formatter_yapf_style = 'chrome'

" vim-autoformat language formatters
" - tidy for HTML, XHTML and XML(apt-get)
autocmd FileType java,python,html,css,markdown,haskell,xml nnoremap <buffer><leader>f :Autoformat<CR>
" }}}

" ctags {{{
" ctags - look in the current directory for 'tags',
" and work up the tree towards root until one is found
set tags=./.tags;/

" open tag
" map <silent> <F3> <c-]>
" open tag in vertical split
map <silent> <leader><F3> <a-]>
" previous
" map <silent> <A-Left> <c-t>
" }}}

" TComment {{{
nmap <leader>c <esc>:TComment<CR>
nmap <leader>= <esc>:TCommentBlock<CR>

" Tcomment visual
vmap <leader>c :TComment<CR>
vmap <leader>= :TCommentBlock<CR>
" }}}

" tagbar {{{
nmap <silent> <F10> <esc>:TagbarToggle<CR>
imap <silent> <F10> <ESC>:TagbarToggle<CR>
cmap <silent> <F10> <ESC>:TagbarToggle<CR>
" }}}

" nerdtree {{{
map <silent> <F8> <esc>:NERDTreeToggle<CR>
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
let NERDTreeShowHidden = 1  " show hidden dotfiles

" }}}

" CommandT {{{
noremap <silent> <leader>r <Esc>:CommandT<CR>
" noremap <silent> <leader>O <Esc>:CommandTFlush<CR>
noremap <silent> <leader>m <Esc>:CommandTBuffer<CR>
noremap <silent> <leader>. <esc>:CommandTTag<cr>

" }}}

" a.vim {{{
" toggle between header and source
autocmd FileType c,cpp,objc map <silent> <F2> :A<CR>
" open source or header in vertical split
autocmd FileType c,cpp,objc map <silent> <leader><F2> :AV<CR>
" }}}

" Statusline {{{
" Powerline
" set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/
set rtp+=/usr/lib/python2.7/site-packages/powerline/bindings/vim
" Always show statusline
set laststatus=2
" }}}

" gutentags {{{
let g:gutentags_modules=['ctags', 'gtags_cscope']
let g:gutentags_ctags_executable="ctags"
let g:gutentags_ctags_tagfile=".tags"
let g:gutentags_generate_on_missing=1
let g:gutentags_background_update=1

" let g:gutentags_ctags_executable_cpp="ctag"

let g:gutentags_project_info=[]
call add(g:gutentags_project_info, {'type': 'python', 'file': 'setup.py'})
call add(g:gutentags_project_info, {'type': 'ruby', 'file': 'Gemfile'})
call add(g:gutentags_project_info, {'type': 'haskell', 'glob': '*.cabal'})
call add(g:gutentags_project_info, {'type': 'haskell', 'file': 'stack.yaml'})

" gtags
let g:gutentags_gtags_executable="gtags"
let g:gutentags_gtags_cscope_executable = 'gtags-cscope'
let g:gutentags_auto_add_gtags_cscope = 1

" }}}
