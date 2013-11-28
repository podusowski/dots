if exists("b:current_syntax")
  finish
endif

syn match k3txtFunctionEnter "Function Enter.*" contains=k3txtParamName
syn match k3txtFunctionLeave "Function Leave.*"  contains=k3txtParamName
syn match k3txtParamName "[a-zA-Z0-9]*:=" contains=k3txtParamValue
syn match k3txtParamValue ":=[a-zA-Z0-9_\*\?-]*"
syn match k3txtAnyPort "ANY PORT.receive"
syn match k3txtSackMsg "SACK\.[a-zA-Z0-9_]*\(Req\|Resp\|Ind\)"
syn match k3txtTrash "^[0-9T\.]* "
syn keyword k3txtMismatch MISMATCH
syn match k3NewVerdict "New verdict.*"
syn match k3FinalVerdict "Final Verdict:.*"
syn match k3txtFilename "[a-zA-Z0-9\.]*\.ttcn3"
syn match k3txtPort "[a-zA-Z0-9]*Port"
syn match k3txtComponent "\(Fsp-[0-9]\|Fcm\|Btsom\|MTC\|k3r\)"

hi link k3txtAnyPort Error
hi link k3txtMismatch Error
"hi link k3txtSackMsg Type
hi link k3txtPort k3txtSackMsg
hi link k3txtComponent Constant

hi k3txtFunctionEnter          guifg=brown      guibg=darkgray      gui=BOLD      ctermbg=NONE     ctermfg=green     cterm=BOLD
hi k3txtFunctionLeave          guifg=cyan       guibg=darkgray      gui=bold      ctermbg=NONE      ctermfg=gray     cterm=NONE
hi k3txtParamName              guifg=magenta    guibg=darkgray      gui=bold      ctermbg=NONE      ctermfg=yellow     cterm=NONE
hi k3txtParamValue             guifg=blue       guibg=darkgray      gui=bold      ctermbg=NONE      ctermfg=blue     cterm=NONE
hi k3txtTrash                      guifg=green      guibg=darkgray      gui=NONE      ctermfg=darkgray     ctermbg=NONE     cterm=NONE

hi k3txtSackMsg                 guifg=magenta    guibg=darkgray      gui=bold      ctermbg=NONE      ctermfg=yellow     cterm=BOLD
hi k3FinalVerdict               guifg=orange      guibg=darkgray      gui=bold      ctermbg=NONE     ctermfg=red     cterm=BOLD
hi k3NewVerdict               guifg=orange      guibg=darkgray      gui=bold      ctermbg=NONE     ctermfg=yellow     cterm=BOLD
hi k3txtFilename             guifg=blue       guibg=darkgray      gui=bold      ctermbg=NONE      ctermfg=gray     cterm=BOLD

let b:current_syntax = "nsn-k3txt"
