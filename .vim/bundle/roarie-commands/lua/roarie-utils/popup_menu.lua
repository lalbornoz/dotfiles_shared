--
-- Copyright (c) 2024 Lucía Andrea Illanes Albornoz <lucia@luciaillanes.de>
-- Partially based on vim-quickui code.
--

local utils = require("roarie-utils")
local utils_buffer = require("roarie-utils.buffer")

local M = {}

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
		idx=nil,
		open=nil,
		winid=nil,
		w=nil, h=nil
	}
end
-- }}}
-- {{{ M.open = function(menu, textlist, w, h, popup)
M.open = function(menu, textlist, w, h, popup)
	local opts = {
		col=menu.items[menu.idx].x, row=1,
		focusable=1,
		noautocmd=1,
		relative='editor',
		style='minimal',
		width=w, height=h,
	}

	popup.idx = 1
	popup.w, popup.h = w, h
	popup = M.close(popup, true)

	textlist = utils_buffer.frame(textlist, w, h, nil)
	popup.bid = utils_buffer.create_scratch("context", textlist)
	popup.winid = vim.api.nvim_open_win(bid, 0, opts)
	vim.api.nvim_set_current_win(popup.winid)

	popup.open = true

	vim.api.nvim_win_set_option(popup.winid, 'winhl', 'Normal:QuickBG')
	utils.win_execute(popup.winid, utils.highlight_region('QuickSel', 2, 2, 2, w, 1, true), 0)

	return popup
end
-- }}}
-- {{{ M.select_item(direction, menu, menu_popup)
M.select_item = function(direction, menu, menu_popup)
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

return M

-- vim:filetype=lua noexpandtab sw=8 ts=8 tw=0
