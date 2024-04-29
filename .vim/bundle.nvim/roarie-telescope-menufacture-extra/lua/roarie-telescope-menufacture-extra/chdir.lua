--
-- Copyright (c) 2024 Lucía Andrea Illanes Albornoz <lucia@luciaillanes.de>
--

local telescope = require("telescope")
local menufacture = telescope.extensions.menufacture
local action_state = require("telescope.actions.state")
local actions = require("telescope.actions")
local conf = require("telescope.config").values
local pickers = require("telescope.pickers")

menufacture.find_files_menu['change directory'] =
function(opts, callback)
	pickers.new({}, {
		prompt_title = 'select directory',
		finder = menufacture.folder_finder(opts),
		sorter = conf.generic_sorter {},
		attach_mappings = function(prompt_bufnr, _)
			actions.select_default:replace(function()
				local entry = action_state.get_selected_entry()
				vim.fn.chdir(entry.path or entry.filename or entry.value)
				actions.close(prompt_bufnr)
				prepare_find_command(opts, false)
				callback(opts)
			end)
			return true
		end,
	})
	:find()
	return opts
end

menufacture.menu_actions.change_into_directory = {
	action = function(opts, callback)
		local entry, dname = action_state.get_selected_entry(), nil
		if (entry ~= nil) and (entry[1] ~= nil) then
			entry = entry[1]
			if (entry == ".") or (entry == "..") then
				dname = entry
			else
				dname = entry:gsub('/.*$', '')
				if (dname:len() == 0) or (entry == dname) then
					dname = nil
				end
			end
			if dname ~= nil then
				vim.fn.chdir(dname)
			end
		end
		callback(opts)
	end,
	action_name = "change_into_directory",
	text = 'change into directory',
}

menufacture.menu_actions.change_into_parent_directory = {
	action = function(opts, callback)
		vim.fn.chdir("..")
		callback(opts)
	end,
	action_name = "change_into_parent_directory",
	text = 'change into parent directory',
}


menufacture.live_grep_menu['change directory'] = menufacture.find_files_menu['change directory']
menufacture.find_files_menu["change into directory"] = menufacture.menu_actions.change_into_directory
menufacture.live_grep_menu["change into directory"] = menufacture.menu_actions.change_into_directory
menufacture.find_files_menu["change into parent directory"] = menufacture.menu_actions.change_into_parent_directory
menufacture.live_grep_menu["change into parent directory"] = menufacture.menu_actions.change_into_parent_directory

-- vim:filetype=lua noexpandtab sw=8 ts=8 tw=0
