set nocompatible

set nobackup
set noswapfile

set mouse=a
set title
set cursorline
set listchars=trail:.,tab:>-,eol:$
"match Todo '\%121v.*' 		" taki trick koloruje tekst ktory jest poza 120 kolumna
set laststatus=2
set statusline=%t:%l\ %#todo#%r%m%*\ %y\ %=\ %P 
set noequalalways

set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
"set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
"set incsearch     " show search matches as you type
"set ruler

set splitright
set expandtab

set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

set wmh=0

syntax on



" rainbow parentheses

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces



let mapleader=","

" change word under cursor: ,s
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

"
" scripts
"
function! OpenHeader()
  if match(expand("%"),'\.cpp') > 0
    let s:flipname = substitute(expand("%"),'\.cpp\(.*\)','\.hpp\1',"")
    let s:flipname = substitute(s:flipname,'Source','Include',"")
    exe ":vsplit " . s:flipname
  endif
endfun

function! JumpHeaderSource()
    let s:flipname = ""
    if( match(expand("%"),'\.cpp') > 0 ) 
        let s:flipname = substitute(expand("%:p"),'\.cpp\(.*\)','\.hpp\1',"")
        let s:flipname = substitute(s:flipname,'Source','Include',"")
    endif
    if( match(expand("%"),'\.hpp') > 0 ) 
        let s:flipname = substitute(expand("%:p"),'\.hpp\(.*\)','\.cpp\1',"")
        let s:flipname = substitute(s:flipname,'Include','Source',"")
    endif
    if( strlen(s:flipname) == 0)
        echo "Incorrect file format"
        return
    endif
    if filereadable(s:flipname)
        exe ":vsp " . s:flipname
    else
        echo "Can not open file: " . s:flipname
        return
    endif
endfun


"map <F2> :call OpenHeader()<CR>
map <F2> :call JumpHeaderSource()<CR>

au BufRead,BufNewFile *.ttcn* set filetype=ttcn
au! Syntax ttcn source ~/.vim/syntax/ttcn.vim

au BufRead,BufNewFile *.LOG* set filetype=nsn-syslog
au BufRead,BufNewFile *.out* set filetype=nsn-syslog
au! Syntax nsn-syslog source ~/.vim/syntax/nsn-syslog.vim

au BufRead,BufNewFile *.k3.txt* set filetype=nsn-k3txt
au! Syntax nsn-syslog source ~/.vim/syntax/nsn-k3txt.vim

au BufRead,BufNewFile *.particle set filetype=ogre3d_particle

au BufRead,BufNewFile *.target set filetype=make

au! Syntax pake source ~/.vim/syntax/pake.vim
au BufRead,BufNewFile *.pake set filetype=pake

let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
let Tlist_Use_Right_Window=1
map <F4> :TagbarToggle<cr>
map <F3> :NERDTreeToggle<cr>

filetype plugin on
set ofu=syntaxcomplete#Complete

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest
",preview

highlight Pmenu ctermbg=4 gui=bold

map <C-K> <C-W>k<C-W>_
map <C-J> <C-W>j<C-W>_
map <C-H> <C-W>h
map <C-L> <C-W>l
map <C-M> <C-W>_

" Window resizing mappings /*{{{*/
nnoremap <S-K> :normal <c-r>=Resize('+')<CR><CR>
nnoremap <S-J> :normal <c-r>=Resize('-')<CR><CR>
nnoremap <S-H> :normal <c-r>=Resize('<')<CR><CR>
nnoremap <S-L> :normal <c-r>=Resize('>')<CR><CR>

function! Resize(dir)
  let this = winnr()
  if '+' == a:dir || '-' == a:dir
  "  execute "normal \<c-w>k"
    let up = winnr()
    if up != this
      execute "normal \<c-w>j"
      let x = 'bottom'
    else
      let x = 'top'
    endif
  elseif '>' == a:dir || '<' == a:dir
   " execute "normal \<c-w>h"
    let left = winnr()
    if left != this
    "  execute "normal \<c-w>l"
      let x = 'right'
    else
      let x = 'left'
    endif
  endif
  if ('+' == a:dir && 'bottom' == x) || ('-' == a:dir && 'top' == x)
    return "5\<c-v>\<c-w>+"
  elseif ('-' == a:dir && 'bottom' == x) || ('+' == a:dir && 'top' == x)
    return "5\<c-v>\<c-w>-"
  elseif ('<' == a:dir && 'left' == x) || ('>' == a:dir && 'right' == x)
    return "5\<c-v>\<c-w><"
  elseif ('>' == a:dir && 'left' == x) || ('<' == a:dir && 'right' == x)
    return "5\<c-v>\<c-w>>"
  else
    echo "oops. check your ~/.vimrc"
    return ""
  endif
endfunction
" /*}}}*/ 

map <silent> <F5> :Rgrep<CR><CR><CR><CR>
let Grep_Skip_Files = 'tags *~' 
let Grep_Skip_Dirs = '.svn lteDo'

call pathogen#infect() 

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=l  "remove right-hand scroll bar

set t_Co=256
colorscheme wir_black

let g:autoclose_on = 1

" When searching for a string in file always scroll so that 3 lines before and
" after result are visible
set scrolloff=3

