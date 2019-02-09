call plug#begin()

Plug 'w0rp/ale'
Plug 'fatih/vim-go'

" rust
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
Plug 'roxma/nvim-cm-racer'

Plug 'Valloric/YouCompleteMe'
Plug 'tpope/vim-fugitive'
Plug 'kchmck/vim-coffee-script'
Plug 'iCyMind/NeoSolarized'
Plug 'slim-template/vim-slim'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'airblade/vim-rooter'

Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'

call plug#end()

set tabstop=2
set shiftwidth=2
set expandtab
set noswapfile
set number
set relativenumber
set autoread
au FocusGained * :checktime

" bind K to grep word under cursor
nnoremap <C-K> :Ag <C-R><C-W><CR>
nnoremap L :Ag <CR>
nnoremap <F2> :NERDTreeFind <CR>

nnoremap <C-P> :GFiles --cached --others --exclude-standard<CR>
nnoremap <C-B> :Buffers<CR>
nnoremap <C-H> :History<CR>
nnoremap <C-X> :bufdo bwipeout<CR>

let g:mix_format_on_save = 1
let g:rustfmt_autosave = 1

" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
