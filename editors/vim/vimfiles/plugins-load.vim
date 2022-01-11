call plug#begin('$HOME/.dotfiles/editors/vim/.vim/plugins/')
	Plug 'preservim/nerdtree'
	Plug 'vim-syntastic/syntastic'
	Plug 'junegunn/fzf'
	Plug 'frazrepo/vim-rainbow'
	Plug 'airblade/vim-gitgutter/'
	Plug 'Xuyuanp/nerdtree-git-plugin'
	Plug 'ryanoasis/vim-devicons'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'vimsence/vimsence'
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
	Plug 'preservim/tagbar'
call plug#end()
