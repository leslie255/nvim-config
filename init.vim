lua require('core.init')

set guifont=SFMono\ NERD\ Font:h13
set clipboard^=unnamed,unnamedplus

set colorcolumn=80

if has('unix')
    set dictionary+=/usr/share/dict/words
else
    set dictionary+=~/AppData/Local/nvim/words
endif
