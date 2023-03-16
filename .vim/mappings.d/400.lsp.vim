"
" [Mappings] LSP
"

call AddMenu("LSP", 400)
call AddMapping("LSP", "Peek definition", "Peek definition", '<silent>', '<F1>', ':<C-U>LspPeekDefinition<CR>')
call AddMapping("LSP", "Peek declaration", "Peek declaration", '<silent>', '<S-F1>', ':<C-U>LspPeekDeclaration<CR>')
call AddMapping("LSP", "Go to definition", "Go to definition", '<silent>', '<F2>', ':<C-U>LspDefinition<CR>')
call AddMapping("LSP", "Go to declaration", "Go to declaration", '<silent>', '<S-F2>', ':<C-U>LspDeclaration<CR>')
call AddSeparator("LSP")
call AddMapping("LSP", "Find all references", "Find all LSP references", '<silent>', '<F3>', ':<C-U>LspReferences<CR>')
call AddMapping("LSP", "Search document symbols...", "Search the symbols for the current document and navigate", '<silent>', '<S-F3>', ':<C-U>LspDocumentSymbolSearch<CR>')
call AddMapping("LSP", "Search workspace symbols...", "Search the workspace symbols for all servers and navigate using quickpick", '<silent>', '<Alt><Shift><F3>', ':<C-U>LspWorkspaceSymbolSearch<CR>')
call AddSeparator("LSP")
call AddMapping("LSP", "Display hover information", "Get hover information & display in preview-window", '<silent>', '<F4>', ':<C-U>LspHover<CR>')
call AddMapping("LSP", "Code action...", "Code action...", '<silent>', '<S-F4>', ':<C-U>LspCodeAction<CR>')
call AddSeparator("LSP")
call AddMapping("LSP", "Build...", "Run make, open QuickFix window & redraw", '<silent>', '<F5>', ':<C-U>Make<CR>')
call AddMapping("LSP", "Go to next diagnostic", "Go to next diagnostic in file", '<silent>', '<Alt><F5>', ':<C-U>LspNextDiagnostic<CR>')
call AddMapping("LSP", "Go to previous diagnostic", "Go to previous diagnostic in file", '<silent>', '<Alt><Shift><F5>', ':<C-U>LspPreviousDiagnostic<CR>')

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
