"
" [Mappings] Project menu mappings
"

call roarie_commands#AddMenu("&Project")
if has('nvim')
call roarie_commands#AddMapping("&Project", "build", "&Build...", "Build project w/ BuildMe and .buildme.sh", "<silent>", '<F5>', ':<C-U>BuildMe<CR>', "<fnalias>", "")
call roarie_commands#AddMapping("&Project", "run", "&Run...", "Run project w/ RunMe and .runme.sh", "<silent>", '<S-F5>', ':<C-U>RunMe<CR>', "<fnalias>", "ﰌ")
call roarie_commands#AddMapping("&Project", "build_run", "Build and &run...", "Build and run project w/ {Build,Run}Me and .{build,run}me.sh", "<silent>", '<C-F5>', ':<C-U>BuildRunMe<CR>', "<fnalias>", "ﰌ")
call roarie_commands#AddMapping("&Project", "build_submenu", "Build sub&menu...", "Build and run project submenu", "<silent>", '<C-S-F5>', '', "<fnalias>", "")
call roarie_commands#AddSeparator("&Project")
else
call roarie_commands#AddMapping("&Project", "build", "&Build...", "Run make, open QuickFix window & redraw", "<silent>", '<F5>', ':<C-U>Make<CR>', "<fnalias>")
endif
if has('nvim')
call roarie_commands#AddMapping("&Project", "gdb_start_prompt", "GD&B start prompt...", "GD&B start prompt...", "", '<M-F5>', ':<C-U>GdbStart ', "<fnalias>", "")
call roarie_commands#AddMapping("&Project", "gdb_continue", "Continue in GD&B", "Continue execution in GD&B", "<silent>", '<M-S-F5>', ':<C-U>GdbContinue<CR>', "<fnalias>", "")
call roarie_commands#AddMapping("&Project", "gdb_step_into", "Step into st&atement", "Step into st&atement in GD&B", "<silent>", '<M-PageUp>', ':<C-U>GdbStep<CR>', "", "")
call roarie_commands#AddMapping("&Project", "gdb_step_over", "Step over st&atement", "Step over st&atement in GD&B", "<silent>", '<M-PageDown>', ':<C-U>GdbNext<CR>', "", "")
call roarie_commands#AddMapping("&Project", "gdb_frame_up", "&Frame up in GD&B", "Navigate one frame up in GD&B", "<silent>", '<M-S-PageUp>', ':<C-U>GdbFrameUp<CR>', "", "")
call roarie_commands#AddMapping("&Project", "gdb_frame_down", "&Frame down in GD&B", "Navigate one frame down in GD&B", "<silent>", '<M-S-PageDown>', ':<C-U>GdbFrameDown<CR>', "", "")
call roarie_commands#AddMapping("&Project", "gdb_toggle_breakpoint", "Toggle GD&B breakpoint", "Toggle GD&B breakpoint in the cursor line", "<silent>", '<C-b>', ':<C-U>GdbBreakpointToggle<CR>', "<fnalias>", "")
endif
call roarie_commands#AddSeparator("&Project")
call roarie_commands#AddMapping("&Project", "git_status", "&Git status", "Bring up summary window akin to git-status", "<silent>", '<F6>', ':<C-U>Git<CR>', "<fnalias>", "")
call roarie_commands#AddMapping("&Project", "git_log", "&Git log", "Git log", "<silent>", '<S-F6>', ':<C-U>Git log<CR>', "<fnalias>", "")
call roarie_commands#AddMapping("&Project", "git_diff", "&Git diff", "Print global Git diff into new scratch window", "<silent>", '<C-F6>', ':<C-U>Git diff<CR>', "<fnalias>", "")
call roarie_commands#AddMapping("&Project", "git_diffsplit", "&Git diffsplit", "Git diff of current file w/ split window", "<silent>", '<C-S-F6>', ':<C-U>Gdiffsplit<CR>', "<fnalias>", "")
call roarie_commands#AddMapping("&Project", "git_prompt", "&Git prompt...", "Git prompt...", '', '<M-F6>', ':<C-U>Git ', "<fnalias>", "")
call roarie_commands#AddMapping("&Project", "telescope_git_commits", "Telescope &git_commits...", "Telescope git_commits...", '', '<M-S-F6>', ':<C-U>Telescope git_commits<CR>', "<fnalias>", "ﰖ")
if has('nvim')
call roarie_commands#AddMapping("&Project", "git_lazygit", "&LazyGit...", "Open LazyGit window...", "<silent>", '<C-y>', ':<C-U>lua _lazygit_toggle()<CR>', "", "")
endif

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
