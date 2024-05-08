"
" [Mappings] Edit menu mappings
"

call roarie_commands#AddMenu("&Edit")
call roarie_commands#AddIMapping("&Edit", "complete", "Complete in insert mode...", "Complete in insert mode...", '', '<S-Tab>', '', "<pseudo>", "")
call roarie_commands#AddMapping("&Edit", "buffer_next", "Next &buffer", "Go to next buffer in buffer list", "<silent>", '<S-Tab>', ':<C-U>bn<CR>', "", "")
call roarie_commands#AddMapping("&Edit", "buffer_prev", "Previous &buffer", "Go to previous buffer in buffer list", "<silent>", '<C-S-Tab>', ':<C-U>bp<CR>', "", "")
call roarie_commands#AddSeparator("&Edit")
call roarie_commands#AddMapping("&Edit", "num_incr", "Increment &number", "Increment number under cursor", '<silent>', '<S-Home>', '<C-A>', "", "")
call roarie_commands#AddMapping("&Edit", "num_decr", "Decrement &number", "Decrement number under cursor", '<silent>', '<S-End>', '<C-X>', "", "")
call roarie_commands#AddMapping("&Edit", "case_invert_word", "&Invert case of word", "Invert case of word under cursor", '<silent>', '<C-Home>', 'g~w', "", "")
call roarie_commands#AddMapping("&Edit", "case_invert_line", "&Invert case of line", "Invert case of line under cursor", '<silent>', '<C-End>', 'g~~', "", "")
call roarie_commands#AddMapping("&Edit", "bidi_enable", "Enable &bidirectionality", "Enable bidirectionality", '<silent>', '<M-Home>', ':<C-U>BidiEnable<CR>:KeyboardAutoEnable<CR>', "", "")
call roarie_commands#AddMapping("&Edit", "bidi_disable", "Disable &bidirectionality", "Disable bidirectionality", '<silent>', '<M-End>', ':<C-U>BidiDisable<CR>:KeyboardAutoDisable<CR>', "", "")
call roarie_commands#AddSeparator("&Edit")
call roarie_commands#AddNMapping("&Edit", "filter_file", "&Filter file...", "Filter entire file through program w/ tab-complete from favourites prompt", '', '<F9>', ':FPC ', "<fnalias>", "")
call roarie_commands#AddVMapping("&Edit", "filter_range", "&Filter range...", "Filter visual range through program w/ tab-complete from favourites prompt", '', '<F9>', ':FPCR ', "<fnalias>", "")
call roarie_commands#AddMapping("&Edit", "read_program", "&Read from program...", "Read from program prompt into new scratch window", '', '<M-F9>', ':<C-U>CReadNewScratch ', "<fnalias>", "")
call roarie_commands#AddMapping("&Edit", "read_program_buffer", "&Read from program into buffer...", "Read from program prompt into current buffer", '', '<M-S-F9>', ':<C-U>r!', "<fnalias>", "")
call roarie_commands#AddSeparator("&Edit")
if has('nvim')
call roarie_commands#AddMapping("&Edit", "telescope_live_grep", "Live &grep picker...", "Telescope live_grep...", "<silent>", '<F10>', ':lua require("telescope").extensions.menufacture.defaults.live_grep()<CR>', "<fnalias>", "")
call roarie_commands#AddMapping("&Edit", "telescope_live_grep_buffer", "Live &grep buffer picker...", "Telescope live_grep buffer...", "<silent>", '<S-F10>', ':lua require("telescope").extensions.menufacture.defaults.live_grep_buffer()<CR>', "<fnalias>", "")
call roarie_commands#AddMapping("&Edit", "telescope_live_grep_cword", "Live &grep word picker...", "Telescope live_grep word under cursor...", "<silent>", '<C-F10>', ':lua require("telescope").extensions.menufacture.defaults.live_grep({default_text=vim.fn.expand("<cword>")})<CR>', "<fnalias>", "")
call roarie_commands#AddMapping("&Edit", "spectre_toggle", "Toggle &spectre sidebar", "Toggle spectre sidebar", "<silent>", '<C-S-F10>', '<Cmd>lua require("spectre").toggle()<CR>', "<fnalias>", "")
call roarie_commands#AddMapping("&Edit", "spectre_search_word", "&Spectre search word", "Spectre search word", "<silent>", '<M-F10>', '<Cmd>lua require("spectre").open_visual({select_word=true})<CR>', "<fnalias>", "ﰍ")
call roarie_commands#AddMapping("&Edit", "spectre_search_file", "&Spectre search in file", "Spectre search in file", "<silent>", '<M-S-F10>', '<Cmd>lua require("spectre").open_file_search({select_word=true})<CR>', "<fnalias>", "")
else
call roarie_commands#AddMapping("&Edit", "grep", "Grep...", "&Grep...", '', '<F10>', ':<C-U>Grep ', "<fnalias>")
call roarie_commands#AddMapping("&Edit", "rgrep", "Rgrep...", "Recursive &Grep...", '', '<M-F10>', ':<C-U>Rgrep ', "<fnalias>")
call roarie_commands#AddMapping("&Edit", "bgrep", "Bgrep...", "&Grep in current buffer...", '', '<S-F10>', ':<C-U>Bgrep ', "<fnalias>")
endif

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
