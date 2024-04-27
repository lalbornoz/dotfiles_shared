--
-- Copyright (c) 2024 Lucía Andrea Illanes Albornoz <lucia@luciaillanes.de>
-- Partially based on vim-quickui code.
--

local menus = {}

local utils = require("roarie-utils")
local utils_buffer = require("roarie-utils.buffer")
local utils_menu = require("roarie-utils.menu")
local utils_popup_menu = require("roarie-utils.popup_menu")

local M = {}

-- {{{ function menu_help()
function menu_help()
	print(
		   "<{Esc,C-C}>                                  Exit menu mode\n"
		.. "<{S-[a-z0-9],Down,Space}>, <{Left,Right}>    Open/select menu\n"
		.. "[a-z0-9], <{Page,}Down,Up,Home,End>          Select menu items\n"
		.. "<{Space,Enter}>                              Activate menu item\n")
	vim.cmd [[redraw]]
end
-- }}}
-- {{{ function menu_loop(loop_status, menu, menu_popup, winid)
function menu_loop(loop_status, menu, menu_popup)
	guicursor_old, hl_cursor_old = utils_menu.update(menu)
	vim.cmd [[redraw]]

	local menu_popup_idx = nil
	local code, ch = utils.getchar()

	-- {{{ if (code == utils.termcodes.ETX) or (code == utils.termcodes.ESC) then
	if (code == utils.termcodes.ETX) or (code == utils.termcodes.ESC) then
		loop_status = false
	-- }}}
	-- {{{ elseif (ch == "?") then
	elseif (ch == "?") then
		menu_help()
	-- }}}
	-- {{{ elseif ((ch == " ") or (ch == "\r")) ...
	elseif ((ch == " ") or (ch == "\r"))
	   and menu_popup.open
	then
		loop_status, menu_popup_idx = false, menu_popup.idx
	-- }}}
	-- {{{ elseif (ch >= "a") and (ch <= "z") then
	elseif (ch >= "a") and (ch <= "z") then
		if menu_popup.open then
			utils_popup_menu.select_item_key(ch, menu, menu_popup)
		end
	-- }}}
	-- {{{ elseif ((ch >= "A") and (ch <= "Z")) ...
	elseif ((ch >= "A") and (ch <= "Z"))
	   or  ((ch >= "0") and (ch <= "9")) then
		menu_popup = utils_popup_menu.open(menu, menu_popup, string.lower(ch))
	-- }}}
	-- {{{ elseif (code == utils.termcodes.Left) or (code == utils.termcodes.Right) then
	elseif (code == utils.termcodes.Left) or (code == utils.termcodes.Right) then
		if code == utils.termcodes.Left then
			if menu.idx > 1 then menu.idx = menu.idx - 1 else menu.idx = menu.size end
		else
			if menu.idx < menu.size then menu.idx = menu.idx + 1 else menu.idx = 1 end
		end

		if menu_popup.open then
			menu_popup = utils_popup_menu.close(menu_popup, false)
			menu_popup = utils_popup_menu.open(menu, menu_popup, nil)
		else
			menu_popup = utils_popup_menu.close(menu_popup, true)
		end
	-- }}}
	-- {{{ elseif (code == utils.termcodes.Down) or (code == utils.termcodes.Up) or (code == utils.termcodes.Space) then
	elseif (code == utils.termcodes.Down) or (code == utils.termcodes.Up) or (code == utils.termcodes.Space) then
		if menu_popup.open then
			if code == utils.termcodes.Down then
				utils_popup_menu.select_item_step(1, menu, menu_popup)
			else
				utils_popup_menu.select_item_step(-1, menu, menu_popup)
			end
		elseif (code == utils.termcodes.Down) or (code == utils.termcodes.Space) then
			menu_popup = utils_popup_menu.open(menu, menu_popup, nil)
		end
	-- }}}
	-- {{{ elseif menu_popup.open and (code == utils.termcodes.Page{Down,Up}) then
	elseif menu_popup.open and (code == utils.termcodes.PageDown) then
		utils_popup_menu.select_item_after("--", -1, menu, menu_popup)
	elseif menu_popup.open and (code == utils.termcodes.PageUp) then
		utils_popup_menu.select_item_after("--", 1, menu, menu_popup)
	-- }}}
	-- {{{ elseif menu_popup.open and (code == utils.termcodes.{Home,End}) then
	elseif menu_popup.open and (code == utils.termcodes.Home) then
		utils_popup_menu.select_item_idx(1, menu, menu_popup)
	elseif menu_popup.open and (code == utils.termcodes.End) then
		utils_popup_menu.select_item_idx(menu_popup.idx_max, menu, menu_popup)
	-- }}}
	end

	vim.o.guicursor = guicursor_old
	vim.api.nvim_set_hl(0, "Cursor", hl_cursor_old)
	return loop_status, menu_popup_idx
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
	local menu, menu_popup = utils_menu.init(menus), utils_popup_menu.init()
	local opts = {
		col=0, row=0,
		focusable=1,
		noautocmd=1,
		relative='editor',
		style='minimal',
		width=vim.o.columns, height=1,
	}

	local bid = utils_buffer.create_scratch("menu", menu.text)
	menu.winid = vim.api.nvim_open_win(bid, 0, opts)
	vim.api.nvim_win_set_option(menu.winid, 'winhl', 'Normal:' .. 'QuickBG')

	while loop_status do
		loop_status, menu_popup_idx = menu_loop(loop_status, menu, menu_popup)
	end

	menu_popup = utils_popup_menu.close(menu_popup, true)
	vim.api.nvim_win_close(menu.winid, 0)
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
