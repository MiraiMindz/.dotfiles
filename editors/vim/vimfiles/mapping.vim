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