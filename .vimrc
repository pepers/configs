" Matthew Pepers
" Launch Config {{{
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'severin-lemaignan/vim-minimap'
call vundle#end()
filetype plugin on
execute pathogen#infect()
" }}}
 " Colours {{{
syntax on                           " show colour syntax highligting
set background=dark                 " changes background color
colorscheme solarized               " changes font colorscheme
autocmd VimEnter * Minimap          " shows minimap    
if !has('gui_running')              " running in terminal 
    set t_Co=256                    " use 256 colours in terminal
    autocmd VimEnter * MinimapClose " closes minimap in terminal
endif
" }}}
" Spaces & Tabs {{{
set autoindent          " copies indentation of previous line when starting new line
set tabstop=4           " existing tabs are 4 columns wide
set softtabstop=4       " pressing tab moves 4 columns over
set shiftwidth=4        " indenting is 4 column wide
set expandtab           " use spaces for tabs

set modeline            " enable modelines
set modelines=1         " check last line of file for modeline

augroup indentation
    autocmd!

    autocmd FileType make  
        \ setlocal noexpandtab

    autocmd FileType markdown
        \ set tabstop=2
        \ softtabstop=2
        \ shiftwidth=2
        \ expandtab | retab

    autocmd FileType c,cpp 
        \ set tabstop=8 
        \ softtabstop=4 
        \ shiftwidth=4 
        \ expandtab | retab 

    autocmd FileType haskell 
        \ set tabstop=8 
        \ expandtab 
        \ softtabstop=4 
        \ shiftwidth=4 
        \ shiftround
augroup END	
" }}}
" UI Layout {{{
set number              " show line numbers
set relativenumber      " show relative line numbers 
set showcmd             " show command in bottom bar
set showmatch           " when cursor is on top of ({[etc. the matching ]}) will be highlighted     
" }}}
" Platform {{{
" gui settings:
if has('gui_running')
    set guioptions-=T				" no toolbar

    " fonts across different platforms:
    if has("gui_gtk2")
        set guifont=Source\ Code\ Pro\ 11
    elseif has("gui_macvim")
        set guifont=Menlo\ Regular:h14
    elseif has("gui_win32")
        set guifont=Source_Code_Pro:h10:cANSI
        au GUIEnter * simalt ~x			" start window maximized	
    endif
endif
" }}}
" Custom Leader {{{
let mapleader = "\<Space>"    " set the spacebar to be the Leader key
nnoremap <Leader>o :enew<CR>
nnoremap <Leader>w :w<CR>
nmap <Leader>p "+p
nmap <Leader>P "+P
" }}}
" Folding {{{
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " enable folding 
set foldlevelstart=10   " start with fold level of 1
nnoremap <space> za     " space opens/closes fold
" }}}
" Autogroups {{{
" highlight text past 80 character standard limit 
augroup text_too_wide
    autocmd!
    autocmd BufEnter * highlight OverLength guibg=#073642
    autocmd BufEnter * match OverLength /\%80v.*/
augroup END

" settings for recognizing new filetypes (for syntax highlighting)
augroup file_types
    autocmd!
    autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
augroup END

" reload vimrc each time it is saved 
augroup reload_vimrc 
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END 
" }}}
" Syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1
" }}}
" NERDTree {{{
augroup nerdtree
    let NERDTreeShowHidden=1
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
augroup END
" }}}

" vim: set foldmethod=marker foldlevel=0:
