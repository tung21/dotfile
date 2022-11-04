set nocompatible
set nocompatible
set encoding=utf-8

call plug#begin()
Plug 'easymotion/vim-easymotion'
Plug 'chrisbra/vim-commentary'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdTree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'unkiwii/vim-nerdtree-sync'
Plug 'kien/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'bitfield/vim-gitgo'
Plug 'ryanoasis/vim-devicons'
Plug 'morhetz/gruvbox'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-autoformat/vim-autoformat'
Plug 'preservim/tagbar'

call plug#end()


" autocmd BufNewFile,BufRead *.go colorscheme gitgo
colorscheme gruvbox
set background=dark
" set t_Co=256
" set clipboard=unnamedplus
set clipboard^=unnamed,unnamedplus



hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE

set relativenumber number
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
set ruler
set shiftwidth=2
set guicursor=i:block

" let mapleader = ","
let mapleader = " "

nmap <leader>j 12jj<CR>
nmap <leader>k 12kk<CR>

vmap <leader>j 12jj<CR>
vmap <leader>k 12kk<CR>

" nmap J 6jj<CR>
" nmap K 6kk<CR>

" vmap J 6jj<CR>
" vmap K 6kk<CR>

let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 1


inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
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


map <silent> <leader>f :NERDTreeToggle<CR>
let g:nerdtree_sync_cursorline=1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" autocmd BufWritePost * NERDTreeFocus | execute 'normal R' | wincmd p
nmap <Leader>r :NERDTreeRefreshRoot<CR>

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" nnoremap <A-j> :m .+1<CR>==
" nnoremap <A-k> :m .-2<CR>==
" inoremap <A-j> <Esc>:m .+1<CR>==gi
" inoremap <A-k> <Esc>:m .-2<CR>==gi
" vnoremap <A-j> :m '>+1<CR>gv=gv
" vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap ,<Up>   :<C-u>silent! move-2<CR>==
nnoremap ,<Down> :<C-u>silent! move+<CR>==
xnoremap ,<Up>   :<C-u>silent! '<,'>move-2<CR>gv=gv
xnoremap ,<Down> :<C-u>silent! '<,'>move'>+<CR>gv=gv


nmap L :vertical resize +3<CR>
nmap H :vertical resize -3<CR>

nnoremap <silent><leader>a =ip
" nnoremap <silent><F4>:nohl<CR>

nnoremap <F5> <c-w>h<cr>
nnoremap <F6> <c-w>l<cr>

noremap <F3> :Autoformat<CR>
" au BufWrite * :Autoformat

nmap <F8> :TagbarToggle<CR>








