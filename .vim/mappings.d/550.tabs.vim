"
" [Mappings] Windows menu mappings
"

call roarie_menu#AddMenu("Tabs", 550)
call roarie_menu#AddMapping("Tabs", "Go to tab #1", '', '<silent>', '<M-1>', '1gt')
call roarie_menu#AddMapping("Tabs", "Go to tab #2", '', '<silent>', '<M-2>', '2gt')
call roarie_menu#AddMapping("Tabs", "Go to tab #3", '', '<silent>', '<M-3>', '3gt')
call roarie_menu#AddMapping("Tabs", "Go to tab #4", '', '<silent>', '<M-4>', '4gt')
call roarie_menu#AddMapping("Tabs", "Go to tab #5", '', '<silent>', '<M-5>', '5gt')
call roarie_menu#AddMapping("Tabs", "Go to tab #6", '', '<silent>', '<M-6>', '6gt')
call roarie_menu#AddMapping("Tabs", "Go to tab #7", '', '<silent>', '<M-7>', '7gt')
call roarie_menu#AddMapping("Tabs", "Go to tab #8", '', '<silent>', '<M-8>', '8gt')
call roarie_menu#AddMapping("Tabs", "Go to tab #9", '', '<silent>', '<M-9>', '9gt')
call roarie_menu#AddSeparator("Tabs")
call roarie_menu#AddMapping("Tabs", "Go to previous tab", "Go to previous tab page w/ wraparound", "<silent>", '<M-S-Left>', ':<C-U>tabprev<CR>')
call roarie_menu#AddMapping("Tabs", "Go to previous tab", "Go to previous tab page w/ wraparound", "<silent>", '<C-f>', ':<C-U>tabprev<CR>')
call roarie_menu#AddMapping("Tabs", "Go to next tab", "Go to next tab page w/ wraparound", "<silent>", '<M-S-Right>', ':<C-U>tabnext<CR>')
call roarie_menu#AddMapping("Tabs", "Go to next tab", "Go to next tab page w/ wraparound", "<silent>", '<C-h>', ':<C-U>tabnext<CR>')
call roarie_menu#AddSeparator("Tabs")
if has('nvim')
call roarie_menu#AddTMapping("Tabs", "Go to previous tab (terminal)", "Go to previous tab page w/ wraparound (terminal job mode)", "<silent>", '<C-f>', '<C-\><C-n>:tabprev<CR>')
call roarie_menu#AddTMapping("Tabs", "Go to previous tab (terminal)", "Go to previous tab page w/ wraparound (terminal job mode)", "<silent>", '<M-S-Left>', '<C-\><C-n>:tabprev<CR>')
call roarie_menu#AddTMapping("Tabs", "Go to next tab (terminal)", "Go to next tab page w/ wraparound (terminal job mode)", "<silent>", '<C-h>', '<C-\><C-n>:tabnext<CR>')
call roarie_menu#AddTMapping("Tabs", "Go to next tab (terminal)", "Go to next tab page w/ wraparound (terminal job mode)", "<silent>", '<M-S-Right>', '<C-\><C-n>:tabnext<CR>')
else
call roarie_menu#AddTMapping("Tabs", "Go to previous tab (terminal)", "Go to previous tab page w/ wraparound (terminal job mode)", "<silent>", '<C-f>', '<C-T>:tabprev<CR>')
call roarie_menu#AddTMapping("Tabs", "Go to previous tab (terminal)", "Go to previous tab page w/ wraparound (terminal job mode)", "<silent>", '<M-S-Left>', '<C-T>:tabprev<CR>')
call roarie_menu#AddTMapping("Tabs", "Go to next tab (terminal)", "Go to next tab page w/ wraparound (terminal job mode)", "<silent>", '<C-h>', '<C-T>:tabnext<CR>')
call roarie_menu#AddTMapping("Tabs", "Go to next tab (terminal)", "Go to next tab page w/ wraparound (terminal job mode)", "<silent>", '<M-S-Right>', '<C-T>:tabnext<CR>')
endif
call roarie_menu#AddSeparator("Tabs")
call roarie_menu#AddMapping("Tabs", "Open a new tab page", "Open a new tab page", "<silent>", '<F8>', ':<C-U>tabnew<CR>')
call roarie_menu#AddMapping("<Fn>", "Open a new tab page", "Open a new tab page", "<silent>", '<F8>', ':<C-U>tabnew<CR>', 1)
call roarie_menu#AddMapping("Tabs", "Close current tab", "Close current tab", "<silent>", '<S-F8>', ':<C-U>close<CR>')
call roarie_menu#AddMapping("<Fn>", "Close current tab", "Close current tab", "<silent>", '<S-F8>', ':<C-U>close<CR>', 1)
call roarie_menu#AddMapping("Tabs", "Move window to new tab", "Move window to new tab page", "<silent>", '<M-t>', ':<C-U>wincmd T<CR>')
call roarie_menu#AddMapping("Tabs", "Move current tab to the left", "Move current tab to the left", "<silent>", '<M-j>', ':<C-U>tabmove -1<CR>')
call roarie_menu#AddMapping("Tabs", "Move current tab to the right", "Move current tab to the right", "<silent>", '<M-k>', ':<C-U>tabmove +1<CR>')

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
