"     k
" h     l
"   j

" Turn off vi compatibility.(should be set first)
set nocompatible

if has('win32') || has('win64')
  source D:\cygwin64\home\fredrik\.standardvimrc

  let g:python_host_prog = "C:\\Python27\\python.exe"
  let g:python3_host_prog = "C:\\Python36\\python.exe"
else
  source $HOME/.standardvimrc
endif

" TODO
" # rtag
" https://github.com/lyuts/vim-rtags
" https://github.com/Andersbakken/rtags/
" https://skebanga.github.io/rtags-with-cmake-in-spacemacs/

" https://github.com/rprichard/sourceweb

" # java dev
" http://eclim.org/
" http://www.lucianofiandesio.com/vim-configuration-for-happy-java-coding

" # other plugins
" https://github.com/tpope/vim-surround & https://github.com/machakann/vim-sandwich
"
" https://github.com/junegunn/vim-easy-align
"
" # vim-easymotion(like navigation like quitebrowser)
" http://sherifsoliman.com/2016/05/30/favorite-vim-plugins/#vim-easymotion
"
" # for python
" http://sherifsoliman.com/2016/05/30/favorite-vim-plugins/#vim-indent-guides
"
" # better terminal integration
" https://github.com/wincent/terminus

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
" <f6>          : toggle spell checking
" <leader>z     : word auto suggestions
" zn            : next wrongly spelled
" zp            : previous wrongly spelled
" zg            : to add word to own spellfile

" z=            : list suggestions for word under cursor
" 1z=           : auto select 1 with showing suggestions
" :spellr       : Repeat the replacement done by z=
"
" zg            : add word to dictonary

" # Formatting
" gq            : reformat visual according to textwidth rules
" =             : reformat visual according to indentation

" #
" augroup   - ensures the autocmds are only applied once
" autocmd!  - directive clears all the autocmd's for the current group.
"             useful to avoid duplicated autocmd when file is sourced twice

" # vim-surround
" ds(   - delete surrounding '()'
" cs([  - change surrounding '()' to '[]'
" ysiw] - surround 'iw' with '[]'
" S(    - in Visual mode sorrund selected with '()'

" fold markers are {{{ and }}}
" set foldmethod=marker

" # c
" % jump between {} () []

" # Key Mapping
" prefix:
" (empty):  Normal, Visual+Select, Operator-Pending
" n: Normal only
" v: Visual+Select
" o: Operator-Pending
" x: Visual only
" s: Select only
" i: Insert
" c: Command-line

" *prefix*map     - Define Recursive key mapping
" *prefix*noremap - Define None recursive key mapping
" *prefix*unmap   - Undefine key mapping?

" :*prefix*map - list keymappings

" # Terminal Options
" :h termina-options

" vim-plug {{{
call plug#begin('~/.vim/plugged')

let programming_ncpp=         {'for':[          'haskell','scala','java','python','vim','bash','sh','xml','markdown','conf','text','zsh','gdb','asm','nasm','make','m4','json','rust','ruby','yaml','sql','go','awk','html','cmake','javascript','ocaml']}
let programming_ncpp_nhaskell={'for':[                    'scala','java','python','vim','bash','sh','xml','markdown','conf','text','zsh','gdb','asm','nasm','make','m4','json','rust','ruby','yaml','sql','go','awk','html','cmake','javascript','ocaml']}
let programming=              {'for':['c','cpp','haskell','scala','java','python','vim','bash','sh','xml','markdown','conf','text','zsh','gdb','asm','nasm','make','m4','json','rust','ruby','yaml','sql','go','awk','html','cmake','javascript','ocaml']}
let programming_nhaskell=     {'for':['c','cpp',          'scala','java','python','vim','bash','sh','xml','markdown','conf','text','zsh','gdb','asm','nasm','make','m4','json','rust','ruby','yaml','sql','go','awk','html','cmake','javascript','ocaml']}
let programming_cpp=          {'for':['c','cpp']}
let programming_haskell=      {'for':'haskell'}
let programming_scala=        {'for':'scala'}

let neovim_update_remote={ 'do': ':UpdateRemotePlugins' }

if has('nvim')
  " Deoplete {{{
  Plug 'Shougo/deoplete.nvim',neovim_update_remote
  let g:deoplete#enable_at_startup = 1
  " }}}

  " Deoplete-clang {{{
  Plug 'zchee/deoplete-clang'
  let g:deoplete#sources#clang#libclang_path=""
  let g:deoplete#sources#clang#clang_header=""
  " }}}
else
  " turned off in cygwin since these plugins requires compilation
  if !has('win32unix') && !has('win64unix')
    " YouCompleteMe {{{
    " forked YCM for better cpp suggestions
    Plug '~/.vim/bundle/OblitumYouCompleteMe',programming_cpp
    " vanilla YCM
    Plug '~/.vim/bundle/YouCompleteMe',programming_ncpp_nhaskell

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

    " }}}
  else
    " {{{
    Plug 'Rip-Rip/clang_complete',{'do':'make install','for':['cpp','c']}
    let g:clang_close_preview = 1
    set completeopt-=preview
    " }}}
  endif

endif

" {{{
" :NR
Plug 'chrisbra/NrrwRgn',programming
" }}}

" ALE {{{
" framework for displaying warnings & errors in source code
Plug 'w0rp/ale',programming

" :ALEInfo - current settings

"'clang', 'clangcheck', 'cpplint','cppcheck', 'clangtidy'
let g:ale_linters = {
\   'cpp': ['g++','cppcheck'],
\   'c': ['gcc','cppcheck'],
\}

let g:ale_cpp_gcc_options="-std=c++17 -Wall -Wextra -Wpedantic -Iexternal -I../external -I../external/googletest/googletest -Iexternal/googletest/googletest -Werror-pointer-arith"
" }}}

" DelimitMate {{{
" exapnds () {} "" '' []
Plug 'Raimondi/delimitMate',programming_nhaskell

let delimitMate_expand_cr = 1
" }}}

" Tagbar {{{
" pane displaying tag information present in current file
" Plug 'majutsushi/tagbar',programming_nhaskell

let g:tagbar_show_linenumbers = 1 " display line number in the tagbar pane

" }}}

" TComment {{{
" comment toggle shortcut
Plug 'tomtom/tcomment_vim'
nmap <leader>c <esc>:TComment<CR>
nmap <leader>= <esc>:TCommentBlock<CR>

" Tcomment visual
vmap <leader>c :TComment<CR>
vmap <leader>= :TCommentBlock<CR>
" }}}

" {{{
if !has('win32unix') && !has('win64unix')
  " gutentags {{{
  " ctags, cscope & global generation
  Plug 'ludovicchabant/vim-gutentags',programming_nhaskell

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

  " gtags support
  Plug 'bbchung/gtags.vim',programming_nhaskell
endif
" }}}

" neoformat {{{
" support for different code formatters
Plug 'sbdchd/neoformat'

let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_only_msg_on_error = 1

augroup AutogroupNeoformat
  autocmd!
  autocmd FileType c,cpp nnoremap <buffer><leader>f <esc>:Neoformat<CR>
  autocmd FileType c,cpp vnoremap <buffer><leader>f <esc>:Neoformat<CR>
augroup END
" }}}

" Codi {{{
" repl based on content from current file
Plug 'metakirby5/codi.vim', { 'on': 'Codi' }

let g:codi#interpreters = {
      \ 'python': {
      \ 'bin': 'python3',
      \ },
      \ }
" # vim             command
" Codi [filetype] - activates Codi
" Codi!           - deactivates Codi
" }}}

" {{{
" #######
" # cpp #
" #######
" a.vim {{{
" toggle between src/header
Plug 'micbou/a.vim',programming_cpp
augroup AugroupAVIM
  autocmd!
  " toggle between header and source
  autocmd FileType c,cpp,objc map <silent> <F2> :A<CR>
  " open source or header in vertical split
  autocmd FileType c,cpp,objc map <silent> <leader><F2> :AV<CR>

augroup END
" }}}

" unmap some a.vim mappings
Plug '~/.vim/bundle/after',programming_cpp
" }}}

" {{{
if has('win32unix') || has('win64unix') || has('win32') || has('win64') || !has('nvim')
  " {{{
  " better c++ syntax
  Plug 'octol/vim-cpp-enhanced-highlight',programming_cpp
  " }}}
else
  " Chromatica {{{
  Plug 'arakashic/chromatica.nvim',programming_cpp,neovim_update_remote
  let g:chromatica#enable_at_startup=1
  let g:chromatica#responsive_mode = 1
  if has('win32') || has('win64')
    let g:chromatica#libclang_path="D:\\Program Files\\LLVM\\lib\\libclang.lib"
  endif
  " }}}
endif
" }}}

" {{{
" ###########
" # Haskell #
" ###########
" Haskell code completion
Plug 'eagletmt/neco-ghc',programming_haskell

" vim2hs {{{
Plug 'dag/vim2hs',programming_haskell

let g:haskell_conceal_wide = 1
" 0 = disable all conceals, including the simple ones like
" lambda and composition
" let g:haskell_conceal              = 1

" 0 = disable concealing of "enumerations": commatized lists like
" deriving clauses and LANGUAGE pragmas,
" otherwise collapsed into a single ellipsis
" let g:haskell_conceal_enumerations = 1

" }}}

" }}}

" {{{
" #########
" # scala #
" #########
" vim-scala {{{
" scala support
Plug 'derekwyatt/vim-scala',programming_scala

let g:scala_use_default_keymappings = 0
" }}}
" }}}

" {{{
" ##########
" # syntax #
" ##########
" rfc syntax
Plug 'vim-scripts/rfc-syntax', { 'for': 'rfc' }
" systemd syntax
Plug 'Matt-Deacalion/vim-systemd-syntax'
" }}}

" {{{
" ##########
" # text   #
" ##########

" Pencil {{{
Plug 'reedes/vim-pencil', { 'for': 'markdown' }

" hardwrap - vim adds newlines character when line is to long
" softwrap - vim presents long lines wrapped over multiple lines

" TODO
" let g:pencil#wrapModeDefault = 'hard'
" augroup AutogroupPencil
"   autocmd!
"   autocmd FileType markdown,mkd call pencil#init()
"   autocmd FileType text         call pencil#init({'wrap': 'hard'})
"   autocmd FileType gitcommit         call pencil#init({'wrap': 'hard'})
" augroup END

" affects HardPencil only - blacklist formatting for text with tagged by these syntax
" highlight group
let g:pencil#autoformat_config = {
      \   'markdown': {
      \     'black': [
      \       'htmlH[0-9]',
      \       'markdown(Code|H[0-9]|Url|IdDeclaration|Link|Rule|Highlight[A-Za-z0-9]+)',
      \       'markdown(FencedCodeBlock|InlineCode)',
      \       'mkd(Code|Rule|Delimiter|Link|ListItem|IndentCode)',
      \       'mmdTable[A-Za-z0-9]*',
      \     ],
      \     'white': [
      \      'markdown(Code|Link)',
      \     ],
      \   },
      \ }
" }}}

" Goyo {{{
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }

augroup AutogroupGoyo
  autocmd!
  autocmd FileType markdown,mail,text,gitcommit map <silent> <F11> <Esc> :Goyo <Bar> :TogglePencil <CR>
augroup END
" }}}

" markdown syntax
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'reedes/vim-colors-pencil'   " http://sherifsoliman.com/2016/05/30/favorite-vim-plugins/#vim-colors-pencil
" }}}

" {{{
" ########
" # tmux #
" ########
" Integrate split navigation with tmux
Plug 'christoomey/vim-tmux-navigator'
" makes in tmux switching to a vim pane trigger an on-focus event
Plug 'tmux-plugins/vim-tmux-focus-events'
" }}}

" {{{
" ########
" # git  #
" ########
" better git commmit interface
Plug 'rhysd/committia.vim'
Plug 'tpope/vim-fugitive'
" }}}


" {{{
" adds commands to surround: XwordX
Plug 'tpope/vim-surround'
" to make repeat(.) work with vim-surround
Plug 'tpope/vim-repeat'
" }}}

" CommandT {{{
" fuzzy search (TODO do step does not work)
Plug 'wincent/command-t',{'do':'rake make'}

noremap <silent> <leader>r <Esc>:CommandT<CR>
" noremap <silent> <leader>O <Esc>:CommandTFlush<CR>
noremap <silent> <leader>m <Esc>:CommandTBuffer<CR>
noremap <silent> <leader>. <esc>:CommandTTag<cr>
" }}}

" tagbar {{{
" pane displaying tag information present in current file
" Plug 'majutsushi/tagbar',programming_nhaskell

nmap <silent> <F10> <esc>:TagbarToggle<CR>
imap <silent> <F10> <ESC>:TagbarToggle<CR>
cmap <silent> <F10> <ESC>:TagbarToggle<CR>
" }}}

" nerdtree {{{
" file explorer
" Plug 'scrooloose/nerdtree',{'on':'NERDTreeToggle'}

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

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
augroup AutogroupNerdTree
  autocmd!
  autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
augroup END

function! s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction
" }}}

" rainbow scope {{{
" colors scope () {}
Plug 'luochen1990/rainbow'

" activate rainbow scope higlight
let g:rainbow_active = 1

"\ 'guifgs': ['darkorange3', 'seagreen3', 'deepskyblue', 'darkorchid3', 'forestgreen', 'lightblue', 'hotpink', 'mistyrose1'],
" \ 'operators': '_[\,\+\*\-\&\^\!\.\<\>\=\|\?]_',
", 'lightmagenta'
" #ff9900   | orange
" #ff1493   | pink
" #9acd32   | green
" #9400d3   | magenta
" #696969   | grey
" #4169e1   | dark blue
" #dc143c   | red
" #00ced1   | baby blue
" #008000   | dark green
let g:rainbow_conf =
      \ {
      \ 'ctermfgs': ['lightblue', 'red', 'cyan', 'darkgreen'],
      \ 'guifgs': ['#ff9900','#ff1493','#9acd32'],
      \ 'operators': '_[\,\-\<\>\.|\*]_'
      \ }
" }}}

" {{{
" historic buffer navigation
" TODO
" Plug 'ton/vim-bufsurf'
" }}}
"
" {{{
" additional *in* support like ci, to change between two ,
Plug 'wellle/targets.vim'
" }}}

" {{{
" Centre search result
" Plug 'wincent/loupe'
noremap n nzz
noremap N Nzz
" }}}

" {{{
" hint what char should used with f
" Plug 'unblevable/quick-scope'
Plug 'bradford-smith94/quick-scope'

" display only when these keys has been presed
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" }}}


" {{{
" Visual select + * will search the selected
Plug 'bronson/vim-visual-star-search'

" Statusline {{{
if has('win32unix') || has('win64unix') || $TERM == "linux" || has('nvim') || has('win32') || has('win64')
  Plug 'vim-airline/vim-airline'

  if has('win32unix') || has('win64unix') || has('win32') || has('win64')
    " augroup AutogroupCygwinCppVisual
    "   autocmd!
    " autocmd FileType cpp map <silent> <F11> <Esc> :set laststatus=0 <Bar> :AirlineToggle<CR>
    " augroup END
    map <silent> <F11> <Esc> :set laststatus=0 <Bar> :AirlineToggle<CR>
  endif
else
  python3 from powerline.vim import setup as powerline_setup
  python3 powerline_setup()
  python3 del powerline_setup
endif
  set laststatus=2
" }}}


" {{{
" translate colorc codes inline into colors
Plug 'chrisbra/Colorizer', { 'for': 'vim' }

" :ColorHighlight

" let g:colorizer_auto_filetype='vim'
let g:colorizer_colornames_disable = 1
" }}}

" {{{
Plug 'zpooky/tabline.vim'

" }}}

call plug#end()
" }}}

colorscheme codedark

" colorscheme {{{
" if has('win32unix') || has('win64unix')
  " wrk {{{
  " augroup AutogroupCppVisual
  "   autocmd!
    " autocmd FileType c,cpp colorscheme codedark
  " augroup END

" colorscheme base16
" colorscheme molokai
" colorscheme jellybeans      " ! https://github.com/nanotech/jellybeans.vim
" colorscheme pencil
" badwolf

set background=dark
" }}}

if has('win32unix') || has('win64unix')
  " in cygwin if we save a file not in dos mode outside the 'virtual' linux
  " prompt if it should not be in dos mode instead of the default unix
  " TODO should ignore special buffers like vim msg
  augroup AutogroupCygwin
    autocmd!
    autocmd BufWritePre * if &ff != 'dos' && expand('%:p') =~ "^\/cygdrive\/d\/Worksapce\/" && expand('%:p') !~ "\/Dropbox\/" && input('set ff to dos [y]') == 'y' | setlocal ff=dos | endif
  augroup END
endif


" Generic Writing {{{
" let g:languagetool_jar  = '/opt/languagetool/languagetool-commandline.jar'
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
  " let l:shell_command = [&shell, &shellcmdflag, l:command1 . "&&" . l:command2]
  let l:shell_command = [&shell, &shellcmdflag, l:command1]
  let j = job_start(l:shell_command) ", {'out_cb': 'JobCallback', 'exit_cb': 'JobCallback'}
endfunction

command! GDBBreak :call GDBBreak()
augroup AutogroupGDB
  autocmd!
  autocmd FileType c,cpp,objc nnoremap <leader>j <esc>:GDBBreak<CR>
augroup END
" }}}

" vim-cpp-enhanced-highlight {{{
let g:cpp_class_scope_highlight = 0           " Highlighting of class scope
let g:cpp_experimental_template_highlight = 0 " Highlighting of template functions
" let g:cpp_member_variable_highlight = 1
" }}}

" format json {{{
function! FormatJson()
  :mark o
  " format json file using 2 space indentation
  exec "%!python ~/dotfiles/lib/json_format.py 2"
  :normal `o
endfunction!
command! FormatJson :call FormatJson()

augroup AutogroupFormatJson
  autocmd!
  autocmd FileType json nnoremap <buffer><leader>f <esc>:FormatJson<CR>
augroup END
" }}}

" debug syntax {{{
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

command! SynStack :call SynStack()
map <F7> :SynStack<CR>
" }}}
