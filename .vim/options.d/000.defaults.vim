"
" [Options] Defaults
"

let g:VM_leader="'"		" Set Visual-Multi (VM) leader
let mapleader="'"		" Set mapping leader string

set bs=2			" Backspace over indent,eol,start
set cinoptions=(0,W8,m1		" Set cindent options
set cursorcolumn cursorline	" Highlight the screen {column,line} of the cursor
set encoding=utf-8		" Global UTF-8 character encoding
set ignorecase			" Ignore case when searching
set incsearch nohlsearch	" Incremental search, no match highlighting
set laststatus=2 noshowmode	" Last window always has status line, don't show mode in last line
set modeline			" Parse {vi{,m}, ex} (1) modelines
set mouse=a			" Enable the use of the mouse for all modes
set nobackup nowritebackup	" Don't write backups for existing files
set nocindent nosmartindent	" Disable {C, Smart} indenting
set noexpandtab sw=8 ts=8	" No VT, shift width, tab stops
set noundofile			" Do not automatically saves undo history
set nowrap			" Don't wrap long lines
set number			" Show line numbers
set showcmd			" Show (partial) command in the last line
set t_Co=256			" Force 256 colour terminal
set termwinkey=<C-T>		" Set key starts a command in a terminal window to CTRL-T
set tw=125			" Maximum width of text that is being inserted
set viminfo=""			" Neither read nor write /viminfo/ file
set virtualedit=block		" Allow virtual editing in Visual block mode
set wildmode=longest,list,full	" Completion mode [for] wildcard expansion in the command-line

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
