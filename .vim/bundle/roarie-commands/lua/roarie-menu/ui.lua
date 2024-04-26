--
-- Copyright (c) 2024 Lucía Andrea Illanes Albornoz <lucia@luciaillanes.de>
-- Partially based on vim-quickui code.
--

local menus = {}

local utils = require("roarie-utils")
local utils_buffer = require("roarie-utils.buffer")
local utils_menu = require("roarie-utils.menu")
local utils_popup_menu = require("roarie-utils.popup_menu")

local termcodes = {
	ETX=0x03,
	ESC=0x1b,
	Enter=0x0d,
	Space=0x20,
	Left=vim.api.nvim_replace_termcodes('<Left>', true, false, true),
	Right=vim.api.nvim_replace_termcodes('<Right>', true, false, true),
	Down=vim.api.nvim_replace_termcodes('<Down>', true, false, true),
	Up=vim.api.nvim_replace_termcodes('<Up>', true, false, true),
	PageDown=vim.api.nvim_replace_termcodes('<PageDown>', true, false, true),
	PageUp=vim.api.nvim_replace_termcodes('<PageUp>', true, false, true),
	Home=vim.api.nvim_replace_termcodes('<Home>', true, false, true),
	End=vim.api.nvim_replace_termcodes('<End>', true, false, true),
}

local M = {}

-- {{{ function menu_loop(loop_status, menu, menu_popup, winid)
function menu_loop(loop_status, menu, menu_popup, winid)
	guicursor_old, hl_cursor_old = utils_menu.update(winid, menu.idx, menu.items, menu.size, menu.state)
	vim.cmd [[redraw]]

	print(
		   "<{Esc,C-C}>                                  Exit menu mode\n"
		.. "<{S-[a-z0-9],Down,Space}>, <{Left,Right}>    Open/select menu\n"
		.. "[a-z0-9], <{Page,}Down,Up,Home,End>          Select menu items\n"
		.. "<{Space,Enter}>                              Activate menu item")

	local menu_popup_idx = nil

	local rc, code = pcall(vim.fn.getchar)
	if not rc then
		if code == "Keyboard interrupt" then code = termcodes.ETX else error(rc) end
	end
	local ch = vim.fn.nr2char(code)

	if (code == termcodes.ETX) or (code == termcodes.ESC) then
		loop_status = false
	elseif menu_popup.open
	   and ((ch == " ") or (ch == "\r"))
	then
		loop_status, menu_popup_idx = false, menu_popup.idx
	elseif (ch >= "a") and (ch <= "z") then
		if menu_popup.open then
			utils_popup_menu.select_item({key=ch}, menu, menu_popup)
		end
	elseif ((ch >= "A") and (ch <= "Z"))
	   or  ((ch >= "0") and (ch <= "9")) then
		_, menu_popup = utils_popup_menu.open(menu, menu_popup, string.lower(ch))
	elseif (code == termcodes.Left) or (code == termcodes.Right) then
		if code == termcodes.Left then
			if menu.idx > 1 then menu.idx = menu.idx - 1 else menu.idx = menu.size end
		else
			if menu.idx < menu.size then menu.idx = menu.idx + 1 else menu.idx = 1 end
		end

		if menu_popup.open then
			menu_popup = utils_popup_menu.close(menu_popup, false)
			_, menu_popup = utils_popup_menu.open(menu, menu_popup, nil)
		else
			menu_popup = utils_popup_menu.close(menu_popup, true)
		end
	elseif (code == termcodes.Down) or (code == termcodes.Up) or (code == termcodes.Space) then
		if menu_popup.open then
			if code == termcodes.Down then
				utils_popup_menu.select_item({step=1}, menu, menu_popup)
			else
				utils_popup_menu.select_item({step=-1}, menu, menu_popup)
			end
		elseif (code == termcodes.Down) or (code == termcodes.Space) then
			_, menu_popup = utils_popup_menu.open(menu, menu_popup, nil)
		end
	elseif menu_popup.open and (code == termcodes.PageDown) then
		utils_popup_menu.select_item({next="--", step=-1}, menu, menu_popup)
	elseif menu_popup.open and (code == termcodes.PageUp) then
		utils_popup_menu.select_item({next="--", step=1}, menu, menu_popup)
	elseif menu_popup.open and (code == termcodes.Home) then
		utils_popup_menu.select_item({idx=1}, menu, menu_popup)
	elseif menu_popup.open and (code == termcodes.End) then
		utils_popup_menu.select_item({idx=(menu_popup.h - 2)}, menu, menu_popup)
	end

	vim.o.guicursor = guicursor_old
	vim.api.nvim_set_hl(0, "Cursor", hl_cursor_old)
	return loop_status, nil, menu_popup, menu_popup_idx, winid
end
-- }}}

-- {{{ M.Install = function(menu, items, priority)
M.Install = function(menu, items, priority)
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
	local menu = utils_menu.get(menus)
	local menu_popup = utils_popup_menu.init()
	local opts = {
		col=0, row=0,
		focusable=1,
		noautocmd=1,
		relative='editor',
		style='minimal',
		width=vim.o.columns, height=1,
	}

	local bid = utils_buffer.create_scratch("menu", menu.text)
	local winid = vim.api.nvim_open_win(bid, 0, opts)
	vim.api.nvim_win_set_option(winid, 'winhl', 'Normal:' .. 'QuickBG')

	while loop_status do
		loop_status, _, menu_popup, menu_popup_idx, winid =
			menu_loop(loop_status, menu, menu_popup, winid)
	end

	menu_popup = utils_popup_menu.close(menu_popup, true)
	vim.api.nvim_win_close(winid, 0)
	vim.cmd [[redraw | echo "" | redraw]]

	if menu_popup_idx ~= nil then
		vim.fn.feedkeys(vim.api.nvim_replace_termcodes(menu.items[menu.idx].items[menu_popup_idx].lhs, true, true, true))
	end
end
-- }}}
-- {{{ M.Reset = function(menu, items, priority)
M.Reset = function(menu, items, priority)
	menus = {}
end
-- }}}

vim.cmd [[
	hi! QuickBG	ctermfg=251 ctermbg=236 guifg=#c6c6c6 guibg=#303030
	hi! QuickSel	ctermfg=236 ctermbg=251 guifg=#303030 guibg=#c6c6c6
	hi! QuickKey	term=bold ctermfg=179 gui=bold guifg=#d7af5f
]]

return M

-- vim:filetype=lua noexpandtab sw=8 ts=8 tw=0
