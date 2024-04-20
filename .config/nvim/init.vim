set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
lua vim.loader.enable()
source ~/.vimrc
