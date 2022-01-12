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
	Plug 'mileszs/ack.vim'
	Plug 'frazrepo/vim-rainbow'
	Plug 'preservim/nerdcommenter'
	Plug 'sheerun/vim-polyglot'
	Plug 'tpope/vim-surround'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'ycm-core/YouCompleteMe'
	Plug 'mattn/emmet-vim'
	Plug 'tpope/vim-commentary'
	Plug 'dense-analysis/ale'
call plug#end()
