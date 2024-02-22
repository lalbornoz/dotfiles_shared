"
" [Mappings] File menu mappings
"

call AddMenu("File", 100)
call AddIMapping("File", "Complete in insert mode...", "Complete in insert mode...", '', '<S-Tab>', '', 1)
call AddIMapping("File", "Exit insert mode", "Exit insert mode", '', '<C-Q>', '<Esc>')
if has('nvim')
call AddTMapping("File", "Exit terminal mode", "Exit terminal mode", '', '<Esc>', '<C-\><C-n>')
endif
call AddMapping("File", "Next buffer", "Go to next buffer in buffer list", "<silent>", '<Shift><Tab>', ':<C-U>bn<CR>')
call AddMapping("File", "Previous buffer", "Go to previous buffer in buffer list", "<silent>", '<Ctrl><Shift><Tab>', ':<C-U>bp<CR>')
call AddSeparator("File")
call AddNMapping("File", "Filter file...", "Filter entire file through program w/ tab-complete from favourites prompt", '', '<F9>', ':FPC ')
call AddVMapping("File", "Filter range...", "Filter visual range through program w/ tab-complete from favourites prompt", '', '<F9>', ':FPCR ')
call AddMapping("File", "Read from program...", "Read from program prompt into new scratch window", '', '<Alt><F9>', ':<C-U>CReadNewScratch ')
call AddMapping("File", "Read from program into buffer...", "Read from program prompt into current buffer", '', '<Alt><S-F9>', ':<C-U>r!')
call AddSeparator("File")
if has('nvim')
call AddMapping("File", "Telescope live_grep...", "Telescope live_grep...", "<silent>", '<F10>', ':lua require("telescope").extensions.menufacture.live_grep()<CR>')
call AddMapping("File", "Telescope grep_string...", "Telescope grep_string...", "<silent>", '<S-F10>', ':lua require("telescope").extensions.menufacture.grep_string()<CR>')
call AddMapping("File", "Telescope live_grep buffer...", "Telescope live_grep buffer...", "<silent>", '<Alt><F10>', ':lua require("telescope").extensions.menufacture.live_grep({path_display="hidden", search_dirs={"%:p"}})<CR>')
else
call AddMapping("File", "Grep...", "Grep...", '', '<F10>', ':<C-U>Grep ')
call AddMapping("File", "Rrep...", "Recursive Grep...", '', '<Alt><F10>', ':<C-U>Rgrep ')
call AddMapping("File", "Bgrep...", "Grep in current buffer...", '', '<S-F10>', ':<C-U>Bgrep ')
endif
call AddSeparator("File")
if has('nvim')
call AddMapping("File", "Open terminal...", "Open a new terminal window", "<silent>", '<F11>', ':<C-U>split term://$SHELL<CR>')
call AddMapping("File", "Open terminal tab...", "Open a new terminal tab", '', '<S-F11>', ':<C-U>tabnew term://$SHELL<CR>')
else
call AddMapping("File", "Open terminal...", "Open a new terminal window", "<silent>", '<F11>', ':<C-U>terminal<CR>')
call AddMapping("File", "Open terminal tab...", "Open a new terminal tab", '', '<S-F11>', ':<C-U>tab terminal<CR>')
endif
call AddSeparator("File")
if has('nvim')
call AddMapping("File", "Toggle nvim-tree", "Toggle nvim-tree window", "<silent>", '<F12>', ':<C-U>NvimTreeToggle<CR>')
else
call AddMapping("File", "Toggle NERDTree", "Toggle NERDTree window", "<silent>", '<F12>', ':<C-U>NERDTreeToggle<CR>')
endif
if has('nvim')
call AddMapping("File", "Toggle sidebar", "Toggle sidebar", "<silent>", '<Ctrl><F12>', ':lua require("sidebar-nvim").toggle({focus=true})<CR>')
call AddMapping("File", "Telescope files...", "Telescope files...", "<silent>", '<S-F12>', ':lua require("telescope").extensions.menufacture.find_files()<CR>')
call AddMapping("File", "Telescope buffers...", "Telescope buffers...", "<silent>", '<Alt><F12>', ':lua require("telescope.builtin").buffers()<CR>')
call AddMapping("File", "Telescope workspaces...", "Telescope workspaces...", "<silent>", '<Ctrl><S-F12>', ':Telescope workspaces<CR>')
endif

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
