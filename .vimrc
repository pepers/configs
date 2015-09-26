execute pathogen#infect()                  

" syntastic settings for syntax recognition
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 1


" gui settings:
if has('gui_running')
    set guioptions-=T				" no toolbar
    set background=dark				" changes background color
    colorscheme solarized			" changes font colorscheme

    " fonts across different platforms:
    if has("gui_gtk2")
        set guifont=Source\ Code\ Pro\ 11
    elseif has("gui_macvim")
        set guifont=Menlo\ Regular:h14
    elseif has("gui_win32")
        set guifont=Source_Code_Pro:h10:cANSI
        au GUIEnter * simalt ~x			" start window maximized	
    endif
else
    " running in linux terminal
    if (&t_Co == 256 || &t_Co == 88) && filereadable(expand("$HOME/.vim/plugin/guicolorscheme.vim"))
        runtime! plugin/guicolorscheme.vim
	GuiColorScheme solarized 
    endif	
endif


" key mappings
let mapleader = "\<Space>"    " set the spacebar to be the Leader key
nnoremap <Leader>o :enew<CR>
nnoremap <Leader>w :w<CR>
nmap <Leader>p "+p
nmap <Leader>P "+P


" common settings:
syntax on		" show colour syntax highligting
set number		" show line numbers
set relativenumber	" show relative line numbers 
set autoindent		" copies indentation of previous line when starting new line


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


" open NERDTree when vim starts 
augroup nerdtree
    let NERDTreeShowHidden=1
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
augroup END


" indentation settings based on file type being edited:
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

    autocmd Filetype java 
        \ set makeprg=javac\ -d\ %:~:h:s?src?bin?\ % 
        \ errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%# 
        map <F9> :make<Return>:copen<Return> 
        map <F10> :cprevious<Return> 
        map <F11> :cnext<Return> 
        map <F12> :!start cmd /k "java -classpath %:~:h:s?src?bin? %:r"
augroup END	
