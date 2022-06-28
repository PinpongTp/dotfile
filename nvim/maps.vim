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
nmap <Space>q :q<CR>
nmap <Space>Q :q!<CR>
nmap <Space>w :w<CR>
nmap <Space>W :wq<CR>
nmap <Space>S :so %<CR>

" for nerdTree
nmap <Space>n :NERDTreeFocus<CR>
nmap <Space>t :NERDTreeToggle<CR>
nmap <Space>f :NERDTreeFind<CR>

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
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>

"------------------------------
" Windows

" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
" Move window
"nmap <Space> <C-w>w
nmap <Space>w <C-w>w
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
