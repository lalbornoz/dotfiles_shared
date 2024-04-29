--
-- Copyright (c) 2024 Lucía Andrea Illanes Albornoz <lucia@luciaillanes.de>
--

local telescope = require("telescope")
local menufacture = telescope.extensions.menufacture

menufacture.find_files_menu['back...'] =
function(opts, callback)
	callback(opts)
end

menufacture.menu_actions.live_grep_here = {
	action = function(opts, callback)
		menufacture.defaults.live_grep()
	end,
	action_name = "live_grep_here",
	text = 'live grep here...',
}

menufacture.find_files_menu['toggle wrap'] =
function(opts, callback)
	opts.wrap_results = not opts.wrap_results
	callback(opts)
end


menufacture.live_grep_menu['back...'] = menufacture.find_files_menu['back...']
menufacture.find_files_menu["live grep here..."] = menufacture.menu_actions.live_grep_here
menufacture.live_grep_menu["live grep here..."] = menufacture.menu_actions.live_grep_here
menufacture.live_grep_menu['toggle wrap'] = menufacture.find_files_menu['toggle wrap']

-- vim:filetype=lua noexpandtab sw=8 ts=8 tw=0
