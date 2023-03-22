lua << EOF
require 'hex'.setup {
	-- function that runs on BufReadPre to determine if it's binary or not
	is_file_binary_pre_read = function()
		return false
	end,

	-- function that runs on BufReadPost to determine if it's binary or not
	is_file_binary_post_read = function()
		return false
	end,
}
EOF

" vim:filetype=vim noexpandtab sw=8 ts=8 tw=0
