function! myspacevim#before() abort
  let g:airline#extensions#coc#enabled = 1
endfunction

function! myspacevim#after() abort
  """
  " For CoC Scala
  """
  " Smaller updatetime for CursorHold & CursorHoldI
  set updatetime=300

  " always show signcolumns
  set signcolumn=yes

  " Some server have issues with backup files, see #649
  set nobackup
  set nowritebackup

  set wildmode=list:longest,full

  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')


  " Use `[c` and `]c` for navigate diagnostics
  " nmap <silent> [c <Plug>(coc-diagnostic-prev)
  " nmap <silent> ]c <Plug>(coc-diagnostic-next)

  " Remap keys for gotos
  "nmap <silent> gd <Plug>(coc-definition)
  "nmap <silent> gy <Plug>(coc-type-definition)
  "nmap <silent> gi <Plug>(coc-implementation)
  "nmap <silent> gr <Plug>(coc-references)

  " Remap for do codeAction of current line
  "nmap <leader>ac <Plug>(coc-codeaction)

  " Remap for do action format
  "nnoremap <silent> F :call CocAction('format')<CR>

  " Remap for rename current word
  " nmap <leader>rn <Plug>(coc-rename)

  " Show all diagnostics
  "nnoremap <silent> <leader>a  :<C-u>CocList diagnostics<cr>
  " Find symbol of current document
  "nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>
  " Search workspace symbols
  "nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  "nnoremap <silent> <leader>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  "nnoremap <silent> <leader>k  :<C-u>CocPrev<CR>
  " Resume latest coc list
  "nnoremap <silent> <leader>p  :<C-u>CocListResume<CR>

  function! CocExtensionStatus() abort
    return get(g:, 'coc_status', '')
  endfunction
  let g:airline_section_c = '%f%{CocExtensionStatus()}'

  " Notify coc.nvim that <enter> has been pressed.
  " Currently used for the formatOnType feature.
  "inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
  "      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
  """
  " End Coc Scala
  """
endfunction
