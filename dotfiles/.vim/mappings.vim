let mapleader=" "

" Universal
map <F2> <esc>:buffers<enter>

" Cmdline
" cnoremap <esc> pepe

" Visual
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Insert
"inoremap ( ()<esc>i
"inoremap [ []<esc>i
"inoremap { {}<esc>i
"inoremap ' ''<esc>i
"inoremap " ""<esc>i
"inoremap (( (
"inoremap [[ [
"inoremap {{ {
"inoremap '' '
"inoremap "" "
inoremap <C-j> <esc>ja
inoremap <C-k> <esc>ka
inoremap <C-l> <esc>la
inoremap <C-h> <esc>ha
inoremap <C-s> <esc>0a
inoremap <C-w> <esc>bwwi
inoremap <C-B> <esc>bi

" Normal
" noremap s :
noremap <Leader>e :w<enter>:!./%<enter>
"noremap <C-F> gg=G<C-O><C-O>
noremap <F3> :bn<CR>
noremap <F4> :bp<CR>
"noremap <C-J> :source ./.vimrc

noremap <C-B>s :buffers<CR>
noremap <C-B>n :bn<CR>
noremap <C-B>p :bp<CR>

