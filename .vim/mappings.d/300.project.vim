"
" [Mappings] Project
"

call AddMenu("Project", 300)
call AddMapping("Project", "Peek definition", "Peek definition", '<silent>', '<F1>', '<Cmd>lua require("goto-preview").goto_preview_definition()<CR>')
call AddMapping("Project", "Go to definition", "Go to definition", '<silent>', '<F2>', ':<C-U>LspDefinition<CR>')
call AddMapping("Project", "Go to declaration", "Go to declaration", '<silent>', '<S-F2>', ':<C-U>LspDeclaration<CR>')
call AddSeparator("Project")
call AddMapping("Project", "Find all references", "Find all LSP references", '<silent>', '<F3>', ':<C-U>LspReferences<CR>')
call AddMapping("Project", "Search document symbols...", "Search the symbols for the current document and navigate", '<silent>', '<S-F3>', ':<C-U>LspDocumentSymbolSearch<CR>')
call AddMapping("Project", "Search workspace symbols...", "Search the workspace symbols for all servers and navigate using quickpick", '<silent>', '<Alt><Shift><F3>', ':<C-U>LspWorkspaceSymbolSearch<CR>')
call AddSeparator("Project")
call AddMapping("Project", "Display hover information", "Get hover information & display in preview-window", '<silent>', '<F4>', ':<C-U>LspHover<CR>')
call AddMapping("Project", "Code action...", "Code action...", '<silent>', '<S-F4>', ':<C-U>LspCodeAction<CR>')
call AddSeparator("Project")
call AddMapping("Project", "Build...", "Run make, open QuickFix window & redraw", '<silent>', '<F5>', ':<C-U>Make<CR>')
call AddMapping("Project", "Go to next diagnostic", "Go to next diagnostic in file", '<silent>', '<Alt><F5>', ':<C-U>LspNextDiagnostic<CR>')
call AddMapping("Project", "Go to previous diagnostic", "Go to previous diagnostic in file", '<silent>', '<Alt><Shift><F5>', ':<C-U>LspPreviousDiagnostic<CR>')
call AddSeparator("Project")
call AddMapping("Project", "Display manual page...", 'Display manual page...', '', '<F6>', ':<C-U>Man ')
call AddMapping("Project", "Display manual page", "Display manual page from current word", '<silent>', '<S-F6>', '"zyiw:exe "Man ".@z.""<CR>')

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
