set nocompatible
set encoding=utf-8

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'unkiwii/vim-nerdtree-sync' 	
Plug 'chrisbra/vim-commentary'
Plug 'owickstrom/vim-colors-paramount'

Plug 'sainnhe/sonokai'
Plug 'preservim/nerdTree' 						  
Plug 'Xuyuanp/nerdtree-git-plugin' 			
"Plug 'ryanoasis/vim-devicons' 				
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'unkiwii/vim-nerdtree-sync' 	

call plug#end()

if has('termguicolors')
 set termguicolors
endif
let g:sonokai_style = 'shusia'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
colorscheme sonokai

" colorscheme paramount
" set background=dark

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
" set showmatch
set ruler
" set smarttab
set shiftwidth=2

let mapleader = ","


let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true } }



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



map <F2> <Plug>(coc-codeaction-selected)
nmap <leader>qf  <Plug>(coc-fix-current)
nmap <leader>ac  <Plug>(coc-codeaction)

autocmd FileType apache set commentstring=#\ %s

command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)


map <silent> <F5> :NERDTreeToggle<CR>
let g:nerdtree_sync_cursorline=1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p
nmap <Leader>r :NERDTreeRefreshRoot<CR>


