" Some default settings
syntax on
filetype plugin on
set tabstop=4
set shiftwidth=4
set noautoindent
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
set hlsearch
set incsearch
set foldmethod=indent
set nofoldenable
set foldlevel=99
set tags+=~/.vim/systags

" colo desert


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
imap jj <Esc>
nnoremap <CR> :noh<CR><CR>
nnoremap <C-k> :Silent man <cword><CR>


"Compiling commands
command Compile !javac %
command Sh !chmod +x %
command Run !%

"Window moving bindings

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Leader key bindings
let mapleader = ' '
nnoremap <Leader>w <C-w>
nnoremap <Leader>v :vsplit 
nnoremap <Leader>s :split 
nnoremap <Leader>o :Buffers<CR>
nnoremap <Leader>x :quit<CR>
" nnoremap <Leader>e :edit 
" nnoremap <Leader>f :FZF<CR>
nnoremap <Leader>e :FZF<CR>
nnoremap <Leader>g :W3m 
nnoremap <Leader><Leader> :Files<CR>
nnoremap <Leader>k :NERDTreeToggle<CR>


"Frequently accesses files section
nnoremap <Leader>fi :edit ~/.config/i3/config<CR>
nnoremap <Leader>fv :edit ~/.vimrc<CR>
nnoremap <Leader>fl :edit ~/.vim/ld.vim<CR>
nnoremap <Leader>fe :edit ~/.emacs.d/init.el<CR>
nnoremap <Leader>fz :edit ~/.config/zathura/zathurarc<CR>
nnoremap <Leader>fn :edit ~/.config/nvim/init.vim<CR>
nnoremap <Leader>fq :edit ~/.config/qutebrowser/config.py<CR>
nnoremap <Leader>fd :edit ~/.config/dunst/dunstrc<CR>

"Quick terms
nnoremap <Leader>tk :term ++rows=4 ++close<CR>
nnoremap <Leader>tj :botright term ++rows=4 ++close<CR>
nnoremap <Leader>tK :term ++rows=8 ++close<CR>
nnoremap <Leader>tJ :botright term ++rows=8 ++close<CR>
nnoremap <Leader>tt :botright term ++rows=12 ++close<CR>


nnoremap <Leader>th :vert term ++cols=12 ++close<CR>
nnoremap <Leader>th :botright vert term ++cols=12 ++close<CR>

"Make terms

nnoremap <Leader>mtk :term ++rows=4  make <CR>
nnoremap <Leader>mtj :botright term ++rows=4  make <CR>
nnoremap <Leader>mtK :term ++rows=8  make <CR>
nnoremap <Leader>mtJ :botright term ++rows=8  make <CR>
nnoremap <Leader>mtt :botright term ++rows=12  make <CR>


nnoremap <Leader>mth :vert term ++cols=12  make <CR>
nnoremap <Leader>mth :botright vert term ++cols=12  make <CR>

"Run terms


hi Visual cterm=None ctermbg=Darkmagenta ctermfg=LightGreen
hi Search cterm=None ctermbg=Darkmagenta ctermfg=LightGreen
hi lspReference cterm=None ctermfg=LightGreen
hi SignColumn ctermbg=None ctermfg=white
hi VertSplit cterm=None
hi Folded ctermbg=None
hi Error ctermbg=None ctermfg=red
hi Todo ctermbg=None ctermfg=yellow
hi Pmenu ctermfg=250 ctermbg=235 
hi PmenuSel ctermfg=235 ctermbg=green
" set statusline=%{synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'name')}


"Css colors
syn match tmuxColour            /\<colo[u]*r[0-9]\+/      display
for s:i in range(0, 255)
    let s:bg = (!s:i || s:i == 16 || (s:i > 231 && s:i < 235)) ? 15 : "none"
    exec "syn match tmuxColour" . s:i . " /\\<colour" . s:i . "\\>/ display"
\     " | highlight tmuxColour" . s:i . " ctermfg=" . s:i . " ctermbg=" . s:bg
   endfor

"Save as root
command Q :q
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!
command! -nargs=1 -complete=help H h <args> | only
command Copy :%"+y
autocmd VimLeave * call system('echo ' . shellescape(getreg('+')) . 
            \ ' | xclip -selection clipboard')

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

source ~/.config/nvim/ld.vim

let g:floaterm_keymap_new = '<Leader>ft'
let g:floaterm_keymap_toggle = '<Leader>fd'

hi FloatermBorder guibg=orange guifg=cyan

:command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'

"Plugin specifc
"
" let g:lsp_auto_enable = 0
"LSP

setlocal omnifunc=lsp#complete
setlocal signcolumn=yes
if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
nmap gd <plug>(lsp-definition)
nmap gs <plug>(lsp-document-symbol-search)
nmap gS <plug>(lsp-workspace-symbol-search)
nmap gr <plug>(lsp-references)
nmap gi <plug>(lsp-implementation)
nmap gt <plug>(lsp-type-definition)
nmap <leader>rn <plug>(lsp-rename)
nmap [g <plug>(lsp-previous-diagnostic)
nmap ]g <plug>(lsp-next-diagnostic)
nmap K <plug>(lsp-hover)
nnoremap <expr><c-f> lsp#scroll(+4)
nnoremap <expr><c-d> lsp#scroll(-4)

let g:lsp_format_sync_timeout = 1000
autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

" refer to doc to add more commands

let g:snipMate = { 'snippet_version' : 1 }
lua require'terminal'.setup()
