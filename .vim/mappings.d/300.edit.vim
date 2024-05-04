"
" [Mappings] Edit menu mappings
"

call roarie_commands#AddMenu("&Edit")
call roarie_commands#AddNMapping("&Edit", "filter_file", "&Filter file...", "Filter entire file through program w/ tab-complete from favourites prompt", '', '<F9>', ':FPC ', "<fnalias>")
call roarie_commands#AddVMapping("&Edit", "filter_range", "&Filter range...", "Filter visual range through program w/ tab-complete from favourites prompt", '', '<F9>', ':FPCR ', "<fnalias>")
call roarie_commands#AddMapping("&Edit", "read_program", "&Read from program...", "Read from program prompt into new scratch window", '', '<M-F9>', ':<C-U>CReadNewScratch ', "<fnalias>")
call roarie_commands#AddMapping("&Edit", "read_program_buffer", "&Read from program into buffer...", "Read from program prompt into current buffer", '', '<M-S-F9>', ':<C-U>r!', "<fnalias>")
call roarie_commands#AddSeparator("&Edit")
if has('nvim')
call roarie_commands#AddMapping("&Edit", "telescope_live_grep", "Telescope live_&grep...", "Telescope live_grep...", "<silent>", '<F10>', ':lua require("telescope").extensions.menufacture.defaults.live_grep()<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Edit", "telescope_live_grep_buffer", "Telescope live_&grep buffer...", "Telescope live_grep buffer...", "<silent>", '<S-F10>', ':lua require("telescope").extensions.menufacture.defaults.live_grep_buffer()<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Edit", "spectre_search_word", "&Spectre search word", "Spectre search word", "<silent>", '<C-F10>', '<Cmd>lua require("spectre").open_visual({select_word=true})<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Edit", "spectre_search_file", "&Spectre search in file", "Spectre search in file", "<silent>", '<C-S-F10>', '<Cmd>lua require("spectre").open_file_search({select_word=true})<CR>', "<fnalias>")
call roarie_commands#AddMapping("&Edit", "telescope_live_grep_cword", "Telescope live_&grep word...", "Telescope live_grep word under cursor...", "<silent>", '<M-F10>', ':lua require("telescope").extensions.menufacture.defaults.live_grep({default_text=vim.fn.expand("<cword>")})<CR>', "<fnalias>")
else
call roarie_commands#AddMapping("&Edit", "grep", "Grep...", "&Grep...", '', '<F10>', ':<C-U>Grep ', "<fnalias>")
call roarie_commands#AddMapping("&Edit", "rgrep", "Rgrep...", "Recursive &Grep...", '', '<M-F10>', ':<C-U>Rgrep ', "<fnalias>")
call roarie_commands#AddMapping("&Edit", "bgrep", "Bgrep...", "&Grep in current buffer...", '', '<S-F10>', ':<C-U>Bgrep ', "<fnalias>")
endif
if has('nvim')
call roarie_commands#AddSeparator("&Edit")
call roarie_commands#AddMapping("&Edit", "spectre_toggle", "Toggle &spectre", "Toggle spectre sidebar", "<silent>", '<M-S-F12>', '<Cmd>lua require("spectre").toggle()<CR>', "<fnalias>")
endif

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
