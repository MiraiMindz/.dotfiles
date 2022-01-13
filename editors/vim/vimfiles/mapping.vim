let mapleader = "\""                                " Set the backslash as the leader key.
nnoremap <leader>\ ``                               " Press \\ to jump back to the last cursor position.
inoremap jj <Esc>                                   " Type jj to exit insert mode quickly.
nnoremap <space> :                                  " Press the space bar to type the : character in command mode.
nnoremap o o<esc>                                   " Pressing the letter o will open a new line below the current one.
nnoremap O O<esc>                                   " Exit insert mode after creating a new line above or below the current line.
nnoremap n nzz                                      " Center the cursor vertically when moving to the next word during a search.
nnoremap N Nzz                                      " Center the cursor vertically when moving to the next word during a search.
nnoremap Y y$                                       " Yank from cursor to the end of line.
nnoremap <c-j> <c-w>j                               " You can split the window in Vim by typing :split or :vsplit.
nnoremap <c-k> <c-w>k                               " Navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or CTRL+l.
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
noremap <c-up> <c-w>+                               " Resize split windows using arrow keys by pressing:
noremap <c-down> <c-w>-                             " CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-left> <c-w>>
noremap <c-right> <c-w><
inoremap <S-tab> <C-v><tab>                         " Insert Real Tab Chars with `expandtab` option
call togglebg#map("<F5>")                           " Function used on the solarized theme
""" Map auto complete of (, ", ', [                 " Map auto complete of (, ", ', [
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
nnoremap <F3> :NERDTreeToggle<cr>                   " NERDTree specific mappings.
                                                    " Map the F3 key to toggle NERDTree open and close.
nnoremap <silent> <leader>p :%w !lp<CR>             " Press \p to print the current file to the default printer
                                                    " from a Linux operating system.
                                                    " View available printers:   lpstat -v
                                                    " Set default printer:       lpoptions -d <printer_name>
                                                    " <silent> means do not display output.
nnoremap <f5> :w <CR>:!clear <CR>:!python3 % <CR>   " Map the F5 key to run a Python script inside Vim.
                                                    " I map F5 to a chain of commands here.
                                                    " :w saves the file.
                                                    " <CR> (carriage return) is like pressing the enter key.
                                                    " !clear runs the external clear screen command.
                                                    " !python3 % executes the current file with Python.

""" Tab Mapping                                     " Tab Mapping
inoremap <F2> :tabnew<cr>                           " New Tab
nnoremap <F2> :tabnew<cr>                           " New Tab
vnoremap <F2> :tabnew<cr>                           " New Tab
inoremap <C-S-right><esc> :tabnext<esc><cr>         " Next Tab
vnoremap <C-S-right><esc> :tabnext<esc><cr>         " Next Tab
nnoremap <C-S-right> :tabnext<cr>                   " Next Tab
inoremap <C-S-left><esc> :tabprevious<esc><cr>      " Previous Tab
vnoremap <C-S-left><esc> :tabprevious<esc><cr>      " Previous Tab
nnoremap <C-S-left> :tabprevious<cr>                " Previous Tab

""" Vim Airline Buffer Mappings                     " Vim Airline Buffer Mappings
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab0
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab
inoremap <A-S-right><esc> :bnext<esc><cr>         " Next Buffer
vnoremap <A-S-right><esc> :bnext<esc><cr>         " Next Buffer
nnoremap <A-S-right> :bnext<cr>                   " Next Buffer
inoremap <A-S-left><esc> :bprevious<esc><cr>      " Previous Buffer
vnoremap <A-S-left><esc> :bprevious<esc><cr>      " Previous Buffer
nnoremap <A-S-left> :bprevious<cr>                " Previous Buffer

