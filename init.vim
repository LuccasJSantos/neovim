syntax on

set autoindent
set expandtab
set guicursor=i:block
set noswapfile
set nowrap
set nu
set rnu
set signcolumn=no
set softtabstop=2
set tabstop=2

set wildignore+=*/node_modules/*,*/webapp/*,*/output/*,*/dist/*
set splitright " new vertical splits are on the right
"set clipboard=unnamedplus " linux
set clipboard=unnamed " windows

" remaps {
let mapleader = " "

nnoremap <leader>t <cmd>45vs<cr><cmd>terminal<cr>i<esc>
nnoremap <leader>fi <cmd>CtrlP<cr>
nnoremap <leader>h <c-w>h
nnoremap <leader>j <c-w>j
nnoremap <leader>k <c-w>k
nnoremap <leader>l <c-w>l
nnoremap <leader>ep <cmd>Ex<cr>
tnoremap <Esc> <C-\><C-n>
" CoC
" K to show documentation in preview mode
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
" <c-space> to trigger completion preview
if has('nvim')
  xnoremap <silent><expr> <c-space> coc#refresh()
else
  xnoremap <silent><expr> <c-@> coc#refresh()
endif

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" plugins {
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

Plug 'alvan/vim-closetag'
let g:closetag_filetypes = 'html,xhtml,phtml,vue,jsx,tsx'

Plug 'projekt0n/github-nvim-theme'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-tsserver', 'coc-pairs', 'coc-vetur', 'coc-json', 'coc-eslint', 'coc-prettier', 'coc-styled-components', 'coc-tailwindcss']
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

Plug 'kien/ctrlp.vim'
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|.git\|dist'

Plug 'sheerun/vim-polyglot'
" typescript and tsx {

Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'

Plug 'machakann/vim-highlightedyank'
let g:highlightedyank_highlight_duration = 300

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme='minimalist'
let g:airline_section_c_only_filename = 1

au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
" }

Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'junegunn/fzf.vim'

call plug#end()
" }

" colors {
set t_Co=256
colorscheme github_dimmed

" yank highlight reverse
highlight HighlightedyankRegion cterm=reverse gui=reverse

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
