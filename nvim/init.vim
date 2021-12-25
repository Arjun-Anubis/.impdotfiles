" Some default settings
syntax on
filetype plugin on
set number
set relativenumber
set nocp
set noshowmode
set noshowcmd
set shortmess+=F
set laststatus=2
set hidden
set wildmenu
set encoding=utf8
set fillchars+=vert:│
set path+=**
set path+=~/.vim/snippets
set guicursor=n-v-c:block-Cursor

colo delek

au TextYankPost * silent! lua vim.highlight.on_yank()

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

" Weird command mode mapping
inoremap  diw


"Compiling commands
command Compile !javac %
command Sh !chmod +x %
command Run !%


"Leader key bindings
let mapleader = ' '
nnoremap <Leader>w <C-w>
nnoremap <Leader>v :vsplit 
nnoremap <Leader>s :split 
nnoremap <Leader>b :buffer 
nnoremap <Leader>e :edit 
nnoremap <Leader>g :W3m 

hi Visual cterm=none ctermbg=Darkmagenta ctermfg=LightGreen
hi VertSplit cterm=NONE
"Css colors
syn match tmuxColour            /\<colo[u]*r[0-9]\+/      display
for s:i in range(0, 255)
    let s:bg = (!s:i || s:i == 16 || (s:i > 231 && s:i < 235)) ? 15 : "none"
    exec "syn match tmuxColour" . s:i . " /\\<colour" . s:i . "\\>/ display"
\     " | highlight tmuxColour" . s:i . " ctermfg=" . s:i . " ctermbg=" . s:bg
   endfor
imap jj <Esc>

"Save as root
command Q :q
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
command! -nargs=1 -complete=help H h <args> | only
command Copy :%"+y

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif
source ~/.config/nvim/pluginloader.vim
