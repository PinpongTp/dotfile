"call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
call plug#begin()

"Plug 'nvim-lua/completion-nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" tmuxline for copy vim-airline style to tmux-airline
Plug 'edkolev/tmuxline.vim'
Plug 'gruvbox-community/gruvbox'
"Plug 'nvim-lualine/lualine.nvim'
"Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
"Plug 'lifepillar/vim-solarized8'
Plug 'yggdroot/indentline'

" nerd tree
Plug 'preservim/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'nvim-treesitter/nvim-treesitter'

" fzf
"Plug 'junegunn/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" for ctl+P to search files
Plug 'kien/ctrlp.vim'

" comment line
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
" prettier 
"Plug 'prettier/vim-prettier'
" fugitive for use git command in vim
Plug 'nvim-lua/plenary.nvim'
Plug 'tpope/vim-fugitive'
" example
" - :Git status

" show git edit line
" Plug 'airblade/vim-gitgutter'
" not use gitgutter because it can't custom to look like vscode 
Plug 'lewis6991/gitsigns.nvim'


"Plug 'nvim-lua/popup.nvim'
"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim'


" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'sheerun/vim-polyglot'

call plug#end()

" abount theme ( gruvbox and ui )
"set termguicolors
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'
"set background=dark
"highlight Normal guibg=none
"colorscheme solarized8
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'

" for indentline
let g:indentLine_enabled = 0

" for tmux
let g:tmuxline_powerline_separators = 0
let airline#extensions#tmuxline#snapshot_file = "~/.config/tmux/tmux-status.conf"
let g:tmuxline_preset = {
        \ 'a': '[#S]',
        \ 'win': '#I:#W#F',
        \ 'cwin': '#I:#W#F',
        \ 'x': '#{prefix_highlight}' ,
        \ 'y': '%H:%M',
        \ 'z': '%d-%b-%y',
        \ 'options': {
        \ 'status-justify': 'left'}
        \ }


syntax on
syntax enable

set number
set relativenumber
set tabstop=2
" set tabstop=2 softtabstop=2
" it config i'am not sure how it work
set shiftwidth=2
set expandtab
set mouse=a
set colorcolumn=80
" signcolumn is space in left bar (left of line number)
set signcolumn=yes
" for update a git status and coc...
set updatetime=50
set cmdheight=2

" shotderu key setup
let mapleader=" "
noremap <Leader>q :q<CR>
noremap <Leader>Q :q!<CR>
noremap <Leader>w :w<CR>
noremap <Leader>W :wq<CR>
nnoremap <Leader>S :so %<CR>
nnoremap U :redo<CR>
nnoremap vv :noh<CR>
nnoremap J :m '>+1<CR>gv=gv
nnoremap K :m '<-2<CR>gv=gv

" for plugin
nnoremap <Leader>n :NERDTreeFocus<CR>
nnoremap <Leader>t :NERDTreeToggle<CR>
nnoremap <Leader>w :<C-w>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <Leader>p :Prettier<CR>

" for split navigation
nnoremap <Leader>h <C-w>h
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k
nnoremap <Leader>l <C-w>l

" for lua
"nnoremap <Leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

command! -nargs=0 Prettier :CocCommand prettier.forceFormatDocument
"command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" hide 
" nerdcommenter
" - comment line by <Leader>cc
" - remove comment line by <Leader>cu
" nerdtree
" - 
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
"if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  "set signcolumn=number
"else
  "set signcolumn=yes
"endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

set statusline+=%{get(b:,'gitsigns_head','')}

lua require('gitsigns').setup()
