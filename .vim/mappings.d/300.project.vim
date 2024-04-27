"
" [Mappings] Project
"

call roarie_commands#AddMenu("&Project", 400)
if has('nvim')
call roarie_commands#AddMapping("&Project", "peek_define", "Peek de&finition", "Peek definition", "<silent>", '<F1>', '<Cmd>lua require("goto-preview").goto_preview_definition()<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Project", "find_all_refs", "Find all &references", "Find all LSP references", "<silent>", '<C-F1>', '<Cmd>lua vim.lsp.buf.references()<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Project", "goto_define", "Go to de&finition", "Go to definition", "<silent>", '<F2>', '<Cmd>lua vim.lsp.buf.definition()<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Project", "goto_decl", "Go to de&claration", "Go to declaration", "<silent>", '<S-F2>', '<Cmd>lua vim.lsp.buf.declaration()<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Project", "edit_file_under_cursor", "Go &to file under cursor", "Edit the file whose name is under or after the cursor", '<silent>', '<C-F2>', 'gf<CR>', "<fnalias>")
else
call roarie_commands#AddMapping("&Project", "peek_define", "Peek de&finition", "Peek definition", "<silent>", '<F1>', ':<C-U>LspPeekDefinition<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Project", "find_all_refs", "Find all &references", "Find all LSP references", "<silent>", '<C-F1>', ':<C-U>LspReferences<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Project", "peek_decl", "Peek de&claration", "Peek declaration", "<silent>", '<S-F1>', ':<C-U>LspPeekDeclaration<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Project", "goto_define", "Go to de&finition", "Go to definition", "<silent>", '<F2>', ':<C-U>LspDefinition<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Project", "goto_decl", "Go to de&claration", "Go to declaration", "<silent>", '<S-F2>', ':<C-U>LspDeclaration<CR>', "<fnalias>")
endif
call roarie_commands#AddSeparator("&Project")
if has('nvim')
call roarie_commands#AddMapping("&Project", "telescope_document_symbols", "Telescope document_&symbols...", "Telescope document_symbols...", "<silent>", '<F3>', '<Cmd>Telescope lsp_document_symbols<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Project", "telescope_workspace_symbols", "Telescope workspace_&symbols...", "Telescope workspace_symbols...", "<silent>", '<S-F3>', '<Cmd>Telescope lsp_workspace_symbols<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Project", "toggle_aerial", "Toggle &Aerial sidebar", "Toggle Aerial sidebar", "<silent>", '<C-F3>', ':<C-U>AerialToggle<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Project", "toggle_aerial_nav", "Toggle &Aerial nav window", "Toggle Aerial nav window", "<silent>", '<C-S-F3>', ':<C-U>AerialNavToggle<CR>', "<fnalias>")
else
call roarie_commands#AddMapping("&Project", "search_document_symbols", "Search document &symbols...", "Search the symbols for the current document and navigate", "<silent>", '<F3>', ':<C-U>LspDocumentSymbolSearch<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Project", "search_workspace_symbols", "Search &workspace symbols...", "Search the workspace symbols for all servers and navigate using quickpick", "<silent>", '<S-F3>', ':<C-U>LspWorkspaceSymbolSearch<CR>', "<fnalias>")
endif
call roarie_commands#AddSeparator("&Project")
if has('nvim')
call roarie_commands#AddMapping("&Project", "display_hover", "Display &hover information", "Get hover information & display in preview-window", "<silent>", '<F4>', '<Cmd>lua vim.lsp.buf.hover()<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Project", "code_action", "Code act&ion...", "Code action...", "<silent>", '<S-F4>', '<Cmd>lua vim.lsp.buf.code_action()<CR>', "<fnalias>")
else
call roarie_commands#AddMapping("&Project", "display_hover", "Display &hover information", "Get hover information & display in preview-window", "<silent>", '<F4>', ':<C-U>LspHover<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Project", "code_action", "Code act&ion...", "Code action...", "<silent>", '<S-F4>', ':<C-U>LspCodeAction<CR>', "<fnalias>")
endif
call roarie_commands#AddMapping("&Project", "display_man_prompt", "Display &manual page...", "Display manual page prompt", "", '<C-F4>', ':<C-U>Man ', "<fnalias>")
call roarie_commands#AddMapping("&Project", "display_man", "Display &manual page", "Display manual page from current word", "<silent>", '<C-S-F4>', '"zyiw:exe "Man ".@z.""<CR>', "<fnalias>")
if has('nvim')
call roarie_commands#AddMapping("&Project", "telescope_man_pages", "Telescope &man_pages...", "Telescope man_pages...", '<silent>', '<M-S-F4>', ':<C-U>lua require("telescope.builtin").man_pages({sections = {"ALL"}})<CR>', "<fnalias>")
endif
call roarie_commands#AddSeparator("&Project")
call roarie_commands#AddMapping("&Project", "build", "&Build...", "Run make, open QuickFix window & redraw", "<silent>", '<F5>', ':<C-U>Make<CR>', "<fnalias>")
if has('nvim')
call roarie_commands#AddMapping("&Project", "goto_diag_next", "Go to next &diagnostic", "Go to next diagnostic in file", "<silent>", '<C-PageDown>', '<Cmd>lua vim.diagnostic.goto_next()<CR>')
call roarie_commands#AddMapping("&Project", "goto_diag_prev", "Go to previous &diagnostic", "Go to previous diagnostic in file", "<silent>", '<C-PageUp>', '<Cmd>lua vim.diagnostic.goto_prev()<CR>')
else
call roarie_commands#AddMapping("&Project", "goto_diag_next", "Go to &next diagnostic", "Go to next diagnostic in file", "<silent>", '<C-PageDown>', ':<C-U>LspNextDiagnostic<CR>')
call roarie_commands#AddMapping("&Project", "goto_diag_prev", "Go to &previous diagnostic", "Go to previous diagnostic in file", "<silent>", '<C-PageUp>', ':<C-U>LspPreviousDiagnostic<CR>')
endif
call roarie_commands#AddSeparator("&Project")
call roarie_commands#AddMapping("&Project", "git_status", "&Git status", "Bring up summary window akin to git-status", "<silent>", '<F6>', ':<C-U>Git<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Project", "git_log", "&Git log", "Git log", "<silent>", '<S-F6>', ':<C-U>Git log<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Project", "git_diff", "&Git diff", "Print global Git diff into new scratch window", "<silent>", '<C-F6>', ':<C-U>Git diff<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Project", "git_diffsplit", "&Git diffsplit", "Git diff of current file w/ split window", "<silent>", '<C-S-F6>', ':<C-U>Gdiffsplit<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Project", "git_prompt", "&Git prompt...", "Git prompt...", '', '<M-F6>', ':<C-U>Git ', "<fnalias>")
call roarie_commands#AddMapping("&Project", "telescope_git_commits", "Telescope &git_commits...", "Telescope git_commits...", '', '<M-S-F6>', ':<C-U>Telescope git_commits<CR>', "<fnalias>")

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
