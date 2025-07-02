" useless if i understood everything correctly, also harmless in this case
set nocompatible

" plugins
call plug#begin('~/.config/nvim/plugged')
    Plug 'lervag/vimtex'
    Plug 'whonore/Coqtail'
    Plug 'chrisbra/csv.vim'
    Plug 'latex-lsp/texlab'
    Plug 'ocaml/vim-ocaml'
    Plug 'ocaml/merlin'
    Plug 'stevearc/conform.nvim'
    Plug 'jbyuki/nabla.nvim'
    Plug 'tpope/vim-fugitive'
    Plug 'LnL7/vim-nix'
    Plug 'kaarmu/typst.vim'
    Plug 'myriad-dreamin/tinymist'
    Plug 'sheerun/vim-polyglot'
    Plug 'kristijanhusak/vim-hybrid-material'
    Plug 'simrat39/rust-tools.nvim'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'dcampos/nvim-snippy'
    Plug 'dcampos/cmp-snippy'
    Plug 'neovim/nvim-lspconfig'
    Plug 'folke/lsp-colors.nvim'
    Plug 'rmehri01/onenord.nvim', { 'branch': 'main' }
    " TODO learn
    Plug 'terryma/vim-multiple-cursors'
    Plug 'tpope/vim-surround'

    " TODO setup and learn
    "Plug 'junegunn/fzf.vim'
    "Plug 'mhinz/vim-signify'
    "Plug 'preservim/nerdtree'

call plug#end()



"vim theme



" general options
" TDOO have some smarter folding method
set foldmethod=manual
set number
set norelativenumber
set mouse=
syntax on
set cursorline
filetype plugin on
" TODO add spell check for .tex, .typ and .txt files
" TODO add github project with this and other dot files
" TODO something or other with nix
" TODO make comment macros nice

" all .swp files go to ~/.vim/swapfiles
set directory=$HOME/.config/nvim/swapfiles//

" keeps folds on save and lags the hell out of any LaTeX file
" with fair number of parentheses and such
"augroup remember_folds
"  autocmd!
"  autocmd BufWinLeave * mkview
"  autocmd BufWinEnter * silent! loadview
"augroup END


" options for VimTeX

" option below mostly useless because the VimtexClean is never used (unless
" called by hand)
"let g:vimtex_compiler_clean_paths = ['*.abs', '*.xmpdata', 'pdfa.xmpi']
augroup vimtex_config
    au!
    au User VimtexEventQuit call vimtex#compiler#clean(0)
augroup END
" this is temporary
"let g:Tex_IgnoredWarnings = 
"    \'Underfull'."\n".
"    \'Overfull'."\n".
"    \'specifier changed to'."\n".
"    \'You have requested'."\n".
"    \'Missing number, treated as zero.'."\n".
"    \'There were undefined references'."\n".
"    \'Citation %.%# undefined'."\n".
"    \'Double space found.'."\n"
"let g:Tex_IgnoreLevel = 8
let g:tex_conceal = ""
let g:vimtex_syntax_enabled = 0
"let g:vimtex_syntax_nospell_comments = 0


" detects why3 files
au BufRead,BufNewFile *.why,*.mlw set filetype=why3

" ctrl+c and esc have slightly different semantics
" ex: C-v then I then C-c or esc give different results
inoremap <C-c> <esc>

" I want to insert an empty line below / above without inserting
let @b = 'ok'
nnoremap <C-j> @b
let @a = 'Oj'
nnoremap <C-k> @a

" faster line navigation
nnoremap <S-e> 10e
nnoremap <S-w> 10w
nnoremap <S-b> 10b

" faster window navigation
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" TODO make a list of code file types
" format code
autocmd FileType ocaml nix nnoremap <C-f> :Format<CR>hh
autocmd ExitPre ocaml nix :Format
"autocmd FileType nix nnoremap <C-f> :Format<CR>hh


" comments a single line for ocaml file
let @c = 'I(*A*)'
" uncomments a single line for ocaml file
let @v = '_"_x"_x$"_x"_x'
autocmd FileType ocaml nnoremap <C-x> @c
autocmd FileType ocaml nnoremap <C-s> @v


"command StartSplit vsplit set nu! split

" starts TypstWatch automatically when opening a .typ file
" TODO
"autocmd FileType typst autocmd BufEnter :TypstWatch
" make typst files on save
" handles errors nicely
autocmd FileType typst autocmd BufWritePost * | silent make! | cwindow | redraw!
autocmd FileType typst setlocal spell

au BufRead, BufNewFile *.typ set filetype=typst

autocmd VimEnter * execute 'wincmd b'

aug CSV_Editing
		au!
		au BufRead,BufWritePost *.csv :1ArrangeColumn | %ArrangeColumn | Header
		au BufWritePre *.csv :%UnArrangeColumn
aug end

" copilot settings
" disable for text
let g:copilot_filetypes = {
   \'typst': v:false,
   \'tex': v:false,
   \'coq': v:false,
\}

" set tab length at three spaces
" show existing tab with 3 spaces width
" need to make this dependent on filetype and formatting info if present
set tabstop=3
" when indenting with '>', use 3 spaces width
set shiftwidth=3
" On pressing tab, insert 3 spaces
set expandtab


" Coqtail settings
" TODO make this only for coq files
autocmd FileType coq noremap <C-j> :CoqNext<CR>hh  " next line
autocmd FileType coq noremap <C-k> :CoqUndo<CR>hh  " undo last line
autocmd FileType coq noremap <C-t> :CoqToLine<CR>hh  " undo last line

" nabla will be useful for LaTeX
"nnoremap <C-p> :lua require("nabla").popup()<CR> " Customize with popup({border = ...})  : `single` (default), `double`, `rounded`
