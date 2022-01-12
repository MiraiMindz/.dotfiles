augroup filetype_vim                                            " This will enable code folding. Use the marker method of folding.
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab " If the current file type is HTML, set indentation to 2 spaces.
if version >= 703                                               " If Vim version is equal to or greater than 7.3 enable undofile.
    set undodir=~/.vim/backup                                   " This allows you to undo changes to a file even after saving it.
    set undofile
    set undoreload=10000
endif
augroup cursor_off                                              " You can split a window into sections by typing `:split` or `:vsplit`.
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn          " Display cursorline and cursorcolumn ONLY in active window.
    autocmd WinEnter * set cursorline cursorcolumn
augroup END


if has('gui_running')                                           " If GUI version of Vim is running set these options.
    set background=dark                                         " Set the background tone.
    colorscheme molokai                                         " Set the color scheme.
    set guifont=CascadiaCodePL\ 12                              " Set a custom font you have installed on your computer.
                                                                " Syntax: set guifont=<font_name>\ <font_weight>\ <size>
    set guioptions-=T                                           " Display more of the file by default.
                                                                " Hide the toolbar.
    set guioptions-=L                                           " Hide the the left-side scroll bar.
    set guioptions-=r                                           " Hide the the right-side scroll bar.
    set guioptions-=m                                           " Hide the the menu bar.
    set guioptions-=b                                           " Hide the the bottom scroll bar.
    nnoremap <F4> :if &guioptions=~#'mTr'<Bar>                  " Map the F4 key to toggle the menu, toolbar, and scroll bar.
        \set guioptions-=mTr<Bar>                               " <Bar> is the pipe character.
        \else<Bar>                                              " <CR> is the enter key.
        \set guioptions+=mTr<Bar>
        \endif<CR>
endif
if has('mouse')                                                 " Set Mouse
    set mouse=a
endif

