"
" [Mappings] File menu mappings
"

call roarie_menu#AddMenu("&File", 200)
call roarie_menu#AddIMapping("&File", "complete", "Complete in insert mode...", "Complete in insert mode...", '', '<S-Tab>', '', "<pseudo>")
call roarie_menu#AddIMapping("&File", "exit_insert", "Exit insert mode", "Exit insert mode", '', '<C-Q>', '<Esc>')
if has('nvim')
call roarie_menu#AddTMapping("&File", "terminal_exit", "Exit terminal mode", "Exit terminal mode", '', '<Esc>', '<C-\><C-n>')
endif
call roarie_menu#AddMapping("&File", "buffer_next", "Next buffer", "Go to next buffer in buffer list", "<silent>", '<S-Tab>', ':<C-U>bn<CR>')
call roarie_menu#AddMapping("&File", "buffer_prev", "Previous buffer", "Go to previous buffer in buffer list", "<silent>", '<C-S-Tab>', ':<C-U>bp<CR>')
call roarie_menu#AddSeparator("&File")
call roarie_menu#AddNMapping("&File", "filter_file", "Filter file...", "Filter entire file through program w/ tab-complete from favourites prompt", '', '<F9>', ':FPC ', "<fnalias>")
call roarie_menu#AddVMapping("&File", "filter_range", "Filter range...", "Filter visual range through program w/ tab-complete from favourites prompt", '', '<F9>', ':FPCR ', "<fnalias>")
call roarie_menu#AddMapping("&File", "read_program", "Read from program...", "Read from program prompt into new scratch window", '', '<M-F9>', ':<C-U>CReadNewScratch ', "<fnalias>")
call roarie_menu#AddMapping("&File", "read_program_buffer", "Read from program into buffer...", "Read from program prompt into current buffer", '', '<M-S-F9>', ':<C-U>r!', "<fnalias>")
call roarie_menu#AddSeparator("&File")
if has('nvim')
call roarie_menu#AddMapping("&File", "telescope_live_grep", "Telescope live_grep...", "Telescope live_grep...", "<silent>", '<F10>', ':lua require("telescope").extensions.menufacture.live_grep()<CR>', "<fnalias>")
call roarie_menu#AddMapping("&File", "telescope_grep_string", "Telescope grep_string...", "Telescope grep_string...", "<silent>", '<S-F10>', ':lua require("telescope").extensions.menufacture.grep_string()<CR>', "<fnalias>")
call roarie_menu#AddMapping("&File", "telescope_live_grep_buffer", "Telescope live_grep buffer...", "Telescope live_grep buffer...", "<silent>", '<M-F10>', ':lua require("telescope").extensions.menufacture.live_grep({path_display="hidden", search_dirs={"%:p"}})<CR>', "<fnalias>")
call roarie_menu#AddMapping("&File", "spectre_toggle", "Toggle spectre", "Toggle spectre", "<silent>", '<C-F10>', '<Cmd>lua require("spectre").toggle()<CR>', "<fnalias>")
call roarie_menu#AddMapping("&File", "spectre_search_word", "Spectre search word", "Spectre search word", "<silent>", '<C-S-F10>', '<Cmd>lua require("spectre").open_visual({select_word=true})<CR>', "<fnalias>")
call roarie_menu#AddMapping("&File", "spectre_search_file", "Spectre search in file", "Spectre search in file", "<silent>", '<M-S-F10>', '<Cmd>lua require("spectre").open_file_search({select_word=true})<CR>', "<fnalias>")
else
call roarie_menu#AddMapping("&File", "grep", "Grep...", "Grep...", '', '<F10>', ':<C-U>Grep ', "<fnalias>")
call roarie_menu#AddMapping("&File", "rgrep", "Rgrep...", "Recursive Grep...", '', '<M-F10>', ':<C-U>Rgrep ', "<fnalias>")
call roarie_menu#AddMapping("&File", "bgrep", "Bgrep...", "Grep in current buffer...", '', '<S-F10>', ':<C-U>Bgrep ', "<fnalias>")
endif
call roarie_menu#AddSeparator("&File")
if has('nvim')
call roarie_menu#AddMapping("&File", "terminal_open", "Open terminal...", "Open a new terminal window", "<silent>", '<F11>', ':<C-U>split term://$SHELL<CR>', "<fnalias>")
call roarie_menu#AddMapping("&File", "terminal_open_tab", "Open terminal tab...", "Open a new terminal tab", '', '<S-F11>', ':<C-U>tabnew term://$SHELL<CR>', "<fnalias>")
else
call roarie_menu#AddMapping("&File", "terminal_open", "Open terminal...", "Open a new terminal window", "<silent>", '<F11>', ':<C-U>terminal<CR>', "<fnalias>")
call roarie_menu#AddMapping("&File", "terminal_open_tab", "Open terminal tab...", "Open a new terminal tab", '', '<S-F11>', ':<C-U>tab terminal<CR>', "<fnalias>")
endif
call roarie_menu#AddSeparator("&File")
if has('nvim')
call roarie_menu#AddMapping("&File", "toggle_nvim_tree", "Toggle nvim-tree", "Toggle nvim-tree window", "<silent>", '<F12>', ':<C-U>NvimTreeToggle<CR>', "<fnalias>")
else
call roarie_menu#AddMapping("&File", "toggle_nerdtree", "Toggle NERDTree", "Toggle NERDTree window", "<silent>", '<F12>', ':<C-U>NERDTreeToggle<CR>', "<fnalias>")
endif
if has('nvim')
call roarie_menu#AddMapping("&File", "toggle_sidebar", "Toggle sidebar", "Toggle sidebar", "<silent>", '<C-F12>', ':lua require("sidebar-nvim").toggle({focus=true})<CR>', "<fnalias>")
call roarie_menu#AddMapping("&File", "telescope_files", "Telescope files...", "Telescope files...", "<silent>", '<S-F12>', ':lua require("telescope").extensions.menufacture.find_files()<CR>', "<fnalias>")
call roarie_menu#AddMapping("&File", "telescope_buffers", "Telescope buffers...", "Telescope buffers...", "<silent>", '<M-F12>', ':lua require("telescope.builtin").buffers()<CR>', "<fnalias>")
call roarie_menu#AddMapping("&File", "telescope_git_commits", "Telescope git_commits...", "Telescope git_commits...", '', '<M-S-F12>', ':<C-U>Telescope git_commits<CR>', "<fnalias>")
call roarie_menu#AddMapping("&File", "telescope_workspaces", "Telescope workspaces...", "Telescope workspaces...", "<silent>", '<C-S-F12>', ':Telescope workspaces<CR>', "<fnalias>")
endif

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
