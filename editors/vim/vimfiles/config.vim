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
" set listchars=tab:>~ list
set listchars=tab:>> list

""" Set VIM to not redraw the screen during heavy tasks
set lazyredraw

""" Set foldmethod to indentation
set foldmethod=indent

""" For regular expressions turn magic on
set magic

""" How many tenths of a second to blink when matching brackets
set mat=2

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
