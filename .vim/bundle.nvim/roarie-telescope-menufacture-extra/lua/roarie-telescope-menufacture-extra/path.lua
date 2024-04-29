--
-- Copyright (c) 2024 Lucía Andrea Illanes Albornoz <lucia@luciaillanes.de>
--

local telescope = require("telescope")
local conf = require("telescope.config").values
local menufacture = telescope.extensions.menufacture

menufacture.menu_actions.decrease_maximum_depth = {
	action = function(opts, callback)
		if opts.max_depth == nil then
			opts.max_depth = menufacture.config.max_depth_initial
		else
			if opts.max_depth > 1 then
				opts.max_depth = opts.max_depth - 1
			end
		end
		print("New maximum depth: " .. opts.max_depth)
		update_find_command(opts, "--max-depth=" .. opts.max_depth, "max_depth", '^--max%-depth=%d+$', (opts.max_depth ~= nil))
		callback(opts)
	end,
	action_name = "decrease_maximum_depth",
	text = 'decrease maximum depth',
}

menufacture.menu_actions.increase_maximum_depth = {
	action = function(opts, callback)
		if opts.max_depth == nil then
			opts.max_depth = menufacture.config.max_depth_initial
		else
			opts.max_depth = opts.max_depth + 1
		end
		print("New maximum depth: " .. opts.max_depth)
		update_find_command(opts, "--max-depth=" .. opts.max_depth, "max_depth", '^--max%-depth=%d+$', (opts.max_depth ~= nil))
		callback(opts)
	end,
	action_name = "increase_maximum_depth",
	text = 'increase maximum depth',
}

menufacture.menu_actions.decrease_path_shorten = {
	action = function(opts, callback)
		if conf.path_display.shorten > 1 then
			conf.path_display.shorten = conf.path_display.shorten - 1
		end
		callback(opts)
	end,
	action_name = "decrease_path_shorten",
	text = 'decrease path shorten',
}

menufacture.menu_actions.increase_path_shorten = {
	action = function(opts, callback)
		conf.path_display.shorten = conf.path_display.shorten + 1
		callback(opts)
	end,
	action_name = "increase_path_shorten",
	text = 'increase path shorten',
}

menufacture.find_files_menu['set maximum depth'] =
function(opts, callback)
	menufacture.input("max_depth", "Maximum directory depth: ")(opts, function(opts, callback) end)
	update_find_command(opts, "--max-depth=" .. opts.max_depth, "max_depth", '^--max%-depth=%d+$', (opts.max_depth ~= nil))
	callback(opts)
end

menufacture.live_grep_menu['set maximum depth'] =
function(opts, callback)
	menufacture.input("max_depth", "Maximum directory depth: ")(opts, function(opts, callback) end)
	update_additional_args(opts, "--max-depth=" .. opts.max_depth, '^--max%-depth=%d+$', (opts.max_depth ~= nil))
	callback(opts)
end

menufacture.find_files_menu['toggle hidden'] =
function(opts, callback)
	menufacture.toggle("hidden")(opts, function(opts, callback) end)
	update_find_command(opts, "--hidden", "hidden", '^--hidden$', (opts.hidden))
	callback(opts)
end

menufacture.live_grep_menu['toggle hidden'] =
function(opts, callback)
	opts.hidden = not opts.hidden
	update_additional_args(opts, "--hidden", '^--hidden$', (opts.hidden))
	callback(opts)
end


menufacture.find_files_menu["decrease maximum depth"] = menufacture.menu_actions.decrease_maximum_depth
menufacture.find_files_menu["increase maximum depth"] = menufacture.menu_actions.increase_maximum_depth
menufacture.find_files_menu["decrease path shorten"] = menufacture.menu_actions.decrease_path_shorten
menufacture.find_files_menu["increase path shorten"] = menufacture.menu_actions.increase_path_shorten

-- vim:filetype=lua noexpandtab sw=8 ts=8 tw=0
