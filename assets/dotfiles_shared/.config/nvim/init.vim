execute pathogen#infect()

"
" This is a special kind of option, because when it's set or reset, other
" options are also changed as a side effect.  CAREFUL: Setting or resetting
" this option can have a lot of unexpected effects: Mappings are interpreted
" in another way, undo behaves differently, etc.  If you set this option in
" your vimrc file, you should probably put it at the very start.
" [ ... ]
" When a |vimrc| or |gvimrc| file is found while Vim is starting up, this option
" is switched off, and all options that have not been modified will be set to
" the Vim defaults.  Effectively, this means that when a |vimrc| or |gvimrc|
" file exists, Vim will use the Vim defaults, otherwise it will use the Vi
" defaults.  (Note: This doesn't happen for the system-wide vimrc or gvimrc
" file, nor for a file given with the |-u| argument).
"
set nocompatible

"
" Default Vim options
"
filet on | filet plugin on	" Enable file type detection, load plugin files
set bs=2			" Backspace over indent,eol,start
set cursorcolumn cursorline	" Highlight the screen {column,line} of the cursor
set encoding=utf-8		" Global UTF-8 character encoding
set ignorecase			" Ignore case when searching
set incsearch nohlsearch	" Incremental search, no match highlighting
set modeline			" Parse {vi{,m}, ex} (1) modelines
set mouse=a			" Enable the use of the mouse for all modes
set nobackup nowritebackup	" Don't write backups for existing files
set nosmartindent nocindent	" Disable {C, Smart} indenting
set nowrap			" Don't wrap long lines
set number			" Show line numbers
"set scrolloff=999 		" Keep cursor line in the middle of screen when searching
set showcmd			" Show (partial) command in the last line
set t_Co=256			" Force 256 colour terminal
set ts=8 sw=8 noexpandtab	" Tab stops, shift width, no VT
set tw=125			" Maximum width of text that is being inserted
set noundofile			" Do not automatically saves undo history
set viminfo=""			" Neither read nor write /viminfo/ file
set virtualedit=block		" Allow virtual editing in Visual block mode
set wildmode=longest,list,full	" Completion mode [for] wildcard expansion in the command-line

"
" Automatic Vim options
"
autocmd FileType netrw setl bufhidden=wipe
autocmd WinLeave * set nocursorline nocursorcolumn
autocmd WinEnter * set cursorline cursorcolumn

"
" Conditional default Vim options
"
if has("folding") | set foldmethod=marker commentstring=/*\ %s\ */ | endif
if has("statusline") | set ruler | set rulerformat=%15(%l,%c%V\ %P%) | endif
if has("syntax") | syntax on | colors peaksea | set background=dark | endif

"
" Plugin options
"
let g:filesearch_autodismiss_on_select = 0
				" Selecting an entry with <CR> will not close the catalog
let g:filesearch_viewport_split_policy = "B"
				" Horizontal bottom (full screen width)
let g:gitgutter_enabled = 0
let g:LargeFile = 10		" The minimum size of a file needed for it to be
				" considered as a "LargeFile", in megabytes
let g:netrw_banner = 0		" Suppress the [netrw] banner
let g:netrw_browse_split = 0	" When browsing, <cr> will open the file by re-using the same window
let g:netrw_dirhistmax = 0	" Suppress [netrw] history
let g:netrw_liststyle = 3	" Set the default listing style [to] tree style listing
let g:netrw_winsize = 25	" Specify initial size of new windows
let g:SuperTabMappingBackward = '<S-C-t>'
let g:SuperTabMappingForward = '<C-t>'

"
" UNIX is atrocious crusader garbage built on horribly inadequate abstractions mappings
"
map <Esc>[11~ <F1>
map <Esc>[12~ <F2>
map <Esc>[13~ <F3>
map <Esc>[14~ <F4>

"
" Git mappings
"
map <C-e> :GitGutterToggle<cr>
map <F1> :Gcommit
map <F2> :Gdiff<cr>
map <F3> :Gpush
map <F4> :Gstatus<cr>

"
" Tab & window mappings
"
map <C-h> :tabprev<cr>
map <C-j> :wincmd j<cr>
map <C-k> :wincmd k<cr>
map <C-l> :tabnext<cr>
map <C-m> :tabm 
map <C-o> :wincmd l<cr>
map <C-y> :wincmd h<cr>

map <F5> :new<cr>
map <F6> :vnew<cr>
map <F7> :tabnew<cr>
map <F8> :close<cr>

"
" File system/OS interaction mappings
"
map <C-_> :source Session.vim
map <C-\> :mks!<cr>
map <C-i> :new\|setlocal bufhidden=wipe buftype=nofile noswapfile\|0read! 
map <C-n> :Neomake<cr>
map <C-x> :call terminal#ChooseTerm("term-slider", 1)<cr>
map <F9> "zyiw:exe "Man ".@z.""<cr>
map <F10> :Fsglob /
map <F11> :Fsgrep /
map <F12> :NERDTreeToggle<cr>

" vim:fileencoding=utf-8 filetype=vim
" vim:noexpandtab sw=8 ts=8 tw=120