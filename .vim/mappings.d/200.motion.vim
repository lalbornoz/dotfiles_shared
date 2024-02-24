"
" [Mappings] Motion menu mappings
"

call roarie_menu#AddMenu("Motion", 200)
call roarie_menu#AddMapping("Motion", "Go to previous word", "Go to previous word", '', '<C-Left>', 'b')
call roarie_menu#AddMapping("Motion", "Go to previous WORD", "Go to previous WORD", '', '<C-S-Left>', 'B')
call roarie_menu#AddMapping("Motion", "Go to next word", "Go to next word", '', '<C-Right>', 'w')
call roarie_menu#AddMapping("Motion", "Go to next WORD", "Go to next WORD", '', '<C-S-Right>', 'W')
call roarie_menu#AddSeparator("Motion")
call roarie_menu#AddMapping("Motion", "Go to end of previous word", "Go to end of previous word", '', '<M-C-Left>', 'ge')
call roarie_menu#AddMapping("Motion", "Go to end of previous WORD", "Go to end of previous WORD", '', '<M-C-S-Left>', 'gE')
call roarie_menu#AddMapping("Motion", "Go to end of word", "Go to end of word", '', '<M-C-Right>', 'e')
call roarie_menu#AddMapping("Motion", "Go to end of WORD", "Go to end of WORD", '', '<M-C-S-Right>', 'E')
call roarie_menu#AddSeparator("Motion")
call roarie_menu#AddMapping("Motion", "Go to previous paragraph", "Go to previous paragraph", '', '<C-Up>', '{')
call roarie_menu#AddMapping("Motion", "Go to previous section", "Go to previous section", '', '<C-S-Up>', '[[')
call roarie_menu#AddMapping("Motion", "Go to next paragraph", "Go to next paragraph", '', '<C-Down>', '}')
call roarie_menu#AddMapping("Motion", "Go to next section", "Go to next section", '', '<C-S-Down>', ']]')
call roarie_menu#AddSeparator("Motion")
call roarie_menu#AddMapping("Motion", "Go to first line", "Go to first line", '', '<M-C-Up>', 'gg')
call roarie_menu#AddMapping("Motion", "Go to top of window", "Go to top of window", '', '<M-C-S-Up>', 'H')
call roarie_menu#AddMapping("Motion", "Go to last line", "Go to last line", '', '<M-C-Down>', 'G')
call roarie_menu#AddMapping("Motion", "Go to bottom of window", "Go to bottom of window", '', '<M-C-S-Down>', 'L')
call roarie_menu#AddSeparator("Motion")
call roarie_menu#AddMapping("Motion", "Go to previous cursor position", "Go to previous cursor position in jump list", '', '<S-Left>', '<C-O>')
call roarie_menu#AddMapping("Motion", "Go to next cursor position", "Go to next cursor position in jump list", '', '<S-Right>', '<C-I>')
call roarie_menu#AddMapping("Motion", "Go to previous occurence", "Go to previous occurence of the word nearest to the cursor", '', '<S-Up>', '#')
call roarie_menu#AddMapping("Motion", "Go to next occurence", "Go to next occurence of the word nearest to the cursor", '', '<S-Down>', '*')

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
