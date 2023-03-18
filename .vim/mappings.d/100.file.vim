"
" [Mappings] File menu mappings
"

call AddMenu("File", 100)
call AddIMapping("File", "Complete...", 'Complete...', '', '<S-Tab>', '', 1)
call AddIMapping("File", "Exit insert mode", 'Exit insert mode', '', '<C-Q>', '<Esc>')
if has('nvim')
call AddTMapping("File", "Exit terminal mode", 'Exit terminal mode', '', '<Esc>', '<C-\><C-n>')
endif
call AddSeparator("File")
call AddMapping("File", "Read from program...", "Read from program prompt into new scratch window", '', '<F9>', ':<C-U>CReadNewScratch ')
call AddSeparator("File")
if has('nvim')
call AddMapping("File", "Telescope live_grep...", "Telescope live_grep...", '<silent>', '<F10>', '<Cmd>Telescope live_grep<CR>')
call AddMapping("File", "Telescope live_grep --hidden...", "Telescope live_grep --hidden...", '<silent>', '<S-F10>', ':lua require("telescope.builtin").live_grep({ additional_args = function(opts) return { "--hidden" } end })<CR>')
call AddMapping("File", "Telescope grep_string...", "Telescope grep_string...", '<silent>', '<Alt><F10>', '<Cmd>Telescope grep_string<CR>')
call AddMapping("File", "Telescope grep_string --hidden...", "Telescope grep_string --hidden...", '<silent>', '<Alt><S-F10>', ':lua require("telescope.builtin").grep_string({ additional_args = function(opts) return { "--hidden" } end })<CR>')
else
call AddMapping("File", "Grep...", 'Grep...', '', '<F10>', ':<C-U>Grep ')
call AddMapping("File", "Rrep...", 'Recursive Grep...', '', '<Alt><F10>', ':<C-U>Rgrep ')
call AddMapping("File", "Bgrep...", 'Grep in current buffer...', '', '<S-F10>', ':<C-U>Bgrep ')
endif
call AddSeparator("File")
if has('nvim')
call AddMapping("File", "Open terminal...", "Open a new terminal window", '<silent>', '<F11>', ':<C-U>split term://$SHELL<CR>')
call AddMapping("File", "Open terminal tab...", "Open a new terminal tab", '', '<Alt><F11>', ':<C-U>tabnew term://$SHELL<CR>')
else
call AddMapping("File", "Open terminal...", "Open a new terminal window", '<silent>', '<F11>', ':<C-U>terminal<CR>')
call AddMapping("File", "Open terminal tab...", "Open a new terminal tab", '', '<Alt><F11>', ':<C-U>tab terminal<CR>')
endif
call AddSeparator("File")
call AddMapping("File", "Toggle NerdTree", "Toggle NerdTree window", '<silent>', '<F12>', ':<C-U>NERDTreeToggle<CR>')
if has('nvim')
call AddMapping("File", "Telescope files...", "Telescope files...", '<silent>', '<S-F12>', '<Cmd>Telescope find_files<CR>')
call AddMapping("File", "Telescope files hidden=true...", "Telescope files hidden=true...", '<silent>', '<Alt><S-F12>', '<Cmd>Telescope find_files hidden=true<CR>')
call AddMapping("File", "Telescope buffers...", "Telescope buffers...", '<silent>', '<Alt><F12>', '<Cmd>Telescope buffers<CR>')
endif

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
