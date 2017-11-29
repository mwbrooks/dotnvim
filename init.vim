" Install Vim Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

" Define where and what plugins are installed
call plug#begin('~/.config/nvim/plugged')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'w0rp/ale'

call plug#end()

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Deoplete configuration
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
call deoplete#custom#source('_', 'sorters', ['sorter_word'])

" Deoplete tab order on popup to be down/up instead of up/down
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" NERDTree configuration
let NERDTreeIgnore=['\.rbc$', '\~$', 'build/', 'node_modules', 'npm-debug\.log']
:map <Leader>n :NERDTreeToggle<CR>
autocmd vimenter * NERDTree  " Autostart NERDTree
autocmd VimEnter * wincmd w  " Jump to the main window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif  " Close NERDTree when only window open

" NERDCommenter
let g:NERDSpaceDelims = 1        " Add spaces after comment delimiters by default<Paste>
let g:NERDDefaultAlign = 'left'  " Align all comments to the left by default (fixed <Lead>c<space> for toggling comments)

" Airline configuration
set background = "dark"                       " Vim background theme
colorscheme onedark                           " Vim theme
let g:airline_theme = 'onedark'               " Airline theme
let g:airline_powerline_fonts = 1             " Populate g:airline_symbols dict with powerline symbols
let g:airline#extensions#ale#enabled = 1      " Enable Ale linting

" Tabline configuration
let g:airline#extensions#tabline#enabled = 1  " Show Tapline (buffer tab bar)
" Move between tabs with \] or \[
map <Leader>] :bnext<CR>
map <Leader>[ :bprev<CR>
" Close current tab and show previous tab with \w
nnoremap <Leader>w :bp\|bd #<CR>

" CTRL+P
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window_bottom = 1
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0
let g:ctrlp_use_caching = 0 " Disable caching
nmap ; :CtrlPBuffer<CR>

" Vim configuration
syntax on                         " Turn on syntax highlighting
set t_Co=256                      " Enable 256 colors (for powerline)

set encoding=utf-8                " Set encoding (for powerline)
set guifont=Sauce\ Code\ Pro\ Nerd\ Font\ Complete\ Mono:h13

set mouse=a                       " Enable mouse scroll / click
set scroll=1                      " CTRL+Y/U/E/D scroll 1 line
map <ScrollWheelUp> <C-Y>
map <S-ScrollWheelUp> <C-U>
map <ScrollWheelDown> <C-E>
map <S-ScrollWheelDown> <C-D>

set number                        " Show line numbers.
set cursorline                    " Highlight cursor line
set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.
set colorcolumn=80                " Set vertical line at 80 character width.
set title                         " Set the terminal's title
set visualbell                    " No beeping.

set tabstop=2                     " Global tab width.
set shiftwidth=2                  " And again, related.
set softtabstop=2                 " And again, related.
set expandtab                     " Use spaces instead of tabs

set list                          " Show invisible chars (tabs, spaces, eof, etc)
set listchars=tab:›\ ,eol:¬       " Change symbols for a few invisibles
" VIM's global wildcard ignore
set wildignore+=*.o,*.obj,.git,node_modules,build/**

" Clear search highlight
nmap <Leader>q :nohlsearch<CR>

" j and k treat wrapping as separate rows
nmap j gj
nmap k gk
