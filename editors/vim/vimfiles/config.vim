""" VIM CONFIG {{{
set nocompatible                        " Disable Compatibility with vi
filetype plugin indent on               " Enable File Type Detection
syntax on                               " Enable Syntax Highlight
set number                              " Set Line Numbers
set cursorline                          " Set Cursor Line Highlight
set shiftwidth=4                        " Set The Level Of Indentation
set shiftround                          " Shift to certain columns, not just n spaces
set tabstop=4                           " Set Tab Visual Size to 4 Columns
set softtabstop=4                       " Set The Size of the TAB key to 4 Columns
set expandtab                           " Uses Spaces instead of tabs
set copyindent                          " Make autoindent use the same chars as prev line
set autoindent                          " the same indent as the line you're currently on. Useful for READMEs, etc.
                                        " When opening a new line and no filetype-specific indenting is enabled, keep
set nobackup                            " Disable backup files
set nowb                                " Disable backup files
set noswapfile                          " Disable backup files
set scrolloff=10                        " Do not let cursor scroll below or above N number of lines when scrolling.
set nowrap                              " Do not wrap lines. Allow long lines to extend as far as the line goes.
set incsearch                           " While searching though a file incrementally highlight matching characters as you type.
set hlsearch                            " Use highlighting when doing a search.
set ignorecase                          " Ignore capital letters during search.
set showmatch                           " Show matching words during a search.
set infercase                           " Completion recognizes capitalization
set smartcase                           " Override the ignorecase option if searching for capital letters.
                                        " This will allow you to search specifically for capital letters.
set showcmd                             " Show partial command you type in the last line of the screen.
set showmode                            " Show the mode you are on the last line.
set history=1000                        " Set the commands to save in history default number is 20.
set backspace=indent,eol,start          " Allow backspacing over autoindent, line breaks and start of insert action
set notimeout ttimeout ttimeoutlen=200  " Quickly time out on keycodes, but never time out on mappings
set pastetoggle=<F11>                   " Use <F11> to toggle between 'paste' and 'nopaste'
set list                                " Show whitespace as special chars - see listchars
set listchars=space:_                   " Set the Spaces to Visually be _
set listchars=tab:>_ list               " Set the Tabs to Visually be >___
set lazyredraw                          " Set VIM to not redraw the screen during heavy tasks
set foldmethod=marker                   " Set foldmethod to braces
set magic                               " For regular expressions turn magic on
set mat=2                               " How many tenths of a second to blink when matching brackets
set autowrite                           " Write on :next/:prev/^Z
set autoread                            " Don't bother me hen a file changes
set cindent                             " Automatic program indenting
set commentstring=\ \ #%s               " When folds are created, add them to this
set encoding=utf8                       " UTF-8 by default
set linebreak                           " Break long lines by word, not char
set confirm                             " Instead of failing a command because of unsaved changes, instead raise a
                                        " dialogue asking if you wish to save changed files.
set cmdheight=2                         " Set the command window height to 2 lines, to avoid many cases of having to
                                        " "press <Enter> to continue"
set nostartofline                       " Stop certain movements from always going to the first character of a line.
                                        " While this behaviour deviates from that of Vi, it does what most users
                                        " coming from other editors would expect.
set formatoptions=tcqn1                 " t - autowrap normal text
                                        " c - autowrap comments
                                        " q - gq formats comments
                                        " n - autowrap lists
                                        " 1 - break _before_ single-letter words
                                        " 2 - use indenting from 2nd line of para
silent! nohlsearch                      " Some plugin seems to search for something at startup, so this fixes that.
""" }}}
""" WILDMENU {{{
set wildmenu                            " Enable auto completion menu after pressing TAB.
set wildmode=list:longest               " Make wildmenu behave like similar to Bash completion.
""" There are certain files that we would never want to edit with Vim.
""" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*.o,*~
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif
""" }}}
""" STATUSLINE {{{
set statusline=                         " Clear status line when vimrc is reloaded.
set statusline+=\ %F\ %M\ %Y\ %R\ %W    " Status line left side.
set statusline+=%=                      " Use a divider to separate the left side from the right side.
""" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
set laststatus=2                        " Always Show the Status Line
""" }}}
