" Some default settings
syntax on
set number
set relativenumber
set nocp
set noshowmode
set noshowcmd
set shortmess+=F
set laststatus=2
set hidden
set wildmenu

"Removing Arrow keys
" noremap <Up> <Nop>
" noremap <Down> <Nop>
" noremap <Left> <Nop>
" noremap <Right> <Nop>
" 
" inoremap <Up> <Nop>
" inoremap <Down> <Nop>
" inoremap <Left> <Nop>
" inoremap <Right> <Nop>

"Bash mappings
map <C-a> <Home>
map <C-e> <End>
imap <C-a> <Home>
imap <C-e> <End>

"Compiling commands
command Compile !javac %
command Sh !chmod +x %
command Run !%


"Leader key bindings
let mapleader = ' '
nnoremap <Leader>w <C-w>
nnoremap <Leader>v :vsplit
nnoremap <Leader>s :split

"Css colors
syn match tmuxColour            /\<colo[u]*r[0-9]\+/      display
for s:i in range(0, 255)
    let s:bg = (!s:i || s:i == 16 || (s:i > 231 && s:i < 235)) ? 15 : "none"
    exec "syn match tmuxColour" . s:i . " /\\<colour" . s:i . "\\>/ display"
\     " | highlight tmuxColour" . s:i . " ctermfg=" . s:i . " ctermbg=" . s:bg
   endfor
imap jj <Esc>

"Save as root
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

