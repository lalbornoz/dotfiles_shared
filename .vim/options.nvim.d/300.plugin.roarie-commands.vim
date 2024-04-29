lua << EOF
lazy_plugins["roarie-commands"] = {
config = function()
	local menu = require("roarie-menu")
	menu.setup({
		highlights = {
			QuickBG = {ctermfg=251, ctermbg=236, fg="#c6c6c6", bg="#303030"},
			QuickBorder = {ctermfg=251, ctermbg=236, fg="#0679a5", bg="#303030"},
			QuickSel = {ctermfg=236, ctermbg=251, fg="#303030", bg="#f5a9b8"},
			QuickSelMap = {ctermfg=236, ctermbg=251, underline=true, fg="#0679a5", bg="#f5a9b8"},
			QuickKey = {ctermfg=179, underline=true, fg="#87d7d7"},
		},
	})
end }
EOF

" vim:filetype=lua noexpandtab sw=8 ts=8 tw=0
