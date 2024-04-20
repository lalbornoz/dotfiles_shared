--
-- Copyright (c) 2024 Lucía Andrea Illanes Albornoz <lucia@luciaillanes.de>
-- Partially based on vim-quickui code.
--

local menus = {}

local utils = require("roarie-menu.utils")

local M = {}

-- {{{ function menu_get()
function menu_get()
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
		local key_pos = vim.fn.match(menu_.name, "&")
		local key_char = ''
		if key_pos >= 0 then
			key_pos = key_pos + 1
			key_char = menu_.name[key_pos + 1]
		end
		local name = menu_.name:gsub("&", "")
		local w = name:len() + 2

		menu.text = menu.text .. " " .. name .. " " .. "  "
		table.insert(menu.items, {
			items=menu_.items,
			key_char=key_char,
			key_pos=key_pos,
			name=name,
			text=" " .. name .. " ",
			x=x,
			w=w,
		})

		x = x + w + 2
	end
	menu.size = table.getn(menu.items)

	return menu
end
-- }}}
-- {{{ function menu_loop(loop_status, menu, menu_popup, winid)
function menu_loop(loop_status, menu, menu_popup, winid)
	guicursor_old, hl_cursor_old = menu_update(winid, menu.idx, menu.items, menu.size, menu.state)
	vim.cmd [[redraw]]

	local menu_popup_idx = nil

	local rc, code = pcall(vim.fn.getchar)
	if not rc then
		if code == "Keyboard interrupt" then
			code = 3
		else
			error(rc)
		end
	end
	local ch = vim.fn.nr2char(code)

	if (ch == "") or (ch == "") then
		loop_status = false
	elseif code == vim.api.nvim_replace_termcodes('<Left>', true, false, true) then
		if menu.idx > 1 then menu.idx = menu.idx - 1 else menu.idx = menu.size end
		if menu_popup.open then
			menu_popup = utils.popup_menu_close(menu_popup, false)
			_, menu_popup = menu_open(menu, menu_popup)
		else
			menu_popup = utils.popup_menu_close(menu_popup, true)
		end
	elseif code == vim.api.nvim_replace_termcodes('<Right>', true, false, true) then
		if menu.idx < menu.size then menu.idx = menu.idx + 1 else menu.idx = 1 end
		if menu_popup.open then
			menu_popup = utils.popup_menu_close(menu_popup, false)
			_, menu_popup = menu_open(menu, menu_popup)
		else
			menu_popup = utils.popup_menu_close(menu_popup, true)
		end
	elseif (code == vim.api.nvim_replace_termcodes('<Down>', true, false, true))
	    or (ch == " ")
	then
		if menu_popup.open then
			if ch == " " then
				loop_status, menu_popup_idx = false, menu_popup.idx
			else
				menu_select_item({step=-1}, menu, menu_popup)
			end
		else
			_, menu_popup = menu_open(menu, menu_popup)
		end
	elseif code == vim.api.nvim_replace_termcodes('<Up>', true, false, true) then
		if menu_popup.open then
			menu_select_item({step=1}, menu, menu_popup)
		else
			menu_popup = utils.popup_menu_close(menu_popup, true)
		end
	elseif (code == vim.api.nvim_replace_termcodes('<PageDown>', true, false, true))
	    or (code == vim.api.nvim_replace_termcodes('<End>', true, false, true))
	then
		if menu_popup.open then
			menu_select_item({idx=(menu_popup.h - 2)}, menu, menu_popup)
		else
			menu_popup = utils.popup_menu_close(menu_popup, true)
		end

	elseif (code == vim.api.nvim_replace_termcodes('<PageUp>', true, false, true))
	    or (code == vim.api.nvim_replace_termcodes('<Home>', true, false, true))
	then
		if menu_popup.open then
			menu_select_item({idx=1}, menu, menu_popup)
		else
			menu_popup = utils.popup_menu_close(menu_popup, true)
		end
	elseif (ch == "\r") then
		loop_status, menu_popup_idx = false, menu_popup.idx
	end

	vim.o.guicursor = guicursor_old
	vim.api.nvim_set_hl(0, "Cursor", hl_cursor_old)
	return loop_status, nil, menu_popup, menu_popup_idx, winid
end
-- }}}
-- {{{ function menu_open(menu, menu_popup)
function menu_open(menu, menu_popup)
	local textlist = {}
	local w, h = 4, 2

	for _, item in ipairs(menu.items[menu.idx].items) do
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

	for _, item in ipairs(menu.items[menu.idx].items) do
		if item["display"] ~= "--" then
			if string.match(item["display"], "\t") ~= nil then
				local display_ = {unpack(utils.split(item["display"], "[^\t]+"), 1, 2)}
				local spacing = math.max(w - 2 - display_[1]:len() - display_[2]:len() - 2, 3)
				table.insert(textlist, " " .. display_[1] .. string.rep(" ", spacing) .. display_[2] .. " ")
			else
				table.insert(textlist, " " .. item["display"] .. " ")
			end
		else
			table.insert(textlist, "--")
		end
	end

	menu_popup = utils.popup_menu(menu, textlist, w, h, menu_popup)
	return nil, menu_popup
end
-- }}}
-- {{{ function menu_select_item(direction, menu, menu_popup)
function menu_select_item(direction, menu, menu_popup)
	local dirty = false

	if direction.idx ~= nil then
		dirty, menu_popup.idx = true, direction.idx
	elseif direction.step < 0 then
		while menu_popup.idx < (menu_popup.h - 2) do
			dirty, menu_popup.idx = true, menu_popup.idx + 1
			if menu.items[menu.idx].items[menu_popup.idx].title == "--" then
				goto continue
			else
				break
			end
			::continue::
		end
	elseif direction.step > 0 then
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

	if dirty then
		utils.win_execute(
			menu_popup.winid,
			utils.highlight_region(
				'QuickSel',
				menu_popup.idx + 1, 2,
				menu_popup.idx + 1, menu_popup.w,
				1, true), 0)
	end
end
-- }}}
-- {{{ function menu_update(winid, menu_idx, menu_items, menu_size, menu_state)
function menu_update(winid, menu_idx, menu_items, menu_size, menu_state)
	if menu_state == 0 then
		return -1
	end

	local guicursor_old = vim.o.guicursor
	local hl_cursor_old = vim.api.nvim_get_hl(0, {name="Cursor"})
	local cmdlist = {"hi Cursor blend=100", "set guicursor+=a:Cursor/lCursor", "syn clear"}

	for _, item in ipairs(menu_items) do
		if item.key_pos >= 0 then
			local x = item.key_pos + item.x + 1
			local cmd = utils.highlight_region('QuickKey', 1, x, 1, x + 1, 1, false)
			table.insert(cmdlist, cmd[1])
		end
	end

	local idx = menu_idx
	if (idx >= 1) and (idx <= menu_size) then
		local x = menu_items[idx].x + 1
		local e = x + menu_items[idx].w
		local cmd = utils.highlight_region('QuickSel', 1, x, 1, e, 1, false)
		table.insert(cmdlist, cmd[1])
	end

	utils.win_execute(winid, cmdlist, 0)
	return guicursor_old, hl_cursor_old
end
-- }}}

-- {{{ M.InstallMenus = function(menu, items, priority)
M.InstallMenus = function(menu, items, priority)
	menus[priority] = {
		priority=priority,
		items=items,
		name=menu,
	}
end
-- }}}
-- {{{ M.OpenMenu = function()
M.OpenMenu = function()
	local loop_status = true
	local menu = menu_get()
	local menu_popup = utils.popup_menu_init()
	local opts = {
		col=0, row=0,
		focusable=1,
		noautocmd=1,
		relative='editor',
		style='minimal',
		width=vim.o.columns, height=1,
	}

	local bid = utils.buffer_create_scratch("menu", menu.text)
	local winid = vim.api.nvim_open_win(bid, 0, opts)
	vim.api.nvim_win_set_option(winid, 'winhl', 'Normal:' .. 'QuickBG')

	while loop_status do
		loop_status, _, menu_popup, menu_popup_idx, winid =
			menu_loop(loop_status, menu, menu_popup, winid)
	end

	menu_popup = utils.popup_menu_close(menu_popup, true)
	vim.api.nvim_win_close(winid, 0)
	vim.cmd [[redraw | echo "" | redraw]]

	if menu_popup_idx ~= nil then
		vim.fn.feedkeys(vim.api.nvim_replace_termcodes(menu.items[menu.idx].items[menu_popup_idx].lhs, true, true, true))
	end
end
-- }}}
-- {{{ M.ResetMenus = function(menu, items, priority)
M.ResetMenus = function(menu, items, priority)
	menus = {}
end
-- }}}

return M

-- vim:filetype=lua noexpandtab sw=8 ts=8 tw=0
