"
" [Mappings] Windows menu mappings
"

call AddMenu("Windows", 400)
call AddMapping("Windows", "Create new window", "Create new window", '<silent>', '<F7>', ':<C-U>new<CR>')
call AddMapping("Windows", "Create new vertically split window", "Create new vertically split window", '<silent>', '<S-F7>', ':<C-U>vnew<CR>')
call AddMapping("Windows", "Close current window", "Close current window", '<silent>', '<S-F8>', ':<C-U>close<CR>')
call AddMapping("Windows", "Split window", "Split current window in two", "<silent>", '<C-t>', ':<C-U>wincmd s<CR>')
call AddSeparator("Windows")
call AddMapping("Windows", "QuickFix window...", "Toggle the QuickFix window given recognised errors", "<silent>", '<M-F8>', ':<C-U>ToggleQuickFix<CR>')
call AddMapping("Windows", "QuickUI menu...", "Open QuickUI menu", '<silent>', '<M-m>', ':<C-U>call quickui#menu#open()<CR>')
if has('nvim')
call AddMapping("Windows", "Command palette...", "Command palette", '<silent>', '<C-p>', ':<C-U>Telescope palette<CR>')
endif
call AddSeparator("Windows")
call AddMapping("Windows", "Decrease window height", "Decrease current window height by 3", "<silent>", '<M-S-Down>', ':<C-U>resize -3<CR>')
call AddMapping("Windows", "Increase window height", "Increase current window height by 3", "<silent>", '<M-S-Up>', ':<C-U>resize +3<CR>')
call AddMapping("Windows", "Decrease window width", "Decrease current window width by 3", "<silent>", '<M->>', ':<C-U>vertical resize -3<CR>')
call AddMapping("Windows", "Increase window width", "Increase current window width by 3", "<silent>", '<M-', ':<C-U>vertical resize +3<CR>')
call AddSeparator("Windows")
call AddMapping("Windows", "Move to tmux or Vim window above", "Move to 1st tmux pane or Vim window above current", "<silent>", '<M-Up>', ':<C-U>TmuxNavigateUp<CR>')
call AddMapping("Windows", "Move to tmux or Vim window above", "Move to 1st tmux pane or Vim window above current", "<silent>", '<C-k>', ':<C-U>TmuxNavigateUp<CR>')
call AddMapping("Windows", "Move to tmux or Vim window below", "Move to 1st tmux pane or Vim window below current", "<silent>", '<M-Down>', ':<C-U>TmuxNavigateDown<CR>')
call AddMapping("Windows", "Move to tmux or Vim window below", "Move to 1st tmux pane or Vim window below current", "<silent>", '<C-j>', ':<C-U>TmuxNavigateDown<CR>')
call AddMapping("Windows", "Move to window to left", "Move to 1st window left of current", "<silent>", '<M-Left>', ':<C-U>wincmd h<CR>')
call AddMapping("Windows", "Move to window to right", "Move to 1st window right of current", "<silent>", '<M-Right>', ':<C-U>wincmd l<CR>')
call AddSeparator("Windows")
if has('nvim')
call AddTMapping("Windows", "Move to tmux or Vim window above (terminal)", "Move to 1st tmux pane or Vim window above current (terminal job mode)", "<silent>", '<M-Up>', '<C-\><C-n>:TmuxNavigateUp<CR>')
call AddTMapping("Windows", "Move to tmux or Vim window above (terminal)", "Move to 1st tmux pane or Vim window above current (terminal job mode)", "<silent>", '<C-k>', '<C-\><C-n>:TmuxNavigateUp<CR>')
call AddTMapping("Windows", "Move to tmux or Vim window below (terminal)", "Move to 1st tmux pane or Vim window below current (terminal job mode)", "<silent>", '<M-Down>', '<C-\><C-n>:TmuxNavigateDown<CR>')
call AddTMapping("Windows", "Move to tmux or Vim window below (terminal)", "Move to 1st tmux pane or Vim window below current (terminal job mode)", "<silent>", '<C-j>', '<C-\><C-n>:TmuxNavigateDown<CR>')
call AddTMapping("Windows", "Switch to normal mode (terminal)", "Switch to normal mode (terminal job mode)", "<silent>", '<C-b>', '<C-\><C-n>N')
else
call AddTMapping("Windows", "Move to tmux or Vim window above (terminal)", "Move to 1st tmux pane or Vim window above current (terminal job mode)", "<silent>", '<C-k>', '<C-T>:TmuxNavigateUp<CR>')
call AddTMapping("Windows", "Move to tmux or Vim window below (terminal)", "Move to 1st tmux pane or Vim window below current (terminal job mode)", "<silent>", '<C-j>', '<C-T>:TmuxNavigateDown<CR>')
call AddTMapping("Windows", "Switch to normal mode (terminal)", "Switch to normal mode (terminal job mode)", "<silent>", '<C-b>', '<C-T>N')
endif

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
