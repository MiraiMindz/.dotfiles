""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""                                                      """
"""   ██╗███╗  ██╗██╗██████╗   ██╗   ██╗██╗███╗   ███╗   """
"""   ██║████╗ ██║██║╚═██╔═╝   ██║   ██║██║████╗ ████║   """
"""   ██║██╔██╗██║██║  ██║     ██║   ██║██║██╔████╔██║   """
"""   ██║██║╚████║██║  ██║     ╚██╗ ██╔╝██║██║╚██╔╝██║   """
"""   ██║██║ ╚███║██║  ██║  ██╗ ╚████╔╝ ██║██║ ╚═╝ ██║   """
"""   ╚═╝╚═╝  ╚══╝╚═╝  ╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝   """
"""                                                      """
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

for f in split(glob('$HOME/.config/nvim/nvimfiles/*.vim'), '\n')
    exe 'source' f
endfor

