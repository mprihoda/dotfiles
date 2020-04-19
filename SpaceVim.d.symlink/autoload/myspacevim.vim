function! myspacevim#before() abort
  autocmd FileType scala let b:coc_root_patterns = ['.bloop', 'build.toml', 'build.sbt', 'build.sc', 'build.gradle', 'pom.xml']
  let g:coc_config_home = '~/.SpaceVim.d'
  let g:airline#extensions#coc#enabled = 1
  let g:airline#extensions#keymap#enabled = 0
  """ Vim WIKI markdown syntax
  " let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
  let g:vimwiki_list = [{'path': '~/Documents/vimwiki/'}]
  let g:vimwiki_folding='expr'
  set foldlevelstart=2
  " Do not conceal on insert
  augroup myvimwiki
  autocmd!
  autocmd BufEnter,BufNewFile *.wiki nmap <silent><buffer> ]l <Plug>VimwikiNextLink
  autocmd BufEnter,BufNewFile *.wiki nmap <silent><buffer> [l <Plug>VimwikiPrevLink
  autocmd BufEnter,BufNewFile *.wiki setl foldmethod=expr tw=79
  augroup END
  """ End of Vim WIKI

  """ Czech settings
  set keymap=czech_utf-8
  " Reset to default right away
  set iminsert=0
  " Reset to no mapping after escape in insert mode
  inoremap <ESC> <ESC>:set iminsert=0<CR>
  " Use language map in search
  set imsearch=-1
  """ End Czech settings
  """ Set title by buffer
  set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)
  set title

  function! s:goyo_enter()
    if executable('tmux') && strlen($TMUX)
      silent !tmux set status off
      silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
    endif
    let s:orig_scrolloff = &scrolloff
    let s:orig_signcolumn = &signcolumn
    set noshowmode
    set noshowcmd
    set scrolloff=999
    set signcolumn=no
    Limelight
  endfunction

  function! s:goyo_leave()
    if executable('tmux') && strlen($TMUX)
      silent !tmux set status on
      silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
    endif
    set showmode
    set showcmd
    let &scrolloff = s:orig_scrolloff
    let &signcolumn = s:orig_signcolumn
    Limelight!
  endfunction

  " Improve Goyo
  autocmd! User GoyoEnter nested call <SID>goyo_enter()
  autocmd! User GoyoLeave nested call <SID>goyo_leave()
  " Goyo END

  augroup jrnl
    autocmd!
    autocmd BufRead jrnl*.txt setl nocindent nocopyindent nosmartindent textwidth=79 | Goyo 90
  augroup END

  " Set git editor for term mode
  if has('nvim')
    let $GIT_EDITOR = 'nvr -cc split --remote-wait'
  endif
endfunction

function! myspacevim#after() abort
  """ Date abbreviations
  iabbrev <expr> d\ strftime("%F")
  inoreabbrev <expr> dd\ strftime("%F %a")
  inoreabbrev <expr> dm\ strftime("%F %a", localtime() + 24 * 3600)
  iabbrev <expr> t\ strftime("%R")
  """ Redefine augroup Terminal to remove startinsert
  "augroup Terminal
  "  au!
  "  au TermOpen * let g:last_terminal_job_id = b:terminal_job_id | IndentLinesDisable
  "  au WinEnter,BufWinEnter term://* IndentLinesDisable
  "  if has('timers')
  "    au TermClose * let g:_spacevim_termclose_abuf = expand('<abuf>') | call timer_start(5, 'SpaceVim#mapping#close_term_buffer')
  "  else
  "    au TermClose * let g:_spacevim_termclose_abuf = expand('<abuf>') | call SpaceVim#mapping#close_term_buffer()
  "  endif
  "augroup END
  let g:indentLine_concealcursor = 'nc'
  """ <S-CR> does not work in vim in terminal, so let's remap jj to do the same
  inoremap jj <C-o>o

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

  "function! CocExtensionStatus() abort
  "  return get(g:, 'coc_status', '')
  "endfunction
  "let g:airline_section_c = '%f%{CocExtensionStatus()}'

  " Notify coc.nvim that <enter> has been pressed.
  " Currently used for the formatOnType feature.
  "inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
  "      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
  """
  " End Coc Scala
  """
endfunction
