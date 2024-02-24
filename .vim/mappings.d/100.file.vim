"
" [Mappings] File menu mappings
"

call roarie_menu#AddMenu("File", 100)
call roarie_menu#AddIMapping("File", "Complete in insert mode...", "Complete in insert mode...", '', '<S-Tab>', '', 1)
call roarie_menu#AddIMapping("File", "Exit insert mode", "Exit insert mode", '', '<C-Q>', '<Esc>')
if has('nvim')
call roarie_menu#AddTMapping("File", "Exit terminal mode", "Exit terminal mode", '', '<Esc>', '<C-\><C-n>')
endif
call roarie_menu#AddMapping("File", "Next buffer", "Go to next buffer in buffer list", "<silent>", '<S-Tab>', ':<C-U>bn<CR>')
call roarie_menu#AddMapping("File", "Previous buffer", "Go to previous buffer in buffer list", "<silent>", '<C-S-Tab>', ':<C-U>bp<CR>')
call roarie_menu#AddSeparator("File")
call roarie_menu#AddNMapping("File", "Filter file...", "Filter entire file through program w/ tab-complete from favourites prompt", '', '<F9>', ':FPC ')
call roarie_menu#AddVMapping("File", "Filter range...", "Filter visual range through program w/ tab-complete from favourites prompt", '', '<F9>', ':FPCR ')
call roarie_menu#AddMapping("File", "Read from program...", "Read from program prompt into new scratch window", '', '<M-F9>', ':<C-U>CReadNewScratch ')
call roarie_menu#AddMapping("File", "Read from program into buffer...", "Read from program prompt into current buffer", '', '<M-S-F9>', ':<C-U>r!')
call roarie_menu#AddSeparator("File")
if has('nvim')
call roarie_menu#AddMapping("File", "Telescope live_grep...", "Telescope live_grep...", "<silent>", '<F10>', ':lua require("telescope").extensions.menufacture.live_grep()<CR>')
call roarie_menu#AddMapping("File", "Telescope grep_string...", "Telescope grep_string...", "<silent>", '<S-F10>', ':lua require("telescope").extensions.menufacture.grep_string()<CR>')
call roarie_menu#AddMapping("File", "Telescope live_grep buffer...", "Telescope live_grep buffer...", "<silent>", '<M-F10>', ':lua require("telescope").extensions.menufacture.live_grep({path_display="hidden", search_dirs={"%:p"}})<CR>')
call roarie_menu#AddMapping("File", "Toggle spectre", "Toggle spectre", "<silent>", '<C-F10>', '<Cmd>lua require("spectre").toggle()<CR>')
call roarie_menu#AddMapping("File", "Spectre search word", "Spectre search word", "<silent>", '<C-S-F10>', '<Cmd>lua require("spectre").open_visual({select_word=true})<CR>')
call roarie_menu#AddMapping("File", "Spectre search in file", "Spectre search in file", "<silent>", '<M-S-F10>', '<Cmd>lua require("spectre").open_file_search({select_word=true})<CR>')
else
call roarie_menu#AddMapping("File", "Grep...", "Grep...", '', '<F10>', ':<C-U>Grep ')
call roarie_menu#AddMapping("File", "Rrep...", "Recursive Grep...", '', '<M-F10>', ':<C-U>Rgrep ')
call roarie_menu#AddMapping("File", "Bgrep...", "Grep in current buffer...", '', '<S-F10>', ':<C-U>Bgrep ')
endif
call roarie_menu#AddSeparator("File")
if has('nvim')
call roarie_menu#AddMapping("File", "Open terminal...", "Open a new terminal window", "<silent>", '<F11>', ':<C-U>split term://$SHELL<CR>')
call roarie_menu#AddMapping("File", "Open terminal tab...", "Open a new terminal tab", '', '<S-F11>', ':<C-U>tabnew term://$SHELL<CR>')
else
call roarie_menu#AddMapping("File", "Open terminal...", "Open a new terminal window", "<silent>", '<F11>', ':<C-U>terminal<CR>')
call roarie_menu#AddMapping("File", "Open terminal tab...", "Open a new terminal tab", '', '<S-F11>', ':<C-U>tab terminal<CR>')
endif
call roarie_menu#AddSeparator("File")
if has('nvim')
call roarie_menu#AddMapping("File", "Toggle nvim-tree", "Toggle nvim-tree window", "<silent>", '<F12>', ':<C-U>NvimTreeToggle<CR>')
else
call roarie_menu#AddMapping("File", "Toggle NERDTree", "Toggle NERDTree window", "<silent>", '<F12>', ':<C-U>NERDTreeToggle<CR>')
endif
if has('nvim')
call roarie_menu#AddMapping("File", "Toggle sidebar", "Toggle sidebar", "<silent>", '<C-F12>', ':lua require("sidebar-nvim").toggle({focus=true})<CR>')
call roarie_menu#AddMapping("File", "Telescope files...", "Telescope files...", "<silent>", '<S-F12>', ':lua require("telescope").extensions.menufacture.find_files()<CR>')
call roarie_menu#AddMapping("File", "Telescope buffers...", "Telescope buffers...", "<silent>", '<M-F12>', ':lua require("telescope.builtin").buffers()<CR>')
call roarie_menu#AddMapping("File", "Telescope workspaces...", "Telescope workspaces...", "<silent>", '<C-S-F12>', ':Telescope workspaces<CR>')
endif

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
