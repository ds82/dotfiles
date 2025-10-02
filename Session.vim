let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/code/dotfiles
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +45 nvim/lua/dennis-io/plugins/telescope.lua
badd +2 ~/code/dotfiles/nvim/lua/dennis-io/core/websearch.lua
badd +2 nvim/init.lua
badd +45 ~/code/dotfiles/nvim/lua/dennis-io/core/utils.lua
argglobal
%argdel
edit nvim/lua/dennis-io/plugins/telescope.lua
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
wincmd =
argglobal
balt ~/code/dotfiles/nvim/lua/dennis-io/core/utils.lua
setlocal foldmethod=manual
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=9999
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
sil! 7,13fold
sil! 24,27fold
sil! 28,39fold
sil! 41,46fold
sil! 47,58fold
sil! 40,59fold
sil! 22,60fold
sil! 62,64fold
sil! 61,65fold
sil! 68,77fold
sil! 67,78fold
sil! 66,79fold
sil! 21,80fold
sil! 91,95fold
sil! 103,105fold
sil! 109,111fold
sil! 118,123fold
sil! 124,128fold
sil! 130,134fold
sil! 136,139fold
sil! 141,144fold
sil! 146,150fold
sil! 152,156fold
sil! 14,157fold
sil! 1,158fold
let &fdl = &fdl
let s:l = 45 - ((44 * winheight(0) + 35) / 70)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 45
normal! 036|
wincmd w
argglobal
if bufexists(fnamemodify("~/code/dotfiles/nvim/lua/dennis-io/core/utils.lua", ":p")) | buffer ~/code/dotfiles/nvim/lua/dennis-io/core/utils.lua | else | edit ~/code/dotfiles/nvim/lua/dennis-io/core/utils.lua | endif
if &buftype ==# 'terminal'
  silent file ~/code/dotfiles/nvim/lua/dennis-io/core/utils.lua
endif
balt nvim/lua/dennis-io/plugins/telescope.lua
setlocal foldmethod=manual
setlocal foldexpr=v:lua.vim.treesitter.foldexpr()
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=9999
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
sil! 4,9fold
sil! 14,16fold
sil! 18,20fold
sil! 13,21fold
sil! 12,25fold
sil! 30,32fold
sil! 28,33fold
sil! 27,34fold
sil! 36,45fold
let &fdl = &fdl
let s:l = 45 - ((44 * winheight(0) + 35) / 70)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 45
normal! 03|
wincmd w
2wincmd w
wincmd =
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
