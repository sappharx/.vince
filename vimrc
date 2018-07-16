
"***********************************************
"***********************************************
"
" Editor "style"
"
"***********************************************
"***********************************************

"********************
" Default settings
"********************

" always show line numbers
set number

"***************
" Keybindings
"***************

" provide line number toggle
" maps the character sequence, `g n`, to the command 'set invnu'
" 'inv' is short for invert, 'nu' is short for number (the configuration value for whether or not to show line numbers)
:map gn :set invnu<CR>



"***********************************************
"***********************************************
"
" Formatting
"
"***********************************************
"***********************************************

"***************
" Indentation
"***************

"set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab


"***********************************************
"***********************************************
"
" Insert mode keybindings
"
"***********************************************
"***********************************************

" command syntax (see `:help map` for waaaaay more info)
" {mapcmd} {lhs} {rhs}
" where:
"   {mapcmd} is one of 'imap', 'inoremap', or 'iunmap'
"     the 'i' denotes the mappings will only work in INSERT mode
"     'nore' is short for 'no recursive', which disallows the {rhs} from being scanned for additional mappings
"   {lhs} is the sequence of keys to bind to, e.g. 'ab' or '<F4>'
"   {rhs} is the macro to execute, e.g. '<ESC>', '/[.,;]<CR>', or 'FunctionName()' 

" allow double-j to exit INSERT mode
inoremap jj <ESC>

