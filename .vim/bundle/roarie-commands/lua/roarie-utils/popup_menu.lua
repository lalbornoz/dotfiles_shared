--
-- Copyright (c) 2024 Lucía Andrea Illanes Albornoz <lucia@luciaillanes.de>
-- Partially based on vim-quickui code.
--

local utils = require("roarie-utils")
local utils_buffer = require("roarie-utils.buffer")

local M = {}

-- {{{ function get_dimensions(menus, w, h)
function get_dimensions(menus, w, h)
	for _, item in ipairs(menus.items[menus.idx].items) do
		if item["display"] ~= "--" then
			if string.match(item["display"], "\t") ~= nil then
				local display_ = {unpack(utils.split(item["display"], "[^\t]+"), 1, 2)}
				w = math.max(w, 2 + display_[1]:len() + 3 + display_[2]:len() + 2)
			else
				w = math.max(w, 2 + item["display"]:len() + 2)
			end
		end
		h = h + 1
	end
	return w, h
end
-- }}}
-- {{{ function get_key(cmdlist, display, y)
function get_key(cmdlist, display, y)
	local key_pos = vim.fn.match(display, "&")
	local key_char = nil
	if key_pos >= 0 then
		key_pos = key_pos + 1
		key_char = string.lower(string.sub(display, key_pos + 1, key_pos + 1))
		local x = key_pos + 2
		local cmd = utils.highlight_region('QuickKey', y, x, y, x + 1, 1, false)
		table.insert(cmdlist, cmd[1])
	end
	return display:gsub("&", ""), key_char
end
-- }}}
-- {{{ function add_key(keys, key_char, item_idx)
function add_key(keys, key_char, item_idx)
	if key_char ~= nil then
		if keys[key_char] ~= nil then
			if type(keys[key_char]) ~= "table" then
				keys[key_char] = {keys[key_char]}
			end
			table.insert(keys[key_char], item_idx)
		else
			keys[key_char] = item_idx
		end
	end
end
-- }}}

-- {{{ M.close = function(popup, redraw)
M.close = function(popup, redraw)
	if popup.winid ~= nil then
		vim.api.nvim_win_close(popup.winid, 0)
		popup.winid = nil
		if redraw then
			vim.cmd [[redraw | echo "" | redraw]]
		end
	end
	popup.open = false

	return popup
end
-- }}}
-- {{{ M.init = function()
M.init = function()
	return {
		bid=nil,
		cmdlist={},
		idx=nil,
		idx_max=nil,
		keys={},
		open=nil,
		winid=nil,
		w=nil, h=nil
	}
end
-- }}}
-- {{{ M.open = function(menus, menu_popup, key_char)
M.open = function(menus, menu_popup, key_char)
	local cmdlist = {"syn clear"}
	local keys = {}
	local textlist = {}
	local w, h = 4, 2
	local y = 1

	if not find_menu(key_char, menus) then
		return nil, menu_popup
	else
		w, h = get_dimensions(menus, w, h)
	end

	for item_idx, item in ipairs(menus.items[menus.idx].items) do
		y = y + 1
		if item["display"] ~= "--" then
			if string.match(item["display"], "\t") ~= nil then
				local display = item["display"]
				local key_char = nil
				display, key_char = get_key(cmdlist, display, y)
				local display_ = {unpack(utils.split(display, "[^\t]+"), 1, 2)}
				local spacing = math.max(w - 2 - display_[1]:len() - display_[2]:len() - 2, 3)
				table.insert(textlist, " " .. display_[1]:gsub("&", "") .. string.rep(" ", spacing) .. display_[2] .. " ")
				add_key(keys, key_char, item_idx)
			else
				local display = item["display"]
				local key_char = nil
				display, key_char = get_key(cmdlist, display, y)
				table.insert(textlist, " " .. display .. " ")
				add_key(keys, key_char, item_idx)
			end
		else
			table.insert(textlist, "--")
		end
	end

	local opts = {
		col=menus.items[menus.idx].x, row=1,
		focusable=1,
		noautocmd=1,
		relative='editor',
		style='minimal',
		width=w, height=h,
	}

	menu_popup.cmdlist = cmdlist
	menu_popup.idx, menu_popup.idx_max = 1, h - 2
	menu_popup.keys = keys
	menu_popup.w, menu_popup.h = w, h
	menu_popup = M.close(menu_popup, true)

	textlist = utils_buffer.frame(textlist, w, h, nil)
	menu_popup.bid = utils_buffer.create_scratch("context", textlist)
	menu_popup.winid = vim.api.nvim_open_win(bid, 0, opts)
	vim.api.nvim_set_current_win(menu_popup.winid)

	menu_popup.open = true

	vim.api.nvim_win_set_option(menu_popup.winid, 'winhl', 'Normal:QuickBG')
	utils.win_execute(menu_popup.winid, cmdlist, 0)
	M.select_item({idx=1}, menus, menu_popup)

	return nil, menu_popup
end
-- }}}
-- {{{ M.select_item(direction, menu, menu_popup)
M.select_item = function(direction, menu, menu_popup)
	local dirty = false

	if direction.idx ~= nil then
		dirty, menu_popup.idx = true, direction.idx
	elseif direction.next ~= nil then
		if direction.step < 0 then
			while menu_popup.idx < menu_popup.idx_max do
				if menu.items[menu.idx].items[menu_popup.idx].display == direction.next then
					dirty, menu_popup.idx = true, menu_popup.idx + 1
					break
				else
					dirty, menu_popup.idx = true, menu_popup.idx + 1
				end
			end
		elseif direction.step > 0 then
			while menu_popup.idx > 1 do
				if menu.items[menu.idx].items[menu_popup.idx].display == direction.next then
					dirty, menu_popup.idx = true, menu_popup.idx - 1
					break
				else
					dirty, menu_popup.idx = true, menu_popup.idx - 1
				end
			end
		end
	elseif (direction.step ~= nil) and (direction.step < 0) then
		if menu_popup.idx == 1 then
			dirty, menu_popup.idx = true, menu_popup.idx_max
		else
			while menu_popup.idx > 1 do
				dirty, menu_popup.idx = true, menu_popup.idx - 1
				if menu.items[menu.idx].items[menu_popup.idx].title == "--" then
					goto continue
				else
					break
				end
				::continue::
			end
		end
	elseif (direction.step ~= nil) and (direction.step > 0) then
		if menu_popup.idx == menu_popup.idx_max then
			dirty, menu_popup.idx = true, 1
		else
			while menu_popup.idx < menu_popup.idx_max do
				dirty, menu_popup.idx = true, menu_popup.idx + 1
				if menu.items[menu.idx].items[menu_popup.idx].title == "--" then
					goto continue
				else
					break
				end
				::continue::
			end
		end
	elseif direction.key ~= nil then
		local key = menu_popup.keys[direction.key]
		if key ~= nil then
			if type(key) == "table" then
				dirty, menu_popup.idx = true, utils.array_next(key, menu_popup.idx)
			else
				dirty, menu_popup.idx = true, menu_popup.keys[direction.key]
			end
		end
	end

	if dirty then
		local cmdlist_ = {"syn clear"}
		for _, cmd in ipairs(menu_popup.cmdlist) do
			table.insert(cmdlist_, cmd)
		end
		table.insert(cmdlist_, (utils.highlight_region(
			'QuickSel',
			menu_popup.idx + 1, 2,
			menu_popup.idx + 1, menu_popup.w,
			1, false))[1])
		utils.win_execute(menu_popup.winid, cmdlist_, 0)
	end
end
-- }}}

return M

-- vim:filetype=lua noexpandtab sw=8 ts=8 tw=0
