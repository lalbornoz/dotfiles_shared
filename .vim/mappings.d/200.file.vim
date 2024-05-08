"
" [Mappings] File menu mappings
"

call roarie_commands#AddMenu("&File")
call roarie_commands#AddMapping("&File", "open_menu", "Open &menu...", "Open menu...", '<silent>', '<M-m>', ':<C-U>call roarie_commands#OpenMenu()<CR>', "", "󰍜")
if has('nvim')
call roarie_commands#AddMapping("&File", "command_palette", "Command &palette...", "Command palette", '<silent>', '<C-p>', ':<C-U>Telescope roarie_palette<CR>', "", "󰘳")
endif
call roarie_commands#AddSeparator("&File")
if has('nvim')
call roarie_commands#AddMapping("&File", "terminal_open", "Open &terminal...", "Open a new terminal window", "<silent>", '<F11>', ':<C-U>split term://$SHELL<CR><C-\><C-n>:au TermClose <buffer> :q!<CR>i', "<fnalias>", "")
call roarie_commands#AddMapping("&File", "terminal_open_tab", "Open &terminal tab...", "Open a new terminal tab", '', '<S-F11>', ':<C-U>tabnew term://$SHELL<CR><C-\><C-n>:au TermClose <buffer> :q!<CR>i', "<fnalias>", "")
else
call roarie_commands#AddMapping("&File", "terminal_open", "Open &terminal...", "Open a new terminal window", "<silent>", '<F11>', ':<C-U>terminal<CR>', "<fnalias>")
call roarie_commands#AddMapping("&File", "terminal_open_tab", "Open &terminal tab...", "Open a new terminal tab", '', '<S-F11>', ':<C-U>tab terminal<CR>', "<fnalias>")
endif
if has('nvim')
call roarie_commands#AddMapping("&File", "telescope_workspaces", "&Workspaces...", "Telescope workspaces...", "<silent>", '<C-F11>', ':Telescope workspaces<CR>', "<fnalias>", "")
call roarie_commands#AddMapping("&File", "workspace_add", "Add &workspace...", "Add workspace from current path", "<silent>", '<C-S-F11>', ':<C-U>WorkspacesAddDir<CR>', "<fnalias>", "")
call roarie_commands#AddMapping("&File", "workspace_remove", "Remove &workspace...", "Remove workspace at current path", "<silent>", '<M-F11>', ':<C-U>WorkspacesRemoveDir<CR>', "<fnalias>", "")
call roarie_commands#AddMapping("&File", "workspace_rename", "Rename &workspace...", "Rename workspace", "<silent>", '<M-S-F11>', ':<C-U>WorkspacesRename ', "<fnalias>", "")
endif
call roarie_commands#AddSeparator("&File")
if has('nvim')
call roarie_commands#AddMapping("&File", "toggle_neo_tree", "Toggle fil&e tree sidebar", "Toggle neo-tree sidebar", "<silent>", '<F12>', ':<C-U>Neotree toggle right<CR>', "<fnalias>", "פּ")
else
call roarie_commands#AddMapping("&File", "toggle_nerdtree", "Toggle fil&e tree sidebar", "Toggle NERDTree sidebar", "<silent>", '<F12>', ':<C-U>NERDTreeToggle<CR>', "<fnalias>")
endif
if has('nvim')
call roarie_commands#AddMapping("&File", "telescope_buffers", "B&uffers picker...", "Telescope buffers...", "<silent>", '<S-F12>', ':lua require("telescope.builtin").buffers()<CR>', "<fnalias>", "")
call roarie_commands#AddMapping("&File", "telescope_files", "Fil&es picker...", "Telescope files...", "<silent>", '<C-F12>', ':lua require("telescope").extensions.menufacture.defaults.find_files()<CR>', "<fnalias>", "")
call roarie_commands#AddMapping("&File", "telescope_file_browser", "Fil&e browser picker...", "Telescope file_browser...", "<silent>", '<C-S-F12>', ':<C-U>Telescope file_browser<CR>', "<fnalias>", "")
call roarie_commands#AddMapping("&File", "telescope_resume", "&Restart last picker...", "Restart last Telescope picker w/ Telescope resume...", "<silent>", '<M-F12>', ':<C-U>Telescope resume<CR>', "<fnalias>", "ﰇ")
call roarie_commands#AddMapping("&File", "telescope_builtin", "&Available pickers...", "Telescope builtin picker w/ include_extensions=true", "<silent>", '<M-S-F12>', ':<C-U>Telescope builtin include_extensions=true<CR>', "<fnalias>", "")
endif
call roarie_commands#AddSeparator("&File")
call roarie_commands#AddIMapping("&File", "exit_insert", "E&xit insert mode", "Exit insert mode", '', '<C-Q>', '<Esc>', "", "")
if has('nvim')
call roarie_commands#AddTMapping("&File", "terminal_exit", "E&xit terminal mode", "Exit terminal mode", '', '<Esc>', '<C-\><C-n>', "", "")
call roarie_commands#AddTMapping("&File", "switch_normal_mode_terminal", "Switch to &normal mode (terminal)", "Switch to normal mode (terminal job mode)", "<silent>", '<C-b>', '<C-\><C-n>N', "", "")
else
call roarie_commands#AddTMapping("&File", "switch_normal_mode_terminal", "Switch to &normal mode (terminal)", "Switch to normal mode (terminal job mode)", "<silent>", '<C-b>', '<C-T>N')
endif

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
