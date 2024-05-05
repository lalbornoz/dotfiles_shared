"
" [Mappings] File menu mappings
"

call roarie_commands#AddMenu("&File")
call roarie_commands#AddIMapping("&File", "complete", "Complete in insert mode...", "Complete in insert mode...", '', '<S-Tab>', '', "<pseudo>")
call roarie_commands#AddIMapping("&File", "exit_insert", "E&xit insert mode", "Exit insert mode", '', '<C-Q>', '<Esc>')
if has('nvim')
call roarie_commands#AddTMapping("&File", "terminal_exit", "E&xit terminal mode", "Exit terminal mode", '', '<Esc>', '<C-\><C-n>')
endif
call roarie_commands#AddMapping("&File", "buffer_next", "Next &buffer", "Go to next buffer in buffer list", "<silent>", '<S-Tab>', ':<C-U>bn<CR>')
call roarie_commands#AddMapping("&File", "buffer_prev", "Previous &buffer", "Go to previous buffer in buffer list", "<silent>", '<C-S-Tab>', ':<C-U>bp<CR>')
if has('nvim')
call roarie_commands#AddTMapping("&File", "switch_normal_mode_terminal", "Switch to &normal mode (terminal)", "Switch to normal mode (terminal job mode)", "<silent>", '<C-b>', '<C-\><C-n>N')
else
call roarie_commands#AddTMapping("&File", "switch_normal_mode_terminal", "Switch to &normal mode (terminal)", "Switch to normal mode (terminal job mode)", "<silent>", '<C-b>', '<C-T>N')
endif
call roarie_commands#AddSeparator("&File")
call roarie_commands#AddMapping("&File", "open_menu", "Open &menu...", "Open menu...", '<silent>', '<M-m>', ':<C-U>call roarie_commands#OpenMenu()<CR>')
if has('nvim')
call roarie_commands#AddMapping("&File", "command_palette", "Command &palette...", "Command palette", '<silent>', '<C-p>', ':<C-U>Telescope roarie_palette<CR>')
endif
call roarie_commands#AddSeparator("&File")
if has('nvim')
call roarie_commands#AddMapping("&File", "terminal_open", "Open &terminal...", "Open a new terminal window", "<silent>", '<F11>', ':<C-U>split term://$SHELL<CR>', "<fnalias>")
call roarie_commands#AddMapping("&File", "terminal_open_tab", "Open &terminal tab...", "Open a new terminal tab", '', '<S-F11>', ':<C-U>tabnew term://$SHELL<CR>', "<fnalias>")
else
call roarie_commands#AddMapping("&File", "terminal_open", "Open &terminal...", "Open a new terminal window", "<silent>", '<F11>', ':<C-U>terminal<CR>', "<fnalias>")
call roarie_commands#AddMapping("&File", "terminal_open_tab", "Open &terminal tab...", "Open a new terminal tab", '', '<S-F11>', ':<C-U>tab terminal<CR>', "<fnalias>")
endif
if has('nvim')
call roarie_commands#AddMapping("&File", "toggle_neo_tree", "Toggle neo-tr&ee", "Toggle neo-tree sidebar", "<silent>", '<F12>', ':<C-U>Neotree toggle right<CR>', "<fnalias>")
else
call roarie_commands#AddMapping("&File", "toggle_nerdtree", "Toggle NERDTr&ee", "Toggle NERDTree sidebar", "<silent>", '<F12>', ':<C-U>NERDTreeToggle<CR>', "<fnalias>")
endif
if has('nvim')
call roarie_commands#AddMapping("&File", "toggle_sidebar", "Toggle sideb&ar", "Toggle sidebar", "<silent>", '<S-F12>', ':lua require("sidebar-nvim").toggle({focus=true})<CR>', "<fnalias>")
call roarie_commands#AddMapping("&File", "telescope_files", "Telescope fil&es...", "Telescope files...", "<silent>", '<C-F12>', ':lua require("telescope").extensions.menufacture.defaults.find_files()<CR>', "<fnalias>")
call roarie_commands#AddMapping("&File", "telescope_file_browser", "Telescope fil&e_browser...", "Telescope file_browser...", "<silent>", '<C-S-F12>', ':<C-U>Telescope file_browser<CR>', "<fnalias>")
call roarie_commands#AddMapping("&File", "telescope_buffers", "Telescope b&uffers...", "Telescope buffers...", "<silent>", '<M-F12>', ':lua require("telescope.builtin").buffers()<CR>', "<fnalias>")
endif

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0