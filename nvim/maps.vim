" Description: Keymaps

let mapleader=" "
nnoremap <S-C-p> "0p
" Delete without yank
nnoremap <leader>d "_d
xnoremap <leader>d "_d
nnoremap <leader>c "_c
xnoremap <leader>c "_c
xnoremap <leader>p "_dP

nnoremap x "_x

" Increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" Delete a word backwards
nnoremap dw vb"_d

" Select all
" nmap <C-a> gg<S-v>G

" redo
nmap U :redo<CR>
" un mark
nmap vv :noh<CR>

" git
nmap <C-g> :Gitsigns blame_line<CR>
nmap <Leader>gd :Gitsigns diffthis<CR>
nmap <Leader>gl :Gitsigns blame_line<CR>
nmap <Leader>gb :Git blame<CR>


" for main activity
nmap <Leader>q :q<CR>
nmap <Leader>Q :q!<CR>
nmap <Leader>w :w<CR>
nmap <Leader>W :wq<CR>
nmap <Leader>S :so %<CR>

" for nerdTree
nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>f :NERDTreeFind<CR>

" for toggleterm
nmap <Leader>\ :ToggleTerm<cr>
nmap ;c :ToggleTerm<cr>

" Save with root permission
" command! w w !sudo tee > /dev/null %

" search for selected text, forwards or backwards.
vnoremap <silent> * :<c-u>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

"-----------------------------
" Tabs

" Open current directory
nmap te :tabedit 
"nmap <Tab> :tabnext<CR>
"nmap <S-Tab> :tabprev<CR>
nmap <S-Tab> :bprevious<Return>
nmap <Tab> :bnext<Return>

nmap <Leader>tt :tabnext<CR>
nmap <Leader>tn :tabnew %<CR>
nmap <Leader>tr :TablineTabRename 
nmap <Leader>tc :tabclose<CR>
nmap <Leader>tq :tabclose<CR>
nmap <Leader>td :tabclose<CR>
nmap <Leader>t. :tabnext<CR>
nmap <Leader>t, :tabprev<CR>
nmap <Leader>t< :tabm -1<CR>
nmap <Leader>t> :tabm +1<CR>
nmap dt :q<CR>

"nnoremap <silent><Leader>b :BufferLinePick<CR>
nnoremap <silent><Leader>bb :TablineBufferNext<CR>
nmap <Leader>b. :TablineBufferNext<CR>
nmap <Leader>b, :TablineBufferPrevious<CR>
nmap <Leader>bd :bw<CR>
nmap <Leader>bD :bw!<CR>
nmap bd :bw<CR>
nmap bD :bw!<CR>

nmap <silent>[b :TablineBufferNext<CR>
nmap <silent>b] :TablineBufferPrevious<CR>
nmap <Leader>b> :TablineBufferNext<CR>
nmap <Leader>b< :TablineBufferPrevious<CR>

nnoremap <silent><Leader>bq :bw<CR>
nnoremap <silent><Leader>bQ :bw!<CR>
nnoremap <silent><Leader>bc :bw<CR>

nnoremap <silent><Leader>ts :SymbolsOutline<CR>
"------------------------------
" Windows

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
" Move window
"nmap <Leader> <C-w>w
nmap <Leader>w <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
" Resize window
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

inoremap <C-h> <C-w>
