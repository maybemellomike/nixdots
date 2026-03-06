let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/dots
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +97 mangowc.nix
badd +0 config/hypr/hyprland.conf
badd +0 term://~/dots//281851:/run/current-system/sw/bin/zsh
argglobal
%argdel
edit mangowc.nix
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd _ | wincmd |
split
1wincmd k
wincmd w
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
exe '1resize ' . ((&lines * 31 + 25) / 51)
exe 'vert 1resize ' . ((&columns * 85 + 86) / 172)
exe '2resize ' . ((&lines * 17 + 25) / 51)
exe 'vert 2resize ' . ((&columns * 85 + 86) / 172)
exe 'vert 3resize ' . ((&columns * 86 + 86) / 172)
argglobal
balt mangowc.nix
setlocal foldmethod=manual
setlocal foldexpr=0
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 69 - ((22 * winheight(0) + 15) / 31)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 69
normal! 018|
wincmd w
argglobal
if bufexists(fnamemodify("term://~/dots//281851:/run/current-system/sw/bin/zsh", ":p")) | buffer term://~/dots//281851:/run/current-system/sw/bin/zsh | else | edit term://~/dots//281851:/run/current-system/sw/bin/zsh | endif
if &buftype ==# 'terminal'
  silent file term://~/dots//281851:/run/current-system/sw/bin/zsh
endif
balt mangowc.nix
setlocal foldmethod=manual
setlocal foldexpr=0
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
let s:l = 77 - ((16 * winheight(0) + 8) / 17)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 77
normal! 09|
wincmd w
argglobal
if bufexists(fnamemodify("config/hypr/hyprland.conf", ":p")) | buffer config/hypr/hyprland.conf | else | edit config/hypr/hyprland.conf | endif
if &buftype ==# 'terminal'
  silent file config/hypr/hyprland.conf
endif
balt mangowc.nix
setlocal foldmethod=manual
setlocal foldexpr=0
setlocal foldmarker={{{,}}}
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldenable
silent! normal! zE
let &fdl = &fdl
let s:l = 112 - ((29 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 112
normal! 030|
wincmd w
2wincmd w
exe '1resize ' . ((&lines * 31 + 25) / 51)
exe 'vert 1resize ' . ((&columns * 85 + 86) / 172)
exe '2resize ' . ((&lines * 17 + 25) / 51)
exe 'vert 2resize ' . ((&columns * 85 + 86) / 172)
exe 'vert 3resize ' . ((&columns * 86 + 86) / 172)
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
