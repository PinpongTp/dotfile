" Description: Keymaps

let mapleader=" "
nnoremap <S-C-p> "0p
" Delete without yank
nnoremap <leader>d "_d
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
nmap <Leader>t. :tabnext<CR>
nmap <Leader>t, :tabprev<CR>
nmap dt :q<CR>

nnoremap <silent><Leader>b :BufferLinePick<CR>
"nnoremap <silent><Leader>bb :BufferLinePick<CR>
nnoremap <silent><Leader>b. :BufferLineCycleNext<CR>
nnoremap <silent><Leader>b, :BufferLineCyclePrev<CR>
nnoremap <silent><Leader>bd :BufferLinePickClose<CR>
nnoremap <silent><Leader>bp :BufferLineTogglePin<CR>

" These commands will navigate through buffers in order regardless of which mode you are using
" e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
nnoremap <silent>[b :BufferLineCycleNext<CR>
nnoremap <silent>b] :BufferLineCyclePrev<CR>

" These commands will move the current buffer backwards or forwards in the bufferline
nnoremap <silent><Leader>b> :BufferLineMoveNext<CR>
nnoremap <silent><Leader>b< :BufferLineMovePrev<CR>

nnoremap <silent><Leader>bq :bw<CR>
nnoremap <silent><Leader>bc :bw<CR>
nnoremap <silent>db :bw<CR>

" These commands will sort buffers by directory, language, or a custom criteria
nnoremap <silent>be :BufferLineSortByExtension<CR>
nnoremap <silent>bd :BufferLineSortByDirectory<CR>
"nnoremap <silent><mymap> :lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>


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
