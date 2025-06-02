--this fix the identation on all files type ({} js problem)
vim.cmd([[
  " Default behavior: disable auto-indentation
  autocmd FileType * setlocal smartindent noautoindent nosmarttab
  autocmd FileType * setlocal indentexpr=
  
  " JavaScript-specific indentation rules
  autocmd FileType javascript,javascriptreact,typescript,typescriptreact setlocal
    \ smartindent
    \ autoindent
    \ cindent
    \ cinkeys+=0{,0},0(,0),:,0#,!^F,o,O,e
    \ indentkeys+=0{,0},0(,0),:,0#,!^F,o,O,e
]])
--
