""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""                                                """
"""      ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗   """
"""      ██║   ██║██║████╗ ████║██╔══██╗██╔════╝   """
"""      ██║   ██║██║██╔████╔██║██████╔╝██║        """
"""      ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║        """
"""   ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗   """
"""   ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝   """
"""                                                """
""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" PLUGINS {{{
call plug#begin('$HOME/.dotfiles/vim/plugins/')
	Plug 'preservim/nerdtree'
	Plug 'vim-syntastic/syntastic'
	Plug 'junegunn/fzf'
	Plug 'frazrepo/vim-rainbow'
	Plug 'airblade/vim-gitgutter/'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'ryanoasis/vim-devicons'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'vimsence/vimsence'
call plug#end()
""" }}}
""" VIM CONFIG {{{
""" Disable Compatibility with vi
set nocompatible

""" Enable File Type Detection
filetype on
filetype plugin on
filetype indent on

""" Enable Syntax Highlight
syntax on

""" Set Line Numbers
set number

""" Set Cursor Line Highlight
set cursorline

""" Set The Level Of Indentation
set shiftwidth=4

""" Set Tab Visual Size to 4 Columns
set tabstop=4

""" Set The Size of the TAB key to 4 Columns
set softtabstop=4

""" Uses Spaces instead of tabs
set expandtab

""" Disable backup files
set nobackup
set nowb
set noswapfile

""" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

""" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

""" While searching though a file incrementally highlight matching characters as you type.
set incsearch

""" Use highlighting when doing a search.
set hlsearch

""" Ignore capital letters during search.
set ignorecase

""" Show matching words during a search.
set showmatch

""" Override the ignorecase option if searching for capital letters.
""" This will allow you to search specifically for capital letters.
set smartcase

""" Show partial command you type in the last line of the screen.
set showcmd

""" Show the mode you are on the last line.
set showmode

""" Set the commands to save in history default number is 20.
set history=1000

""" When opening a new line and no filetype-specific indenting is enabled, keep
""" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

""" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

""" Stop certain movements from always going to the first character of a line.
""" While this behaviour deviates from that of Vi, it does what most users
""" coming from other editors would expect.
set nostartofline

""" Instead of failing a command because of unsaved changes, instead raise a
""" dialogue asking if you wish to save changed files.
set confirm

""" Set the command window height to 2 lines, to avoid many cases of having to
""" "press <Enter> to continue"
set cmdheight=2

""" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

""" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

""" Set the Spaces to Visually be _
set listchars=space:_

""" Set the Tabs to Visually be >~~~~
set listchars=tab:>~ list

""" Set VIM to not redraw the screen during heavy tasks
set lazyredraw

""" Set foldmethod to indentation
set foldmethod=indent

""" For regular expressions turn magic on
set magic

""" How many tenths of a second to blink when matching brackets
set mat=2

""" }}}
""" PLUGINS CONFIG {{{
""" NERDTree Configs {{{
""" Show Hidden Files
let NERDTreeShowHidden=1

""" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']
""" }}}
""" }}}
""" WILDMENU {{{
""" Enable auto completion menu after pressing TAB.
set wildmenu

""" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

""" There are certain files that we would never want to edit with Vim.
""" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*.o,*~
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif
""" }}}
""" VIMSCRIPTS {{{
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

""" Functions {{{
""" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

""" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction
""" }}}
""" }}}
""" STATUSLINE {{{
""" Clear status line when vimrc is reloaded.
set statusline=

""" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R\ %W

""" Use a divider to separate the left side from the right side.
set statusline+=%=

""" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

""" Always Show the Status Line
set laststatus=2
""" }}}
""" KEYMAPS {{{
""" Set the backslash as the leader key.
let mapleader = "\""

""" Press \\ to jump back to the last cursor position.
nnoremap <leader>\ ``

""" Press \p to print the current file to the default printer from a Linux operating system.
""" View available printers:   lpstat -v
""" Set default printer:       lpoptions -d <printer_name>
""" <silent> means do not display output.
nnoremap <silent> <leader>p :%w !lp<CR>

""" Type jj to exit insert mode quickly.
inoremap jj <Esc>

""" Press the space bar to type the : character in command mode.
nnoremap <space> :

""" Pressing the letter o will open a new line below the current one.
""" Exit insert mode after creating a new line above or below the current line.
nnoremap o o<esc>
nnoremap O O<esc>

""" Center the cursor vertically when moving to the next word during a search.
nnoremap n nzz
nnoremap N Nzz

""" Yank from cursor to the end of line.
nnoremap Y y$

""" Map the F5 key to run a Python script inside Vim.
""" I map F5 to a chain of commands here.
""" :w saves the file.
""" <CR> (carriage return) is like pressing the enter key.
""" !clear runs the external clear screen command.
""" !python3 % executes the current file with Python.
nnoremap <f5> :w <CR>:!clear <CR>:!python3 % <CR>

""" You can split the window in Vim by typing :split or :vsplit.
""" Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

""" Resize split windows using arrow keys by pressing:
""" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

""" NERDTree specific mappings.
""" Map the F3 key to toggle NERDTree open and close.
nnoremap <F3> :NERDTreeToggle<cr>

""" Map auto complete of (, ", ', [
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a`<esc>`<i`<esc>
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i

""" Insert Real Tab Chars with `expandtab` option
inoremap <S-tab> <C-v><tab>

""" }}}

