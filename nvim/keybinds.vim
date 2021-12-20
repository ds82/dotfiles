let mapleader=","

" utils
nnoremap <silent><leader>1 :source ~/.config/nvim/init.vim \| :PlugInstall<CR>
nnoremap <silent><leader>,1 :edit ~/.config/nvim/init.vim<CR>

" files, nerdtree, etc
" silent! nmap <F2> :NERDTreeToggle<CR>
" nnoremap<C-\> :NERDTreeFind<CR>

nnoremap <F2> :NvimTreeToggle<CR>
" nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <C-\> :NvimTreeFindFile<CR>


nnoremap <leader>f :Files<CR>
nnoremap <leader>t :Files<CR>
nnoremap <leader>b :Buffers<CR>

nnoremap <silent> Q :call CloseWindowOrKillBuffer()<cr>
nnoremap vv <C-W>v
nnoremap ss <C-W>s

noremap <C-l> <C-w>l

" yank everything from curso to end of line
nnoremap Y yg$

" join lines but keep cursor position
nnoremap J mzJ`z

" undo breakpoints 
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap <space> <space><c-g>u

" coc
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <c-space> coc#refresh()

" remap increment/decrement to avoid tmux collision
noremap <A-a> <C-a>
noremap <A-x> <C-x>

" tmux
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>

" git gutter
nmap ) <Plug>(GitGutterNextHunk)
nmap ( <Plug>(GitGutterPrevHunk)
let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_highlight_linenrs = 1

" figutive
nmap <leader>gs :G<CR>

" buffer navigation with TAB/SHIFT-TAB in normal mode
nnoremap <TAB> :bnext<CR>
nnoremap <S-TAB> :bprevious<CR>

" save with sudo
cmap w!! w !sudo tee %

" copy filepath to clipboard
nmap <leader>p :let @+ = expand("%")<cr>

" search word under cursor with ag
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>

" fix register access to a,o,u in osx with german umlaut-funktion
nnoremap ä "a
nnoremap ö "o
nnoremap ü "u

" harpoon
nnoremap <Leader>a :lua require("harpoon.mark").add_file()<CR>
nnoremap <Leader>h :lua require("harpoon.ui").toggle_quick_menu()<CR>

nnoremap g1 :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap g2 :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap g3 :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap g4 :lua require("harpoon.ui").nav_file(4)<CR>
