lua << EOF
lazy_plugins["aerial.nvim"] = {
config = function()
	require("aerial").setup({
	})

	local telescope = require("telescope")
	telescope.load_extension 'aerial'
end }
EOF

" vim:filetype=lua noexpandtab sw=8 ts=8 tw=0
