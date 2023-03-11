"
" [Mappings] LSP (C/C++, Python, Rust); sh menu mappings
"

call AddMenu("LSP")

" LSP & QuickFix function hotkeys
fun! Lsp_decl_filetype()
if &filetype == "c" || &filetype == "cpp"
	call AddMapping("LSP", "Peek definition", "Peek definition (C/C++, Python)", '<silent>', '<F1>', ':<C-U>LspPeekDefinition<CR>')
	call AddMapping("LSP", "Peek declaration", "Peek declaration (C/C++ only)", '<silent>', '<F2>', ':<C-U>LspPeekDeclaration<CR>')
	call AddMapping("LSP", "Go to declaration", "Go to declaration (C/C++ only)", '<silent>', '<F3>', ':<C-U>LspDeclaration<CR>')
	call AddMapping("LSP", "Go to previous diagnostic", "Go to previous diagnostic in file (C/C++, Python)", '<silent>', '<S-F3>', ':<C-U>LspPreviousDiagnostic<CR>')
	call AddMapping("LSP", "Go to definition", "Go to definition (C/C++, Python)", '<silent>', '<F4>', ':<C-U>LspDefinition<CR>')
	call AddMapping("LSP", "Go to next diagnostic", "Go to next diagnostic in file (C/C++, Python)", '<silent>', '<S-F4>', ':<C-U>LspNextDiagnostic<CR>')
	call AddSeparator("LSP")
	call AddMapping("LSP", "Find all references", "Find all LSP references (C/C++, Python)", '<silent>', '<F5>', ':<C-U>LspReferences<CR>')
	call AddMapping("LSP", "Search and show symbols...", "Search and show workspace symbols (C/C++, Python)", '<silent>', '<S-F5>', ':<C-U>LspWorkspaceSymbol<CR>')
	call AddMapping("LSP", "Display hover information", "Get hover information & display in preview-window (C/C++, Python)", '<silent>', '<F6>', ':<C-U>LspHover<CR>')
	call AddMapping("LSP", "Build...", "Run make, open QuickFix window & redraw (C/C++, Python)", '<silent>', '<S-F6>', ':<C-U>silent make\|redraw!<CR>')
	call InstallMenus()
elseif &filetype == "python" || &filetype == "rust"
	call AddMapping("LSP", "Peek definition", "Peek definition (C/C++, Python, Rust)", '<silent>', '<F1>', ':<C-U>LspPeekDefinition<CR>')
	call AddMapping("LSP", "Go to previous error", "Go to previous error in file (Python, Rust only)", '<silent>', '<F2>', ':<C-U>LspPreviousError<CR>')
	call AddMapping("LSP", "Go to next error", "Go to next error in file (Python, Rust only)", '<silent>', '<F3>', ':<C-U>LspNextError<CR>')
	call AddMapping("LSP", "Go to previous diagnostic", "Go to previous diagnostic in file (C/C++, Python, Rust)", '<silent>', '<S-F3>', ':<C-U>LspPreviousDiagnostic<CR>')
	call AddMapping("LSP", "Go to definition", "Go to definition (C/C++, Python, Rust)", '<silent>', '<F4>', ':<C-U>LspDefinition<CR>')
	call AddMapping("LSP", "Go to next diagnostic", "Go to next diagnostic in file (C/C++, Python, Rust)", '<silent>', '<S-F4>', ':<C-U>LspNextDiagnostic<CR>')
	call AddSeparator("LSP")
	call AddMapping("LSP", "Find all references", "Find all references (C/C++, Python, Rust)", '<silent>', '<F5>', ':<C-U>LspReferences<CR>')
	call AddMapping("LSP", "Search and show symbols...", "Search and show workspace symbols (C/C++, Python, Rust)", '<silent>', '<S-F5>', ':<C-U>LspWorkspaceSymbol<CR>')
	call AddMapping("LSP", "Display hover information", "Get hover information & display in preview-window (C/C++, Python, Rust)", '<silent>', '<F6>', ':<C-U>LspHover<CR>')
	call AddMapping("LSP", "Build...", "Run make, open QuickFix window & redraw (C/C++, Python, Rust)", '<silent>', '<S-F6>', ':<C-U>silent make\|redraw!<CR>')
	call InstallMenus()
endif
endfun | silent au FileType * call Lsp_decl_filetype()

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
