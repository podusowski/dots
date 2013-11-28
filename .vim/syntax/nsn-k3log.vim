
if exists("b:current_syntax")
  finish
endif

" syn match syslogNumber "\<\d*\>"

" cplane components
syn keyword dummy1 tcfi
syn keyword dummy2 setv
syn keyword dummy3 ENBCexe
syn keyword dummy4 UECexe
syn keyword dummy5 TUPcexe
syn keyword dummy6 BTSOMex

" headers
syn match syslogDbg "DBG/[/a-zA-Z0-9\._]*" nextgroup=syslogLineNumber
syn match syslogInf "INF/[/a-zA-Z0-9\._]*" nextgroup=syslogLineNumber
syn match syslogErr "ERR/[/a-zA-Z0-9\._]*" nextgroup=syslogLineNumber
syn match syslogWrn "WRN/[/a-zA-Z0-9\._]*" nextgroup=syslogLineNumber
syn match Error "ERR/CCS/AaError"

" syn match syslogLineNumber "#[0-9]*"

" time
syn match syslogTime "^\d*T\d*\.\d*"

" HW
" syn match Constant "\(FSP\|FCT\)-[0-9A-F]*"

" syn match syslogTrash "^[0-9 \.:\[\]a-fX]*"
"syn match syslogTrash ""
"syn match syslogTrash " [\dA-F]* \(INF\|DBG\|WRN\)"


" ids
"syn keyword Type timerId ThreadID ueContextId cellId

hi link systemComponent Type
hi link syslogLineNumber Constant
"hi link syslogDbg Comment
"hi link syslogInf Number
hi link syslogErr Error

hi dummy1                      guifg=brown      guibg=darkgray      gui=BOLD      ctermbg=brown     ctermfg=white     cterm=BOLD
hi dummy2                      guifg=cyan       guibg=darkgray      gui=bold      ctermbg=cyan      ctermfg=white     cterm=BOLD
hi dummy3                      guifg=magenta    guibg=darkgray      gui=bold      ctermbg=magenta   ctermfg=white     cterm=BOLD
hi dummy4                      guifg=blue       guibg=darkgray      gui=bold      ctermbg=blue      ctermfg=white     cterm=BOLD
hi dummy5                      guifg=green      guibg=darkgray      gui=bold      ctermbg=green     ctermfg=white     cterm=BOLD
hi dummy6                      guifg=orange      guibg=darkgray      gui=bold      ctermbg=yellow     ctermfg=white     cterm=BOLD

hi syslogDbg                      guifg=green      guibg=darkgray      gui=bold      ctermfg=darkgray     ctermbg=NONE     cterm=BOLD
hi syslogInf                      guifg=green      guibg=darkgray      gui=bold      ctermfg=darkgreen     ctermbg=NONE     cterm=BOLD
hi syslogWrn                      guifg=green      guibg=darkgray      gui=bold      ctermfg=darkyellow     ctermbg=NONE     cterm=BOLD

hi syslogTrash                      guifg=green      guibg=darkgray      gui=NONE      ctermfg=darkgray     ctermbg=NONE     cterm=NONE
hi syslogTime                      guifg=NONE      guibg=NONE      gui=NONE      ctermfg=darkgray     ctermbg=NONE     cterm=BOLD
hi syslogNumber                      cterm=BOLD


let b:current_syntax = "nsn-k3log"
