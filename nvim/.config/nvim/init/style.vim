" show line numbers
set number

" disable weird cursor switching
set guicursor=

" enable syntax highlighting
syntax on
set background=dark

" don't show modes, already in the statusline
set noshowmode

" line number colors
highlight LineNr cterm=NONE ctermfg=DarkGrey ctermbg=NONE

" subtle highlight on col 80
set colorcolumn=80
highlight ColorColumn ctermbg=DarkGrey guibg=NONE
