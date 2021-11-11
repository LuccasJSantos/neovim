syntax on

set autoindent
set expandtab
set noswapfile
set nowrap
set nu
set rnu
set signcolumn=no
set softtabstop=2
set tabstop=2

set wildignore+=*/node_modules/*,*/webapp/*,*/output/*,*/dist/*

" remaps {
let mapleader = " "

nnoremap <leader>fi <cmd>CtrlP<cr>
nnoremap <leader>h <c-w>h
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k
nnoremap <leader>l <c-w>l
nnoremap <leader>ep <cmd>Ex<cr>

" }

" plugins {
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'alvan/vim-closetag'
let g:closetag_filetypes = 'html,xhtml,phtml,vue,jsx,tsx'

Plug 'gosukiwi/vim-atom-dark'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kien/ctrlp.vim'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|.git\|dist'

Plug 'sheerun/vim-polyglot'
" typescript and tsx {

Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'

au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
" }

call plug#end()
" }

" colors {
" source $HOME/.config/nvim/themes/atom-dark.vim
" source $HOME/.config/nvim/themes/atom-dark-256.vim
hi Normal guibg=NONE ctermbg=NONE
highlight Pmenu ctermfg=white
" }

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" setup prettier
" command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

set signcolumn=no
