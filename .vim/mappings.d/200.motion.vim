"
" [Mappings] Motion menu mappings
"

call AddMenu("Motion", 200)
call AddMapping("Motion", "Go to previous word", "Go to previous word", '', '<Ctrl><Left>', 'b')
call AddMapping("Motion", "Go to previous WORD", "Go to previous WORD", '', '<Ctrl><Shift><Left>', 'B')
call AddMapping("Motion", "Go to next word", "Go to next word", '', '<Ctrl><Right>', 'w')
call AddMapping("Motion", "Go to next WORD", "Go to next WORD", '', '<Ctrl><Shift><Right>', 'W')
call AddSeparator("Motion")
call AddMapping("Motion", "Go to end of previous word", "Go to end of previous word", '', '<Ctrl><Alt><Left>', 'ge')
call AddMapping("Motion", "Go to end of previous WORD", "Go to end of previous WORD", '', '<Ctrl><Alt><Shift><Left>', 'gE')
call AddMapping("Motion", "Go to end of word", "Go to end of word", '', '<Ctrl><Alt><Right>', 'e')
call AddMapping("Motion", "Go to end of WORD", "Go to end of WORD", '', '<Ctrl><Alt><Shift><Right>', 'E')
call AddSeparator("Motion")
call AddMapping("Motion", "Go to previous paragraph", "Go to previous paragraph", '', '<Ctrl><Up>', '{')
call AddMapping("Motion", "Go to previous section", "Go to previous section", '', '<Ctrl><Shift><Up>', '[[')
call AddMapping("Motion", "Go to next paragraph", "Go to next paragraph", '', '<Ctrl><Down>', '}')
call AddMapping("Motion", "Go to next section", "Go to next section", '', '<Ctrl><Shift><Down>', ']]')
call AddSeparator("Motion")
call AddMapping("Motion", "Go to first line", "Go to first line", '', '<Ctrl><Alt><Up>', 'gg')
call AddMapping("Motion", "Go to top of window", "Go to top of window", '', '<Ctrl><Alt><Shift><Up>', 'H')
call AddMapping("Motion", "Go to last line", "Go to last line", '', '<Ctrl><Alt><Down>', 'G')
call AddMapping("Motion", "Go to bottom of window", "Go to bottom of window", '', '<Ctrl><Alt><Shift><Down>', 'L')
call AddSeparator("Motion")
call AddMapping("Motion", "Go to previous cursor position", "Go to previous cursor position in jump list", '', '<Shift><Left>', '<C-O>')
call AddMapping("Motion", "Go to next cursor position", "Go to next cursor position in jump list", '', '<Shift><Right>', '<C-I>')
call AddMapping("Motion", "Go to previous occurence", "Go to previous occurence of the word nearest to the cursor", '', '<Shift><Up>', '#')
call AddMapping("Motion", "Go to next occurence", "Go to next occurence of the word nearest to the cursor", '', '<Shift><Down>', '*')

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
