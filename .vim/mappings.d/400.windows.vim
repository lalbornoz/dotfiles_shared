"
" [Mappings] Windows menu mappings
"

call AddMenu("Windows")
call AddMapping("Windows", "Go to tab #1", '', '<silent>', '<Alt>1', '1gt')
call AddMapping("Windows", "Go to tab #2", '', '<silent>', '<Alt>2', '2gt')
call AddMapping("Windows", "Go to tab #3", '', '<silent>', '<Alt>3', '3gt')
call AddMapping("Windows", "Go to tab #4", '', '<silent>', '<Alt>4', '4gt')
call AddMapping("Windows", "Go to tab #5", '', '<silent>', '<Alt>5', '5gt')
call AddMapping("Windows", "Go to tab #6", '', '<silent>', '<Alt>6', '6gt')
call AddMapping("Windows", "Go to tab #7", '', '<silent>', '<Alt>7', '7gt')
call AddMapping("Windows", "Go to tab #8", '', '<silent>', '<Alt>8', '8gt')
call AddMapping("Windows", "Go to tab #9", '', '<silent>', '<Alt>9', '9gt')
call AddSeparator("Windows")
call AddMapping("Windows", "Open QuickUI menu", '', '<silent>', '<Alt>m', ':<C-U>call quickui#menu#open()<CR>')
call AddSeparator("Windows")
call AddMapping("Windows", "Create new window", '', '<silent>', '<F7>', ':<C-U>new<CR>')
call AddMapping("Windows", "Create new vertically split window", '', '<silent>', '<S-F7>', ':<C-U>vnew<CR>')
call AddMapping("Windows", "Open a new tab page", '', '<silent>', '<F8>', ':<C-U>tabnew<CR>')
call AddMapping("Windows", "Close current tab/window", '', '<silent>', '<S-F8>', ':<C-U>close<CR>')
call AddSeparator("Windows")
call AddMapping("Windows", "Go to previous tab", "Go to previous tab page w/ wraparound", '<silent>', '<Alt><Shift><Left>', ':<C-U>tabprev<CR>')
call AddMapping("Windows", "Move to tmux or Vim window above", "Move to 1st tmux pane or Vim window above current", '<silent>', '<Alt><Up>', ':<C-U>TmuxNavigateUp<CR>')
call AddMapping("Windows", "Move to tmux or Vim window below", "Move to 1st tmux pane or Vim window below current", '<silent>', '<Alt><Down>', ':<C-U>TmuxNavigateDown<CR>')
call AddMapping("Windows", "Go to next tab page", "Go to next tab page w/ wraparound", '<silent>', '<Alt><Shift><Right>', ':<C-U>tabnext<CR>')
call AddMapping("Windows", "Move to window to left", "Move to 1st window left of current", '<silent>', '<Alt><Left>', ':<C-U>wincmd h<CR>')
call AddMapping("Windows", "Move to window to right", "Move to 1st window right of current", '<silent>', '<Alt><Right>', ':<C-U>wincmd l<CR>')
call AddMapping("Windows", "Move window to new tab", "Move window to new tab page", '<silent>', '<Alt><Shift><Up>', ':<C-U>wincmd T<CR>')
call AddMapping("Windows", "Split window", "Split current window in two", '<silent>', '<Alt><Shift><Down>', ':<C-U>wincmd s<CR>')
call AddSeparator("Windows")
call AddMapping("Windows", "Go to previous tab", "Go to previous tab page w/ wraparound", '<silent>', '<C-f>', ':<C-U>tabprev<CR>')
call AddMapping("Windows", "Move to tmux or Vim window above", "Move to 1st tmux pane or Vim window above current", '<silent>', '<C-k>', ':<C-U>TmuxNavigateUp<CR>')
call AddMapping("Windows", "Move to tmux or Vim window below", "Move to 1st tmux pane or Vim window below current", '<silent>', '<C-j>', ':<C-U>TmuxNavigateDown<CR>')
call AddMapping("Windows", "Go to next tab", "Go to next tab page w/ wraparound", '<silent>', '<C-h>', ':<C-U>tabnext<CR>')
call AddMapping("Windows", "Move to window to left", "Move to 1st window left of current", '<silent>', '<C-y>', ':<C-U>wincmd h<CR>')
call AddMapping("Windows", "Move to window to right", "Move to 1st window right of current", '<silent>', '<C-]>', ':<C-U>wincmd l<CR>')
call AddMapping("Windows", "Move window to new tab", "Move window to new tab page", '<silent>', '<C-g>', ':<C-U>wincmd T<CR>')
call AddMapping("Windows", "Split window", "Split current window in two", '<silent>', '<C-t>', ':<C-U>wincmd s<CR>')
call AddSeparator("Windows")
call AddTMapping("Windows", "Switch to terminal normal mode", "Switch to terminal normal mode (terminal job mode)", '<silent>', '<C-b>', '<C-T>N')
call AddTMapping("Windows", "Go to previous tab", "Go to previous tab page w/ wraparound (terminal job mode)", '<silent>', '<C-h>', '<C-T>:tabprev<CR>')
call AddTMapping("Windows", "Go to next tab", "Go to next tab page w/ wraparound (terminal job mode)", '<silent>', '<C-f>', '<C-T>:tabnext<CR>')
call AddTMapping("Windows", "Move to tmux or Vim window above", "Move to 1st tmux pane or Vim window above current (terminal job mode)", '<silent>', '<C-k>', '<C-T>:TmuxNavigateUp<CR>')
call AddTMapping("Windows", "Move to tmux or Vim window below", "Move to 1st tmux pane or Vim window below current (terminal job mode)", '<silent>', '<C-j>', '<C-T>:TmuxNavigateDown<CR>')

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
