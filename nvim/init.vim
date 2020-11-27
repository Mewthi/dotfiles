"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                      _                       _                              "
"               __   _(_)_ __ ___        _ __ | |_   _  __ _                  "
"               \ \ / / | '_ ` _ \ _____| '_ \| | | | |/ _` |                 "
"                \ V /| | | | | | |_____| |_) | | |_| | (_| |                 " 
"                 \_/ |_|_| |_| |_|     | .__/|_|\__,_|\__, |                 "
"                                       |_|            |___/                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctrl+Up/Down	    Move line or a block of selected lines  
" Ctrl+j/k	
" <leader>pp	    Toggle paste mode on and off
" <leader><cr>	    Disable search highlight
"
" <cr> is carriage return, "Enter"
" <leader> is backspace, "\", complete the combination in 1 second

call plug#begin()
    Plug 'arcticicestudio/nord-vim'
    Plug 'roxma/vim-hug-neovim-rpc'
    Plug 'preservim/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'frazrepo/vim-rainbow'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'lervag/vimtex'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()


"encoding
set encoding=UTF-8


"Colors
syntax on
colorscheme nord
let g:rainbow_active = 1

"Tex
let g:tex_flavor = 'latex'
let g:vimtex_view_general_viewer = 'zathura'

"Nerd Tree
let g:webdevicons_enable_nerd_tree = 1
map <C-n> :NERDTreeToggle<CR>

"Airline
let g:airline_powerline_fonts = 1
 
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
 
 
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
 
" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''



"""""
""""" General
"""""
set number		" Show line numbers
set linebreak		" Break lines at word (requires Wrap lines)
set showbreak=+++ 	" Wrap-broken line prefix
set textwidth=100	" Line wrap (number of cols)
set showmatch		" Highlight matching brace
set showcmd	    	" Show last command on right
set cursorline 		" Highlight current line
 
set hlsearch		" Highlight all search results
set smartcase		" Enable smart-case search
set ignorecase		" Always case-insensitive
set incsearch		" Searches for strings incrementally

filetype plugin indent on
set autoindent		" Auto-indent new lines
set cindent		" Use 'C' style program indenting
set shiftwidth=4	" Number of auto-indent spaces
set smartindent		" Enable smart-indent
set smarttab		" Enable smart-tabs
set softtabstop=4 noexpandtab	" Number of spaces per Tab
set wrap 		" Wrap lines
 
"""""
""""" Advanced
"""""
set ruler			" Show row and column ruler information
set undolevels=1000		" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour
 
"""""
""""" Key mapping
"""""
" Move lines using Ctrl+Up/Down in normal, insert and visual modes
nnoremap <C-Up> :m-2<CR>
nnoremap <C-Down> :m+<CR>
inoremap <C-Up> <Esc>:m-2<CR>
inoremap <C-Down> <Esc>:m+<CR>
vnoremap <C-Up> :m '<-2<CR>gv=gv
vnoremap <C-Down> :m '>+1<CR>gv=gv
" or Ctrl+j/k
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <ESC>:m .+1<CR>==gi
inoremap <C-k> <ESC>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
 
" Toggle paste mode on and off
" \ + pp
map <leader>pp :setlocal paste!<cr>
 
" Disable search highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>



""""""""""""""""""""""""""""""""""""""""
"		    COC
"""""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-omnisharp',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-cmake',
  \ 'coc-clangd',
  \ 'coc-python',
  \ 'coc-texlab',
  \ 'coc-utils'
  \ ]
" from readme
" if hidden is not set, TextEdit might fail.
set hidden 
" Some servers have issues with backup files, see #649 set nobackup set nowritebackup i
" " Better display for messages set cmdheight=2 
" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300
 
" don't give |ins-completion-menu| messages.
set shortmess+=c
 
" always show signcolumns
set signcolumn=yes
 
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
 
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
 
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
 
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
 
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
 
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
 
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
 
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
 
" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')
 
" Remap for rename current word
nmap <F2> <Plug>(coc-rename)
 
" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
 
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
 
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
 
" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
 
" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
 
" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)
 
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
 
" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
 
" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
 
" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
 
" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
""""""""""""""""""""""""""""""""""""""""
"		    COC
"""""""""""""""""""""""""""""""""""""""""
