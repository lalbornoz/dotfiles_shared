if has('nvim')
lua << EOF
require("telescope").setup { 
}

-- To get telescope-menufacture loaded and working with telescope,
-- you need to call load_extension:
require('telescope').load_extension 'menufacture'
EOF
endif
