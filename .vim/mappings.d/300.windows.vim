"
" [Mappings] Windows menu mappings
"

call AddMenu("Windows", 300)
call AddMapping("Windows", "Create new window", '', '<silent>', '<F7>', ':<C-U>new<CR>')
call AddMapping("Windows", "Create new vertically split window", '', '<silent>', '<S-F7>', ':<C-U>vnew<CR>')
call AddMapping("Windows", "Close current window", '', '<silent>', '<S-F8>', ':<C-U>close<CR>')
call AddMapping("Windows", "QuickFix window...", "Toggle the QuickFix window given recognised errors", '<silent>', '<Alt><F8>', ':<C-U>ToggleQuickFix<CR>')
call AddSeparator("Windows")
call AddMapping("Windows", "Decrease window height", "Decrease current window height by 3", '<silent>', '<Alt><Shift><Down>', ':<C-U>resize -3<CR>')
call AddMapping("Windows", "Increase window height", "Increase current window height by 3", '<silent>', '<Alt><Shift><Up>', ':<C-U>resize +3<CR>')
call AddSeparator("Windows")
call AddMapping("Windows", "Move to tmux or Vim window above", "Move to 1st tmux pane or Vim window above current", '<silent>', '<Alt><Up>', ':<C-U>TmuxNavigateUp<CR>')
call AddMapping("Windows", "Move to tmux or Vim window above", "Move to 1st tmux pane or Vim window above current", '<silent>', '<C-k>', ':<C-U>TmuxNavigateUp<CR>')
call AddMapping("Windows", "Move to tmux or Vim window below", "Move to 1st tmux pane or Vim window below current", '<silent>', '<Alt><Down>', ':<C-U>TmuxNavigateDown<CR>')
call AddMapping("Windows", "Move to tmux or Vim window below", "Move to 1st tmux pane or Vim window below current", '<silent>', '<C-j>', ':<C-U>TmuxNavigateDown<CR>')
call AddMapping("Windows", "Move to window to left", "Move to 1st window left of current", '<silent>', '<Alt><Left>', ':<C-U>wincmd h<CR>')
call AddMapping("Windows", "Move to window to right", "Move to 1st window right of current", '<silent>', '<Alt><Right>', ':<C-U>wincmd l<CR>')
call AddSeparator("Windows")
call AddTMapping("Windows", "Move to tmux or Vim window above (terminal)", "Move to 1st tmux pane or Vim window above current (terminal job mode)", '<silent>', '<C-k>', '<C-T>:TmuxNavigateUp<CR>')
call AddTMapping("Windows", "Move to tmux or Vim window below (terminal)", "Move to 1st tmux pane or Vim window below current (terminal job mode)", '<silent>', '<C-j>', '<C-T>:TmuxNavigateDown<CR>')
call AddTMapping("Windows", "Switch to normal mode (terminal)", "Switch to normal mode (terminal job mode)", '<silent>', '<C-b>', '<C-T>N')

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
