"""" This will enable code folding.
""" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" If the current file type is HTML, set indentation to 2 spaces.
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

" If Vim version is equal to or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" You can split a window into sections by typing `:split` or `:vsplit`.
" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END

" If GUI version of Vim is running set these options.
if has('gui_running')

    " Set the background tone.
    set background=dark

    " Set the color scheme.
    colorscheme molokai

    """ Set a custom font you have installed on your computer.
    """ Syntax: set guifont=<font_name>\ <font_weight>\ <size>
    set guifont=Monospace\ Regular\ 12

    """ Display more of the file by default.
    """ Hide the toolbar.
    set guioptions-=T

    """ Hide the the left-side scroll bar.
    set guioptions-=L

    """ Hide the the right-side scroll bar.
    set guioptions-=r

    """ Hide the the menu bar.
    set guioptions-=m

    """ Hide the the bottom scroll bar.
    set guioptions-=b

    """ Map the F4 key to toggle the menu, toolbar, and scroll bar.
    """ <Bar> is the pipe character.
    """ <CR> is the enter key.
    nnoremap <F4> :if &guioptions=~#'mTr'<Bar>
        \set guioptions-=mTr<Bar>
        \else<Bar>
        \set guioptions+=mTr<Bar>
        \endif<CR>

endif

""" Set Mouse
if has('mouse')
    set mouse=a
endif

