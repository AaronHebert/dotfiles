set background=dark
set termguicolors
set number
set laststatus=2
set expandtab
set tabstop=2
set softtabstop=2
set cursorline
set colorcolumn=80
set relativenumber
set paste

" Plug
call plug#begin('~/.vim/plugged')
  Plug 'scrooloose/nerdTree'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'chriskempson/base16-vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'morhetz/gruvbox'
  Plug 'itchyny/lightline.vim'
  Plug 'joshdick/onedark.vim'
  Plug 'sjl/gundo.vim'
  Plug 'vimwiki/vimwiki'
call plug#end()

" Leader
let mapleader = ","

" Insert Remaps
inoremap jk <esc>

" Normal Remaps
nnoremap <leader>u :GundoToggle<CR>

" Global Remaps
map <C-n> :NERDTreeToggle<CR>
map <C-p> :FZF<CR>

" Autogroups
augroup configgroup
  autocmd!
  autocmd VimEnter * highlight clear SignColumn
  autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.rb,*.md
              \:call <SID>StripTrailingWhitespaces()
  autocmd FileType ruby setlocal tabstop=2
  autocmd FileType ruby setlocal shiftwidth=2
  autocmd FileType ruby setlocal softtabstop=2
  autocmd FileType ruby setlocal commentstring=#\ %s
  autocmd BufEnter *.zsh-theme setlocal filetype=zsh
  autocmd BufEnter Makefile setlocal noexpandtab
  autocmd BufEnter *.sh setlocal tabstop=2
  autocmd BufEnter *.sh setlocal shiftwidth=2
  autocmd BufEnter *.sh setlocal softtabstop=2
augroup END


" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
  " save last search & cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfunction

" NerdTree Setup
let NERDTreeShowHidden=1

" VimWiki Setup
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': 'md'}]

" Color Scheme Setups
let g:lightline = { 'colorscheme': 'onedark' }
let g:onedark_hide_endofbuffer = 1
colorscheme onedark
