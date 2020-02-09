"=============================================================================
" scala-metals.vim --- SpaceVim lang#scala layer for Metals
" Copyright (c) 2016-2019 Michal Příhoda
" Based on Wang Shidong's scala layer, updated for metals
" Author: Michal Příhoda < michal at prihoda.net >
" URL: https://spacevim.org
" License: GPLv3
"=============================================================================
scriptencoding utf-8


""
" @section lang#scala-metals, layer-lang-scala-metals
" @parentsection layers
" This layer is for Scala development with
" [Metals](https://scalameta.org/metals/).
"
" @subsection Mappings
" >
"   Import key bindings:
"
"   Mode      Key           Function
"   -------------------------------------------------------------
"   normal    SPC l i o     organize imports of current file
"   normal    SPC l i s     sort imports of current file
"   insert    <c-;>o        organize imports of current file
"   insert    <c-;>s        sort imports of current file
"
"   Sbt key bindings:
"
"   Mode      Key           Function
"   -------------------------------------------------------------
"   normal    SPC l b c     sbt clean compile
"   normal    SPC l b r     sbt run
"   normal    SPC l b t     sbt test
"   normal    SPC l b p     sbt package
"   normal    SPC l b d     sbt show project dependencies tree
"   normal    SPC l b l     sbt reload project build definition
"   normal    SPC l b u     sbt update external dependencies
"   normal    SPC l b e     run sbt to generate .ensime config file
"
"   Execute key bindings:
"
"   Mode      Key           Function
"   -------------------------------------------------------------
"   normal    SPC l r       run main class
"
"   REPL key bindings:
"
"   Mode      Key           Function
"   -------------------------------------------------------------
"   normal    SPC l s i     start a scala inferior REPL process
"   normal    SPC l s b     send buffer and keep code buffer focused
"   normal    SPC l s l     send line and keep code buffer focused
"   normal    SPC l s s     send selection text and keep code buffer focused
"
"   Other key bindings:
"
"   Mode      Key           Function
"   -------------------------------------------------------------
"   normal    SPC l Q       bootstrap server when first-time-use
"   normal    SPC l h       show Documentation of cursor symbol
"   normal    SPC l n       inline local refactoring of cursor symbol
"   normal    SPC l e       rename cursor symbol
"   normal    SPC l g       find Definition of cursor symbol
"   normal    SPC l t       show Type of expression of cursor symbol
"   normal    SPC l p       show Hierarchical view of a package
"   normal    SPC l u       find Usages of cursor symbol
"
" <
" This layer uses [Metals
" VIM](https://scalameta.org/metals/docs/editors/vim.html) extension using Coc
" and scalafmt for code formatting.

function! SpaceVim#layers#lang#scalametals#plugins() abort
  let plugins = [
        \ ['derekwyatt/vim-scala', {'on_ft': 'scala'}],
        \ ['scalameta/coc-metals', {'merged': 0, 'build': 'yarn install --frozen-lockfile'}]
        \ ]
  return plugins
endfunction


function! SpaceVim#layers#lang#scalametals#config() abort
  " The autocomplete method must be coc for this layer to work
  let g:spacevim_autocomplete_method = "coc"
  call SpaceVim#mapping#space#regesit_lang_mappings('scala',
        \ function('s:language_specified_mappings'))
  call SpaceVim#mapping#gd#add('scala',
        \ function('SpaceVim#lsp#go_to_def'))
  call SpaceVim#plugins#repl#reg('scala', 'scala')
  call SpaceVim#plugins#runner#reg_runner('scala', 'bloop run')
  call add(g:spacevim_project_rooter_patterns, 'build.sbt')
  augroup SpaceVim_lang_scala
    au!
    autocmd BufRead,BufNewFile *.sbt set filetype=scala
  augroup END

  " Do not use neoformat for formatting
  let g:neoformat_enabled_scala = []
endfunction


function! s:language_specified_mappings() abort
  " I know we have metals enabled, but there should be a way to let spacevim
  " know
  " if SpaceVim#layers#lsp#check_filetype('scala')
  nnoremap <silent><buffer> K :call SpaceVim#lsp#show_doc()<CR>
  nmap <silent><buffer> [n <Plug>(coc-diagnostic-prev)
  nmap <silent><buffer> ]n <Plug>(coc-diagnostic-next)
  nmap <silent><buffer> <leader>a <Plug>(coc-codeaction)
  call SpaceVim#mapping#space#langSPC('nnoremap', ['l', 'f'],
        \ 'call CocAction(''format'')', 'format file', 1)
  call SpaceVim#mapping#space#langSPC('nnoremap', ['l', 'a'],
        \ ':CocList diagnostics', 'show all diagnostics', 1)
  call SpaceVim#mapping#space#langSPC('nnoremap', ['l', 'o'],
        \ ':CocList outline', 'show outline', 1)
  call SpaceVim#mapping#space#langSPC('nnoremap', ['l', 's'],
        \ ':CocList -I symbols', 'show symbols', 1)
  call SpaceVim#mapping#space#langSPC('nnoremap', ['l', 'd'],
        \ 'call SpaceVim#lsp#show_doc()', 'show doc', 1)
  call SpaceVim#mapping#space#langSPC('nnoremap', ['l', 'e'],
        \ 'call SpaceVim#lsp#rename()()', 'rename symbol', 1)
  call SpaceVim#mapping#space#langSPC('nnoremap', ['l', 'g'],
        \ 'call SpaceVim#lsp#go_to_def()', 'goto definition', 1)
  call SpaceVim#mapping#space#langSPC('nnoremap', ['l', 'm'],
        \ 'call SpaceVim#lsp#go_to_impl()', 'goto impl', 1)
  call SpaceVim#mapping#space#langSPC('nnoremap', ['l', 'y'],
        \ 'call SpaceVim#lsp#go_to_typedef()', 'type definition', 1)
  call SpaceVim#mapping#space#langSPC('nnoremap', ['l', 'u'],
        \ 'call SpaceVim#lsp#references()', 'find references', 1)
  " inoremap <silent><expr> <c-space> coc#refresh()
  " endif

  " import `vim-scala`
  let g:_spacevim_mappings_space.l.i = {'name' : '+Import'}
  inoremap <silent><buffer> <C-;>s   <Esc>:SortScalaImports<CR>
  call SpaceVim#mapping#space#langSPC('nnoremap', ['l','i','s'],
        \ 'SortScalaImports', 'sort imports', 1)

  " code runner
  call SpaceVim#mapping#space#langSPC('nmap', ['l','r'],
        \ 'call SpaceVim#plugins#runner#open()', 'execute current file', 1)

  " Sbt
  let g:_spacevim_mappings_space.l.b = {'name' : '+Sbt'}
  call SpaceVim#mapping#space#langSPC('nnoremap', ['l','b', 'c'], 'call call('
        \ . string(function('s:execCMD')) . ', ["sbt ~compile"])',
        \ 'continuous-compile', 1)
  call SpaceVim#mapping#space#langSPC('nnoremap', ['l','b', 'C'], 'call call('
        \ . string(function('s:execCMD')) . ', ["sbt clean compile"])',
        \ 'clean-compile', 1)
  call SpaceVim#mapping#space#langSPC('nnoremap', ['l','b', 't'], 'call call('
        \ . string(function('s:execCMD')) . ', ["sbt test"])',
        \ 'sbt-test', 1)
  call SpaceVim#mapping#space#langSPC('nnoremap', ['l','b', 'p'], 'call call('
        \ . string(function('s:execCMD')) . ', ["sbt package"])',
        \ 'sbt-package-jar', 1)
  call SpaceVim#mapping#space#langSPC('nnoremap', ['l','b', 'd'], 'call call('
        \ . string(function('s:execCMD')) . ', ["sbt inspect tree compile:sources"])',
        \ 'show-dependencies-tree', 1)
  call SpaceVim#mapping#space#langSPC('nnoremap', ['l','b', 'l'], 'call call('
        \ . string(function('s:execCMD')) . ', ["sbt reload"])',
        \ 'reload-build-definition', 1)
  call SpaceVim#mapping#space#langSPC('nnoremap', ['l','b', 'u'], 'call call('
        \ . string(function('s:execCMD')) . ', ["sbt update"])',
        \ 'update-external-dependencies', 1)
  call SpaceVim#mapping#space#langSPC('nnoremap', ['l','b', 'r'], 'call call('
        \ . string(function('s:execCMD')) . ', ["sbt run"])',
        \ 'sbt-run', 1)

  " REPL
  let g:_spacevim_mappings_space.l.s = {'name' : '+Send'}
  call SpaceVim#mapping#space#langSPC('nmap', ['l','s', 'i'],
        \ 'call SpaceVim#plugins#repl#start("scala")',
        \ 'start REPL process', 1)
  call SpaceVim#mapping#space#langSPC('nmap', ['l','s', 'l'],
        \ 'call SpaceVim#plugins#repl#send("line")',
        \ 'send line and keep code buffer focused', 1)
  call SpaceVim#mapping#space#langSPC('nmap', ['l','s', 'b'],
        \ 'call SpaceVim#plugins#repl#send("buffer")',
        \ 'send buffer and keep code buffer focused', 1)
  call SpaceVim#mapping#space#langSPC('nmap', ['l','s', 's'],
        \ 'call SpaceVim#plugins#repl#send("selection")',
        \ 'send selection and keep code buffer focused', 1)
endfunction


function! s:execCMD(cmd) abort
  call SpaceVim#plugins#runner#open(a:cmd)
endfunction

" vim:set et sw=2 cc=80:
