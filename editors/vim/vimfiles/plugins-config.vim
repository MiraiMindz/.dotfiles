""" NERDTree Configs {{{
let NERDTreeShowHidden=1    " Show Hidden Files
""" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']
""" }}}
""" AirLine Configs {{{
""" Configs {{{
let g:airline_experimental = 1                              " Enables experimental features
let g:airline_left_sep = '<'                                " Set the airline Left Separator
let g:airline_right_sep = '>'                               " Set the airline Right Separator
let g:airline_detect_modified = 1                           " Enable Modified Detection
let g:airline_detect_paste = 1                              " Enable Paste Detection
let g:airline_detect_crypt = 1                              " Enable Crypt Detection
let g:airline_detect_spell = 1                              " Enable Spell Detection
let g:airline_detect_spelllang = 1                          " Enable Language Spelling detection
let g:airline_detect_iminsert = 1                           " Enable iminsert Detection
let g:airline_inactive_collapse = 1                         " Collapse the Left Section when Window is Inactive
let g:airline_powerline_fonts = 1                           " Use PowerLine Symbols instead of UTF-8 Symbols
let g:airline_skip_empty_section = 1                        " Don't Draw Separators for empty sections
let g:airline_stl_path_style = 'short'                      " Display short path in the status line

""" Set the text to be displayed in each mode
let g:airline_mode_map = {
    \ '__'      : '-',
    \ 'c'       : 'C',
    \ 'i'       : 'I',
    \ 'ic'      : 'I',
    \ 'ix'      : 'I',
    \ 'n'       : 'N',
    \ 'multi'   : 'M',
    \ 'ni'      : 'N',
    \ 'no'      : 'N',
    \ 'R'       : 'R',
    \ 'Rv'      : 'R',
    \ 's'       : 'S',
    \ 'S'       : 'S',
    \ '^S'      : 'S',
    \ 't'       : 'T',
    \ 'v'       : 'V',
    \ 'V'       : 'V',
    \ '^V'      : 'V',
\ }

""" Define the set of names to be displayed instead of a specific filetypes (for section A and B)
let g:airline_filetype_overrides = {
    \ 'coc-explorer':  [ 'CoC Explorer', '' ],
    \ 'defx':  ['defx', '%{b:defx.paths[0]}'],
    \ 'fugitive': ['fugitive', '%{airline#util#wrap(airline#extensions#branch#get_head(),80)}'],
    \ 'floggraph':  [ 'Flog', '%{get(b:, "flog_status_summary", "")}' ],
    \ 'gundo': [ 'Gundo', '' ],
    \ 'help':  [ 'Help', '%f' ],
    \ 'minibufexpl': [ 'MiniBufExplorer', '' ],
    \ 'nerdtree': [ get(g:, 'NERDTreeStatusline', 'NERD'), '' ],
    \ 'startify': [ 'startify', '' ],
    \ 'vim-plug': [ 'Plugins', '' ],
    \ 'vimfiler': [ 'vimfiler', '%{vimfiler#get_status_string()}' ],
    \ 'vimshell': ['vimshell','%{vimshell#get_status_string()}'],
    \ 'vaffle' : [ 'Vaffle', '%{b:vaffle.dir}' ],
\ }
""" }}}
""" Customization {{{
""" check if airline_symbols exists, to avoid overwriting
if !exists('g:ailine_symbols')
    let g:airline_symbols = {}
endif

""" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.colnr = ' ㏇:'
let g:airline_symbols.colnr = ' ℅:'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.linenr = ' ␊:'
let g:airline_symbols.linenr = ' ␤:'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.maxlinenr = '㏑'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = 'Ξ'

""" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' :'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = '☰ '
let g:airline_symbols.dirty='⚡'

""" old vim-powerline symbols
" let g:airline_left_sep = '⮀'
" let g:airline_left_alt_sep = '⮁'
" let g:airline_right_sep = '⮂'
" let g:airline_right_alt_sep = '⮃'
" let g:airline_symbols.branch = '⭠'
" let g:airline_symbols.readonly = '⭤'
" let g:airline_symbols.linenr = '⭡'

""" }}}
""" Extensions Integration {{{
""" ALE {{{
let g:airline#extensions#ale#enabled = 1                            " enable/disable ale integration
let airline#extensions#ale#error_symbol = 'E:'                      " ale error_symbol
let airline#extensions#ale#warning_symbol = 'W:'                    " ale warning
let airline#extensions#ale#show_line_numbers = 1                    " ale show_line_numbers
let airline#extensions#ale#open_lnum_symbol = '(L'                  " ale open_lnum_symbol
let airline#extensions#ale#close_lnum_symbol = ')'                  " ale close_lnum_symbol
""" }}}
""" Vim-Fugitive {{{
" let g:airline#extensions#branch#enabled = 1                         " Enable/disable fugitive/lawrencium integration
" let g:airline#extensions#branch#vcs_priority = ["git", "mercurial"] " Set the priority of vcs branchs
" let g:airline#extensions#branch#empty_message = ''                  " Change text when branch is not detected
" let g:airline#extensions#branch#displayed_head_limit = 16           " Truncate long branch names to fixed lenght

""" Customize Formatting of Branch Name
" let g:airline#extensions#branch#format = 2                          " Truncate all paths except the last one
""" }}}
""" DefaultStatusLine {{{
""" Ccontrol which sections get truncated and at what width.
let g:airline#extensions#default#section_truncate_width = {
    \ 'b': 79,
    \ 'x': 60,
    \ 'y': 88,
    \ 'z': 45,
    \ 'warning': 80,
    \ 'error': 80,
\ }

""" Configure the layout of the sections by specifying an array of two arrays (first array is the left side, second array is the right side)
let g:airline#extensions#default#layout = [
    \ [ 'a', 'b', 'c' ],
    \ [ 'x', 'y', 'z', 'error', 'warning' ]
\ ]
""" configure the layout to not use %(%) grouping items in the statusline.
let airline#extensions#default#section_use_groupitems = 1
""" }}}
""" Hunks {{{
let g:airline#extensions#hunks#enabled = 1                          " Enable Hunks
let g:airline#extensions#hunks#non_zero_only = 0                    " Only Show Non-Zero Hunks
let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']       " Set Hunks Symbols
""" }}}
""" Syntastic {{{
let g:airline#extensions#syntastic#enabled = 1                      " Enables Syntastic
let airline#extensions#syntastic#error_symbol = 'E:'                " Set Error Symbol
let airline#extensions#syntastic#warning_symbol = 'W:'              " Set Warning Symbol
let airline#extensions#syntastic#stl_format_err = '%E{[%fe(#%e)]}'  " Set Error Format
let airline#extensions#syntastic#stl_format_warn = '%W{[%fw(#%w)]}' " Set Warning Format
""" }}}
""" TagBar {{{
let g:airline#extensions#tagbar#enabled = 1                         " Enables TagBar
let g:airline#extensions#tagbar#flags = 'f'                         " Show Full Tag Hierarchy
let g:airline#extensions#tagbar#searchmethod = 'nearest-stl'
""" }}}
""" Airline-WhiteSpace {{{
let g:airline#extensions#whitespace#enabled = 1                 " Enables WhiteSpace Checking
let g:airline#extensions#whitespace#symbol = '!'                " Customize White Space Symbol
let g:airline#extensions#whitespace#show_message = 1            " Configure whether a message should be displayed.
let g:airline#extensions#whitespace#trailing_regexp = '\s$'     " Configure custom trailing whitespace regexp rule

""" Configure the formatting of the warning messages.
let g:airline#extensions#whitespace#trailing_format = 'trailing[%s]'
let g:airline#extensions#whitespace#mixed_indent_format = 'mixed-indent[%s]'
let g:airline#extensions#whitespace#long_format = 'long[%s]'
let g:airline#extensions#whitespace#mixed_indent_file_format = 'mix-indent-file[%s]'
let g:airline#extensions#whitespace#conflicts_format = 'conflicts[%s]'

" configure the max number of lines where whitespace checking is enabled.
let g:airline#extensions#whitespace#max_lines = 20000

" Certain number of spaces are allowed after tabs, but not in between
" This algorithm works well for /* */ style comments in a tab-indented file
let g:airline#extensions#whitespace#mixed_indent_algo = 1

""" Configure which whitespace checks to enable.
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing', 'long', 'mixed-indent-file', 'conflicts' ]

""" Configure, which filetypes have special treatment of /* */ comments, matters for mix-indent-file algorithm
let airline#extensions#c_like_langs = ['arduino', 'c', 'cpp', 'cuda', 'go', 'javascript', 'ld', 'php']

""" Disable specific whitespace checks for individual filetypes
let g:airline#extensions#whitespace#skip_indent_check_ft = {'go': ['mixed-indent-file']}
""" }}}
""" TabLine {{{
let g:airline#extensions#tabline#enabled = 1                " Enable Smart TabLines
let g:airline#extensions#tabline#left_sep = ' '             " Set the Tab Left Separator
let g:airline#extensions#tabline#left_alt_sep = '|'         " Set the Alternative Tab Left Separator
let g:airline#extensions#tabline#fnamemod = ':p:.'
let g:airline#extensions#tabline#fnamecollapse = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
""" }}}
let g:airline#extensions#fzf#enabled = 1                            " Enable FZF Integration
let g:airline#extensions#nerdtree_statusline = 1                    " Enable NerdTree Status Line

""" }}}
""" }}}

