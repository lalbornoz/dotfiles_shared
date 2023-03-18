"
" [Mappings] Windows menu mappings
"

call AddMenu("Tabs", 450)
call AddMapping("Tabs", "Go to tab #1", '', '<silent>', '<Alt>1', '1gt')
call AddMapping("Tabs", "Go to tab #2", '', '<silent>', '<Alt>2', '2gt')
call AddMapping("Tabs", "Go to tab #3", '', '<silent>', '<Alt>3', '3gt')
call AddMapping("Tabs", "Go to tab #4", '', '<silent>', '<Alt>4', '4gt')
call AddMapping("Tabs", "Go to tab #5", '', '<silent>', '<Alt>5', '5gt')
call AddMapping("Tabs", "Go to tab #6", '', '<silent>', '<Alt>6', '6gt')
call AddMapping("Tabs", "Go to tab #7", '', '<silent>', '<Alt>7', '7gt')
call AddMapping("Tabs", "Go to tab #8", '', '<silent>', '<Alt>8', '8gt')
call AddMapping("Tabs", "Go to tab #9", '', '<silent>', '<Alt>9', '9gt')
call AddSeparator("Tabs")
call AddMapping("Tabs", "Go to previous tab", "Go to previous tab page w/ wraparound", '<silent>', '<Alt><Shift><Left>', ':<C-U>tabprev<CR>')
call AddMapping("Tabs", "Go to previous tab", "Go to previous tab page w/ wraparound", '<silent>', '<C-f>', ':<C-U>tabprev<CR>')
call AddMapping("Tabs", "Go to next tab", "Go to next tab page w/ wraparound", '<silent>', '<Alt><Shift><Right>', ':<C-U>tabnext<CR>')
call AddMapping("Tabs", "Go to next tab", "Go to next tab page w/ wraparound", '<silent>', '<C-h>', ':<C-U>tabnext<CR>')
call AddSeparator("Tabs")
if has('nvim')
call AddTMapping("Tabs", "Go to previous tab (terminal)", "Go to previous tab page w/ wraparound (terminal job mode)", '<silent>', '<C-f>', '<C-\><C-n>:tabprev<CR>')
call AddTMapping("Tabs", "Go to previous tab (terminal)", "Go to previous tab page w/ wraparound (terminal job mode)", '<silent>', '<Alt><Shift><Left>', '<C-\><C-n>:tabprev<CR>')
call AddTMapping("Tabs", "Go to next tab (terminal)", "Go to next tab page w/ wraparound (terminal job mode)", '<silent>', '<C-h>', '<C-\><C-n>:tabnext<CR>')
call AddTMapping("Tabs", "Go to next tab (terminal)", "Go to next tab page w/ wraparound (terminal job mode)", '<silent>', '<Alt><Shift><Right>', '<C-\><C-n>:tabnext<CR>')
else
call AddTMapping("Tabs", "Go to previous tab (terminal)", "Go to previous tab page w/ wraparound (terminal job mode)", '<silent>', '<C-f>', '<C-T>:tabprev<CR>')
call AddTMapping("Tabs", "Go to previous tab (terminal)", "Go to previous tab page w/ wraparound (terminal job mode)", '<silent>', '<Alt><Shift><Left>', '<C-T>:tabprev<CR>')
call AddTMapping("Tabs", "Go to next tab (terminal)", "Go to next tab page w/ wraparound (terminal job mode)", '<silent>', '<C-h>', '<C-T>:tabnext<CR>')
call AddTMapping("Tabs", "Go to next tab (terminal)", "Go to next tab page w/ wraparound (terminal job mode)", '<silent>', '<Alt><Shift><Right>', '<C-T>:tabnext<CR>')
endif
call AddSeparator("Tabs")
call AddMapping("Tabs", "Open a new tab page", '', '<silent>', '<F8>', ':<C-U>tabnew<CR>')
call AddMapping("Tabs", "Close current tab", '', '<silent>', '<S-F8>', ':<C-U>close<CR>')
call AddMapping("Tabs", "Move window to new tab", "Move window to new tab page", '<silent>', '<Alt>t', ':<C-U>wincmd T<CR>')

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
