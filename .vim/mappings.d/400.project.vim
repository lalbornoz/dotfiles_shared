"
" [Mappings] Project
"

call roarie_menu#AddMenu("Project", 400)
if has('nvim')
call roarie_menu#AddMapping("Project", "Peek definition", "Peek definition", "<silent>", '<F1>', '<Cmd>lua require("goto-preview").goto_preview_definition()<CR>')
call roarie_menu#AddMapping("<Fn>", "Peek definition", "Peek definition", "<silent>", '<F1>', '<Cmd>lua require("goto-preview").goto_preview_definition()<CR>', 1)
call roarie_menu#AddMapping("Project", "Go to definition", "Go to definition", "<silent>", '<F2>', '<Cmd>lua vim.lsp.buf.definition()<CR>')
call roarie_menu#AddMapping("<Fn>", "Go to definition", "Go to definition", "<silent>", '<F2>', '<Cmd>lua vim.lsp.buf.definition()<CR>', 1)
call roarie_menu#AddMapping("Project", "Go to declaration", "Go to declaration", "<silent>", '<S-F2>', '<Cmd>lua vim.lsp.buf.declaration()<CR>')
call roarie_menu#AddMapping("<Fn>", "Go to declaration", "Go to declaration", "<silent>", '<S-F2>', '<Cmd>lua vim.lsp.buf.declaration()<CR>', 1)
else
call roarie_menu#AddMapping("Project", "Peek definition", "Peek definition", "<silent>", '<F1>', ':<C-U>LspPeekDefinition<CR>')
call roarie_menu#AddMapping("<Fn>", "Peek definition", "Peek definition", "<silent>", '<F1>', ':<C-U>LspPeekDefinition<CR>', 1)
call roarie_menu#AddMapping("Project", "Peek declaration", "Peek declaration", "<silent>", '<S-F1>', ':<C-U>LspPeekDeclaration<CR>')
call roarie_menu#AddMapping("<Fn>", "Peek declaration", "Peek declaration", "<silent>", '<S-F1>', ':<C-U>LspPeekDeclaration<CR>', 1)
call roarie_menu#AddMapping("Project", "Go to definition", "Go to definition", "<silent>", '<F2>', ':<C-U>LspDefinition<CR>')
call roarie_menu#AddMapping("<Fn>", "Go to definition", "Go to definition", "<silent>", '<F2>', ':<C-U>LspDefinition<CR>', 1)
call roarie_menu#AddMapping("Project", "Go to declaration", "Go to declaration", "<silent>", '<S-F2>', ':<C-U>LspDeclaration<CR>')
call roarie_menu#AddMapping("<Fn>", "Go to declaration", "Go to declaration", "<silent>", '<S-F2>', ':<C-U>LspDeclaration<CR>', 1)
endif
call roarie_menu#AddSeparator("Project")
if has('nvim')
call roarie_menu#AddMapping("Project", "Telescope document_symbols...", "Telescope document_symbols...", "<silent>", '<F3>', '<Cmd>Telescope lsp_document_symbols<CR>')
call roarie_menu#AddMapping("<Fn>", "Telescope document_symbols...", "Telescope document_symbols...", "<silent>", '<F3>', '<Cmd>Telescope lsp_document_symbols<CR>', 1)
call roarie_menu#AddMapping("Project", "Telescope workspace_symbols...", "Telescope workspace_symbols...", "<silent>", '<S-F3>', '<Cmd>Telescope lsp_workspace_symbols<CR>')
call roarie_menu#AddMapping("<Fn>", "Telescope workspace_symbols...", "Telescope workspace_symbols...", "<silent>", '<S-F3>', '<Cmd>Telescope lsp_workspace_symbols<CR>', 1)
call roarie_menu#AddMapping("Project", "Find all references", "Find all LSP references", "<silent>", '<M-F3>', '<Cmd>lua vim.lsp.buf.references()<CR>')
call roarie_menu#AddMapping("<Fn>", "Find all references", "Find all LSP references", "<silent>", '<M-F3>', '<Cmd>lua vim.lsp.buf.references()<CR>', 1)
else
call roarie_menu#AddMapping("Project", "Search document symbols...", "Search the symbols for the current document and navigate", "<silent>", '<F3>', ':<C-U>LspDocumentSymbolSearch<CR>')
call roarie_menu#AddMapping("<Fn>", "Search document symbols...", "Search the symbols for the current document and navigate", "<silent>", '<F3>', ':<C-U>LspDocumentSymbolSearch<CR>', 1)
call roarie_menu#AddMapping("Project", "Search workspace symbols...", "Search the workspace symbols for all servers and navigate using quickpick", "<silent>", '<S-F3>', ':<C-U>LspWorkspaceSymbolSearch<CR>')
call roarie_menu#AddMapping("<Fn>", "Search workspace symbols...", "Search the workspace symbols for all servers and navigate using quickpick", "<silent>", '<S-F3>', ':<C-U>LspWorkspaceSymbolSearch<CR>', 1)
call roarie_menu#AddMapping("Project", "Find all references", "Find all LSP references", "<silent>", '<M-F3>', ':<C-U>LspReferences<CR>')
call roarie_menu#AddMapping("<Fn>", "Find all references", "Find all LSP references", "<silent>", '<M-F3>', ':<C-U>LspReferences<CR>', 1)
endif
call roarie_menu#AddSeparator("Project")
if has('nvim')
call roarie_menu#AddMapping("Project", "Display hover information", "Get hover information & display in preview-window", "<silent>", '<F4>', '<Cmd>lua vim.lsp.buf.hover()<CR>')
call roarie_menu#AddMapping("<Fn>", "Display hover information", "Get hover information & display in preview-window", "<silent>", '<F4>', '<Cmd>lua vim.lsp.buf.hover()<CR>', 1)
call roarie_menu#AddMapping("Project", "Code action...", "Code action...", "<silent>", '<S-F4>', '<Cmd>lua vim.lsp.buf.code_action()<CR>')
call roarie_menu#AddMapping("<Fn>", "Code action...", "Code action...", "<silent>", '<S-F4>', '<Cmd>lua vim.lsp.buf.code_action()<CR>', 1)
else
call roarie_menu#AddMapping("Project", "Display hover information", "Get hover information & display in preview-window", "<silent>", '<F4>', ':<C-U>LspHover<CR>')
call roarie_menu#AddMapping("<Fn>", "Display hover information", "Get hover information & display in preview-window", "<silent>", '<F4>', ':<C-U>LspHover<CR>', 1)
call roarie_menu#AddMapping("Project", "Code action...", "Code action...", "<silent>", '<S-F4>', ':<C-U>LspCodeAction<CR>')
call roarie_menu#AddMapping("<Fn>", "Code action...", "Code action...", "<silent>", '<S-F4>', ':<C-U>LspCodeAction<CR>', 1)
endif
call roarie_menu#AddSeparator("Project")
call roarie_menu#AddMapping("Project", "Build...", "Run make, open QuickFix window & redraw", "<silent>", '<F5>', ':<C-U>Make<CR>')
call roarie_menu#AddMapping("<Fn>", "Build...", "Run make, open QuickFix window & redraw", "<silent>", '<F5>', ':<C-U>Make<CR>', 1)
if has('nvim')
call roarie_menu#AddMapping("Project", "Add workspace...", "Add workspace from current path", "<silent>", '<S-F5>', ':<C-U>WorkspacesAddDir<CR>')
call roarie_menu#AddMapping("<Fn>", "Add workspace...", "Add workspace from current path", "<silent>", '<S-F5>', ':<C-U>WorkspacesAddDir<CR>', 1)
call roarie_menu#AddMapping("Project", "Remove workspace...", "Remove workspace at current path", "<silent>", '<M-F5>', ':<C-U>WorkspacesRemoveDir<CR>')
call roarie_menu#AddMapping("<Fn>", "Remove workspace...", "Remove workspace at current path", "<silent>", '<M-F5>', ':<C-U>WorkspacesRemoveDir<CR>', 1)
call roarie_menu#AddMapping("Project", "Rename workspace...", "Rename workspace", "<silent>", '<C-F5>', ':<C-U>WorkspacesRename ')
call roarie_menu#AddMapping("<Fn>", "Rename workspace...", "Rename workspace", "<silent>", '<C-F5>', ':<C-U>WorkspacesRename ', 1)
call roarie_menu#AddMapping("Project", "Go to next diagnostic", "Go to next diagnostic in file", "<silent>", '<C-PageDown>', '<Cmd>lua vim.diagnostic.goto_next()<CR>')
call roarie_menu#AddMapping("Project", "Go to previous diagnostic", "Go to previous diagnostic in file", "<silent>", '<C-PageUp>', '<Cmd>lua vim.diagnostic.goto_prev()<CR>')
else
call roarie_menu#AddMapping("Project", "Go to next diagnostic", "Go to next diagnostic in file", "<silent>", '<C-PageDown>', ':<C-U>LspNextDiagnostic<CR>')
call roarie_menu#AddMapping("Project", "Go to previous diagnostic", "Go to previous diagnostic in file", "<silent>", '<C-PageUp>', ':<C-U>LspPreviousDiagnostic<CR>')
endif
call roarie_menu#AddSeparator("Project")
call roarie_menu#AddMapping("Project", "Display manual page...", "Display manual page...", '', '<F6>', ':<C-U>Man ')
call roarie_menu#AddMapping("<Fn>", "Display manual page...", "Display manual page...", '', '<F6>', ':<C-U>Man ', 1)
call roarie_menu#AddMapping("Project", "Display manual page", "Display manual page from current word", "<silent>", '<S-F6>', '"zyiw:exe "Man ".@z.""<CR>')
call roarie_menu#AddMapping("<Fn>", "Display manual page", "Display manual page from current word", "<silent>", '<S-F6>', '"zyiw:exe "Man ".@z.""<CR>', 1)

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
