"------------------------------
" ctrlp
"------------------------------
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

"------------------------------
" NerdTree
"------------------------------
map <F4> :NERDTreeToggle<CR>
imap <F4> <esc>:NERDTreeToggle<CR>
let NERDTreeMapToggleFilters='a'

"------------------------------
" NerdCommenter
"------------------------------
nmap <leader>c <Plug>NERDCommenterToggle
xmap <leader>c <Plug>NERDCommenterToggle

" clear uesless mapping
map <Plug>UnmapNERDCommenterAlignBoth <Plug>NERDCommenterAlignBoth
map <Plug>UnmapNERDCommenterAlignLeft <Plug>NERDCommenterAlignLeft
map <Plug>UnmapNERDCommenterAltDelims <Plug>NERDCommenterAltDelims
map <Plug>UnmapNERDCommenterAppend <Plug>NERDCommenterAppend
map <Plug>UnmapNERDCommenterComment <Plug>NERDCommenterComment
map <Plug>UnmapNERDCommenterInvert <Plug>NERDCommenterInvert
map <Plug>UnmapNERDCommenterMinimal <Plug>NERDCommenterMinimal
map <Plug>UnmapNERDCommenterNested <Plug>NERDCommenterNested
map <Plug>UnmapNERDCommenterSexy <Plug>NERDCommenterSexy
map <Plug>UnmapNERDCommenterToEOL <Plug>NERDCommenterToEOL
map <Plug>UnmapNERDCommenterUncomment <Plug>NERDCommenterUncomment
map <Plug>UnmapNERDCommenterYank <Plug>NERDCommenterYank


"------------------------------
" EasyMotion
"------------------------------
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" " `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" " or
" " `s{char}{char}{label}`
" " Need one more keystroke, but on average, it may be more comfortable.
nmap f <Plug>(easymotion-overwin-f2)
vmap f <Plug>(easymotion-s2)
"
" " Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
"
" " JK motions: Line motions
" map <Leader>j <Plug>(easymotion-j)
" map <Leader>k <Plug>(easymotion-k)


"------------------------------
" VimSession
"------------------------------
set sessionoptions-=buffers
set sessionoptions-=options
set sessionoptions-=help

let g:session_directory = '~/.vim/sessions'
let g:session_lock_enabled = 0
let g:session_default_overwirte = 1
let g:session_autoload = 'no'
let g:session_autosave = 'yes'
let g:session_autosave_periodic = 1
"let g:session_default_to_last = 1
":let g:session_menu = 0
:let g:session_command_aliases = 1
map <leader>o :OpenSession<cr>


"------------------------------
" => Ag searching and cope displaying
"    requires ag.vim - it's much better than vimgrep/grep
"------------------------------
" You can configure ag.vim to always start searching from your project root instead of the cwd
let g:ag_working_path_mode="r"

" when you press gv you ag after the selected text
vnoremap <silent> av :call visualselection('gv', '')<cr>

" Open Ag and put the cursor in the right position
map <leader>a :Ag

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with Ag, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>


"------------------------------
" vim-flake8
"------------------------------
let g:flake8_show_quickfix=1
let g:flake8_show_in_gutter=1


"------------------------------
" slimux
"------------------------------
map <C-c><C-c> :SlimuxREPLSendLine<cr>
imap <C-c><C-c> <esc>:SlimuxREPLSendLine<cr>
vmap <C-c><C-c> :SlimuxREPLSendSelection<cr>
map ss :SlimuxShellPrompt<cr><c-u>
vmap ss :SlimuxShellPrompt<cr><c-u>

" Need to send '%cpaste' before pasting, and '--' or Ctrl-D after
function! SlimuxPre_python(target_pane)
    call system("tmux send-keys -t " . a:target_pane . " %cpaste")
    call system("tmux send-keys -t " . a:target_pane . " Enter")
endfunction
function! SlimuxPost_python(target_pane)
    call system("tmux send-keys -t " . a:target_pane . " C-D")
endfunction
