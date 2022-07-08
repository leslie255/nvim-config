lua require('core.init')

set guifont=SFMono\ NERD\ Font:h13
set clipboard^=unnamed,unnamedplus

if has('unix')
	set thesaurus+=/usr/share/dict/words
endif

autocmd FileType markdown setlocal spell

