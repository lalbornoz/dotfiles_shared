"
" [Mappings] Windows menu mappings
"

call roarie_menu#AddMenu("Windows", 500)
call roarie_menu#AddMapping("Windows", "Create new window", "Create new window", '<silent>', '<F7>', ':<C-U>new<CR>', "<fnalias>")
call roarie_menu#AddMapping("Windows", "Create new vertically split window", "Create new vertically split window", '<silent>', '<S-F7>', ':<C-U>vnew<CR>', "<fnalias>")
call roarie_menu#AddMapping("Windows", "Close current window", "Close current window", '<silent>', '<S-F8>', ':<C-U>close<CR>', "<fnalias>")
call roarie_menu#AddMapping("Windows", "Split window", "Split current window in two", "<silent>", '<C-t>', ':<C-U>wincmd s<CR>')
call roarie_menu#AddSeparator("Windows")
call roarie_menu#AddMapping("Windows", "QuickFix window...", "Toggle the QuickFix window given recognised errors", "<silent>", '<M-F8>', ':<C-U>ToggleQuickFix<CR>', "<fnalias>")
call roarie_menu#AddMapping("Windows", "QuickUI menu...", "Open QuickUI menu", '<silent>', '<M-m>', ':<C-U>call quickui#menu#open()<CR>')
if has('nvim')
call roarie_menu#AddMapping("Windows", "Command palette...", "Command palette", '<silent>', '<C-p>', ':<C-U>Telescope palette<CR>')
endif
call roarie_menu#AddSeparator("Windows")
call roarie_menu#AddMapping("Windows", "Decrease window height", "Decrease current window height by 3", "<silent>", '<M-S-Down>', ':<C-U>resize -3<CR>')
call roarie_menu#AddMapping("Windows", "Increase window height", "Increase current window height by 3", "<silent>", '<M-S-Up>', ':<C-U>resize +3<CR>')
call roarie_menu#AddMapping("Windows", "Decrease window width", "Decrease current window width by 3", "<silent>", '<M->>', ':<C-U>vertical resize -3<CR>')
call roarie_menu#AddMapping("Windows", "Increase window width", "Increase current window width by 3", "<silent>", '<M-', ':<C-U>vertical resize +3<CR>')
call roarie_menu#AddSeparator("Windows")
call roarie_menu#AddMapping("Windows", "Move to tmux or Vim window above", "Move to 1st tmux pane or Vim window above current", "<silent>", '<M-Up>', ':<C-U>TmuxNavigateUp<CR>')
call roarie_menu#AddMapping("Windows", "Move to tmux or Vim window above", "Move to 1st tmux pane or Vim window above current", "<silent>", '<C-k>', ':<C-U>TmuxNavigateUp<CR>')
call roarie_menu#AddMapping("Windows", "Move to tmux or Vim window below", "Move to 1st tmux pane or Vim window below current", "<silent>", '<M-Down>', ':<C-U>TmuxNavigateDown<CR>')
call roarie_menu#AddMapping("Windows", "Move to tmux or Vim window below", "Move to 1st tmux pane or Vim window below current", "<silent>", '<C-j>', ':<C-U>TmuxNavigateDown<CR>')
call roarie_menu#AddMapping("Windows", "Move to window to left", "Move to 1st window left of current", "<silent>", '<M-Left>', ':<C-U>wincmd h<CR>')
call roarie_menu#AddMapping("Windows", "Move to window to right", "Move to 1st window right of current", "<silent>", '<M-Right>', ':<C-U>wincmd l<CR>')
call roarie_menu#AddSeparator("Windows")
if has('nvim')
call roarie_menu#AddTMapping("Windows", "Move to tmux or Vim window above (terminal)", "Move to 1st tmux pane or Vim window above current (terminal job mode)", "<silent>", '<M-Up>', '<C-\><C-n>:TmuxNavigateUp<CR>')
call roarie_menu#AddTMapping("Windows", "Move to tmux or Vim window above (terminal)", "Move to 1st tmux pane or Vim window above current (terminal job mode)", "<silent>", '<C-k>', '<C-\><C-n>:TmuxNavigateUp<CR>')
call roarie_menu#AddTMapping("Windows", "Move to tmux or Vim window below (terminal)", "Move to 1st tmux pane or Vim window below current (terminal job mode)", "<silent>", '<M-Down>', '<C-\><C-n>:TmuxNavigateDown<CR>')
call roarie_menu#AddTMapping("Windows", "Move to tmux or Vim window below (terminal)", "Move to 1st tmux pane or Vim window below current (terminal job mode)", "<silent>", '<C-j>', '<C-\><C-n>:TmuxNavigateDown<CR>')
call roarie_menu#AddTMapping("Windows", "Switch to normal mode (terminal)", "Switch to normal mode (terminal job mode)", "<silent>", '<C-b>', '<C-\><C-n>N')
else
call roarie_menu#AddTMapping("Windows", "Move to tmux or Vim window above (terminal)", "Move to 1st tmux pane or Vim window above current (terminal job mode)", "<silent>", '<C-k>', '<C-T>:TmuxNavigateUp<CR>')
call roarie_menu#AddTMapping("Windows", "Move to tmux or Vim window below (terminal)", "Move to 1st tmux pane or Vim window below current (terminal job mode)", "<silent>", '<C-j>', '<C-T>:TmuxNavigateDown<CR>')
call roarie_menu#AddTMapping("Windows", "Switch to normal mode (terminal)", "Switch to normal mode (terminal job mode)", "<silent>", '<C-b>', '<C-T>N')
endif

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
