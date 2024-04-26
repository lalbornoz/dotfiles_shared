--
-- Copyright (c) 2024 Lucía Andrea Illanes Albornoz <lucia@luciaillanes.de>
-- Partially based on vim-quickui code.
--

local utils = require("roarie-utils")

local M = {}

-- {{{ M.find = function(key_char, menus)
M.find = function(key_char, menus)
	if key_char ~= nil then
		local found = false
		key_char = string.lower(key_char)
		for idx, item in ipairs(menus.items) do
			if  (item.key_char ~= nil)
			and (string.lower(item.key_char) == key_char)
			then
				found, menus.idx = true, idx
				break
			end
		end
		return found
	else
		return true
	end
end
-- }}}
-- {{{ M.get = function(menus)
M.get = function(menus)
	local menu = {
		idx=1,
		items={},
		size=-1,
		state=1,
		text="",
	}

	order_fn = function(t, a, b)
		return b > a
	end
	local x = 0
	for priority, menu_ in utils.spairs(menus, order_fn) do
		local _, key_char, key_pos = M.get_key(nil, menu_.name, -1)
		local name = menu_.name:gsub("&", "")
		local w = name:len() + 2

		menu.text = menu.text .. " " .. name .. " " .. "  "
		table.insert(menu.items, {
			items=menu_.items,
			key_char=key_char,
			key_pos=key_pos,
			name=name,
			text=" " .. name .. " ",
			x=x, w=w,
		})

		x = x + w + 2
	end
	menu.size = table.getn(menu.items)

	return menu
end
-- }}}
-- {{{ M.get_key = function(cmdlist, display, y)
M.get_key = function(cmdlist, display, y)
	local key_pos = vim.fn.match(display, "&")
	local key_char = nil
	if key_pos >= 0 then
		key_pos = key_pos + 1
		key_char = string.lower(string.sub(display, key_pos + 1, key_pos + 1))
		if cmdlist ~= nil then
			local x = key_pos + 2
			table.insert(cmdlist, utils.highlight_region('QuickKey', y, x, y, x + 1, true))
		end
	end
	return display:gsub("&", ""), key_char, key_pos
end
-- }}}
-- {{{ M.update = function(winid, menu_idx, menu_items, menu_size, menu_state)
M.update = function(winid, menu_idx, menu_items, menu_size, menu_state)
	if menu_state == 0 then
		return -1
	end

	local guicursor_old = vim.o.guicursor
	local hl_cursor_old = vim.api.nvim_get_hl(0, {name="Cursor"})
	local cmdlist = {"hi Cursor blend=100", "set guicursor+=a:Cursor/lCursor", "syn clear"}

	for _, item in ipairs(menu_items) do
		if item.key_pos >= 0 then
			local x = item.key_pos + item.x + 1
			table.insert(cmdlist, utils.highlight_region('QuickKey', 1, x, 1, x + 1, true))
		end
	end

	if (menu_idx >= 1) and (menu_idx <= menu_size) then
		local x0 = menu_items[menu_idx].x + 1
		local x1 = x0 + menu_items[menu_idx].w
		table.insert(cmdlist, utils.highlight_region('QuickSel', 1, x0, 1, x1, true))
	end

	utils.win_execute(winid, cmdlist, 0)
	return guicursor_old, hl_cursor_old
end
-- }}}

return M

-- vim:filetype=lua noexpandtab sw=8 ts=8 tw=0
