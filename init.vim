set nocompatible
set encoding=utf-8

call plug#begin(stdpath('data') . '/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'voldikss/vim-floaterm'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'wojciechkepka/vim-github-dark'
Plug 'morhetz/gruvbox'
Plug 'dart-lang/dart-vim-plugin'
Plug 'preservim/nerdTree' 						  
Plug 'Xuyuanp/nerdtree-git-plugin' 			
"Plug 'ryanoasis/vim-devicons' 				
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'unkiwii/vim-nerdtree-sync' 	

Plug 'SirVer/Ultisnips'
Plug 'natebosch/dartlang-snippets'

call plug#end()


"colorscheme ghdark
colorscheme gruvbox
set background=dark
let g:airline_theme='gruvbox' 		


set mouse=a
set number
set hlsearch
set nobackup
set noswapfile
set noundofile
set autoindent
set smartindent
set smartcase
set ignorecase

set tabstop=2
syntax on
set showmatch
set ruler
set smarttab
set shiftwidth=2

let mapleader = ","

let g:floaterm_position = 'topright'
let g:floaterm_width = 0.6
let g:floaterm_height = 0.6
let g:floaterm_title = 'Terminal $1/$2'
let g:floaterm_wintype = 'float'

hi Floaterm guibg=Grey15
hi FloatermBorder guifg=Orange guibg=DarkGreen

nnoremap   <silent>   <leader>t    :FloatermNew<CR>
tnoremap   <silent>   <leader>t    <C-\><C-n>:FloatermNew<CR>

nnoremap <silent> 	<leader>k 		:FloatermKill<CR>:FloatermPrev<CR>
tnoremap <silent> 	<leader>k 		<C-\><C-n>:FloatermKill<CR>:FloatermPrev<CR>

nnoremap <silent> 	<leader>tg 		:FloatermToggle<CR>
tnoremap <silent> 	<leader>tg 		<C-\><C-n>:FloatermToggle<CR>


let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true } }
if has('nvim')
  let g:terminal_color_0 = '#4e4e4e'
  let g:terminal_color_1 = '#d68787'
  let g:terminal_color_2 = '#5f865f'
  let g:terminal_color_3 = '#d8af5f'
  let g:terminal_color_4 = '#85add4'
  let g:terminal_color_5 = '#d7afaf'
  let g:terminal_color_6 = '#87afaf'
  let g:terminal_color_7 = '#d0d0d0'
  let g:terminal_color_8 = '#626262'
  let g:terminal_color_9 = '#d75f87'
  let g:terminal_color_10 = '#87af87'
  let g:terminal_color_11 = '#ffd787'
  let g:terminal_color_12 = '#add4fb'
  let g:terminal_color_13 = '#ffafaf'
  let g:terminal_color_14 = '#87d7d7'
  let g:terminal_color_15 = '#e4e4e4'
else
  let g:terminal_ansi_colors = [
    \ '#4e4e4e', '#d68787', '#5f865f', '#d8af5f',
    \ '#85add4', '#d7afaf', '#87afaf', '#d0d0d0',
    \ '#626262', '#d75f87', '#87af87', '#ffd787',
    \ '#add4fb', '#ffafaf', '#87d7d7', '#e4e4e4'
  \ ]
endif


command! -bang -nargs=? -complete=dir Files
   \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'bat --color=always --theme=TwoDark --style=header,numbers,snip --line-range :300 {}']}, <bang>0)
map <F6> :Files<CR> 
map <C-F6> :History<CR>

" :Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
	\   'rg --column --line-number --color=always --smart-case -- '.shellescape(<q-args>), 1, {'options': ['--exact', '--layout=reverse']}, <bang>0)
map <F7> :Rg<CR>
nmap <C-F> :FZF<CR>



nmap <C-Right> :vertical resize +1<CR> 		
nmap <C-Left> :vertical resize -1<CR>
nmap <C-Down> :resize +1<CR>
nmap <C-Up> :resize -1<CR>



set cmdheight=2
set updatetime=300
set shortmess+=c
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent> K :call <SID>show_documentation()<CR>


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction


command! -nargs=0 Prettier :CocCommand prettier.formatFile

let dart_html_in_string=v:true

map <silent> <F5> :NERDTreeToggle<CR>
let g:nerdtree_sync_cursorline=1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p
nmap <Leader>r :NERDTreeRefreshRoot<CR>


let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

let g:dartfmt_options = ['--fix', '--line-length 120']

"xmap <leader>a <Plug>(coc-codeaction-selected)
map <F2> <Plug>(coc-codeaction-selected)
nmap <leader>qf  <Plug>(coc-fix-current)

nmap <leader>ac  <Plug>(coc-codeaction)


