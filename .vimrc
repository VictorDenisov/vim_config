call pathogen#infect()

cabbrev <expr> %% substitute(expand("%:p:h"), getcwd() + "/", "", "")

set hlsearch
set incsearch
set modeline
set ruler
set showcmd
set laststatus=2

cabbrev <expr> vimg 'vimgrep /'.expand('<cword>').'/ **/*'

command Clearqf call setqflist([])
nmap <C-l> :noh<cr>

if has("autocmd")
  filetype plugin indent on
  autocmd BufReadPost fugitive://* set bufhidden=delete
endif

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

nnoremap <F3> :NERDTreeToggle<CR>
nnoremap <F5> :GundoToggle<CR>
nnoremap <F8> :TlistToggle<CR>
noremap <Leader>s :update<CR>

if has('gui_running')
	syntax enable
	set background=light
	let g:solarized_termcolors=256
	let g:solarized_visibility="high"
	let g:solarized_contrast="high"
	let g:solarized_diffmode="high"
	colorscheme solarized
	set guioptions-=m
	set guioptions-=T
	set guioptions-=b
	set guioptions-=r
	set guioptions-=R
	set guioptions-=F
	set guioptions-=l
	set guioptions-=L
	set spell
	set guifont=Monospace\ 11
endif

set foldtext=MyFoldText()
function! MyFoldText()
  let line = getline(v:foldstart)
  let numberOfLines = v:foldend - v:foldstart + 1
  let line = substitute(line, '^\s*', '', 'g')
  let sub = substitute(line, '//\|/\*\|\*/\|{{{\d\=', '', 'g')
  let sub = substitute(sub, '^\s*', '', 'g')
  return v:folddashes . ' ' . sub . ' | ' . numberOfLines . ' lines'
endfunction
