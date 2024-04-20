--
-- Copyright (c) 2024 Lucía Andrea Illanes Albornoz <lucia@luciaillanes.de>
-- Partially based on vim-quickui code.
--

local border_chars_default = {'┌', '─', '┐', '│', '─', '│', '└', '─', '┘', '├', '┤'}

local buffer_array = {}
local buffer_cache = {}

local M = {}

-- {{{ M.buffer_alloc = function()
M.buffer_alloc = function()
	local idx = table.getn(buffer_array)
	if idx > 0 then
		bid = buffer_array[idx]
		table.remove(buffer_array, idx)
	else
		bid = vim.api.nvim_create_buf(false, true)
		vim.fn.setbufvar(bid, '&bufhidden',	'hide')
		vim.fn.setbufvar(bid, '&buftype',	'nofile')
		vim.fn.setbufvar(bid, 'noswapfile',	1)
	end
	vim.fn.setbufvar(bid, '&filetype',	'')
	vim.fn.execute("silent call deletebufline(" .. bid .. ", 1, '$')")
	vim.fn.setbufvar(bid, '&modifiable',	1)
	vim.fn.setbufvar(bid, '&modified',	0)
	return bid
end
-- }}}
-- {{{ M.buffer_create_scratch = function(name, textlist)
M.buffer_create_scratch = function(name, textlist)
	local bid = -1
	if (name ~= "") and (buffer_cache[name] ~= nil) then
		bid = buffer_cache[name]
	end
	if bid == -1 then
		bid = M.buffer_alloc()
		if name ~= "" then
			buffer_cache[name] = bid
		end
	end
	M.buffer_update(bid, textlist)
	vim.fn.setbufvar(bid, 'current_syntax', '')
	return bid
end
-- }}}
-- {{{ M.buffer_frame = function(str, w, h, chars)
M.buffer_frame = function(str, w, h, chars)
	local str_ = {}
	if chars == nil then
		chars = border_chars_default
	end

	str_[1] = chars[1] .. string.rep(chars[2], w - 2) .. chars[3]
	for y=2,(h - 1) do
		local line = str[y - 1]
		local is_sep = false
		if line == nil then
			line = ""
		elseif string.sub(line, 1, (w - 2)) == "--" then
			is_sep = true
			line = string.rep(chars[5], (w - 2))
		end
		if (not is_sep) and (line:len() < (w - 2)) then
			line = line .. string.rep(" ", (w - line:len() - 2))
		elseif (not is_sep) and (line:len() > (w - 2)) then
			line = string.sub(line, 1, (w - 2))
		end
		if not is_sep then
			str_[y] = chars[4] .. line .. chars[6]
		else
			str_[y] = chars[10] .. line .. chars[11]
		end
	end
	str_[h] = chars[7] .. string.rep(chars[8], w - 2) .. chars[9]

	return str_
end
-- }}}
-- {{{ M.buffer_free = function()
M.buffer_free = function(bid)
	local idx = table.getn(buffer_array) + 1
	buffer_array[idx] = bid
	vim.fn.setbufvar(bid, '&modifiable',	1)
	vim.fn.execute("silent call deletebufline(" .. bid .. ", 1, '$')")
	vim.fn.setbufvar(bid, '&modified',	0)
end
-- }}}
-- {{{ M.buffer_update = function(bid, textlist)
M.buffer_update = function(bid, textlist)
	if type(textlist) == "string" then
		local textlist_ = {}
		for line in string.gmatch(textlist, "[^\n]+") do
			table.insert(textlist_, line)
		end
		textlist = textlist_
	end
	vim.fn.setbufvar(bid, '&modifiable', 1)
	vim.fn.execute("silent call deletebufline(" .. bid .. ", 1, '$')")
	vim.fn.setbufline(bid, 1, textlist)
	vim.fn.setbufvar(bid, '&modified', 0)
end
-- }}}

-- {{{ M.get_keys = function(t)
M.get_keys = function(t)
	local keys = {}
	for key, _ in pairs(t) do
		table.insert(keys, key)
	end
	return keys
end
-- }}}
-- {{{ M.spairs = function(t, order)
-- <https://stackoverflow.com/questions/15706270/sort-a-table-in-lua>
M.spairs = function(t, order)
  -- collect the keys
  local keys = {}
  for k in pairs(t) do keys[#keys+1] = k end

  -- if order function given, sort by it by passing the table and keys a, b,
  -- otherwise just sort the keys
  if order then
    table.sort(keys, function(a,b) return order(t, a, b) end)
  else
    table.sort(keys)
  end

  -- return the iterator function
  local i = 0
  return function()
    i = i + 1
    if keys[i] then
      return keys[i], t[keys[i]]
    end
  end
end
-- }}}
-- {{{ M.split = function(str, pattern)
M.split = function(str, pattern)
	local list = {}
	for str_ in string.gmatch(str, pattern) do
		table.insert(list, str_)
	end
	return list
end
-- }}}
-- {{{ M.to_title(str)
M.to_title = function(str)
  return (str:gsub("^%l", string.upper))
end
-- }}}

-- {{{ M.highlight_region = function(name, srow, scol, erow, ecol, virtual, clear_syn)
M.highlight_region = function(name, srow, scol, erow, ecol, virtual, clear_syn)
	local sep = ''
	if virtual == 0 then
		sep = 'c'
	else
		sep = 'v'
	end
	local cmd = 'syn region ' .. name .. ' '
	cmd = cmd .. ' start=/\\%' .. srow .. 'l\\%' .. scol .. sep .. '/'
	cmd = cmd .. ' end=/\\%' .. erow .. 'l\\%' .. ecol .. sep .. '/'
	if clear_syn then
		return {"syn clear", cmd}
	else
		return {cmd}
	end
end
-- }}}

-- {{{ M.popup_menu = function(menu, textlist, w, h, popup)
M.popup_menu = function(menu, textlist, w, h, popup)
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
	popup = M.popup_menu_close(popup, true)

	textlist = M.buffer_frame(textlist, w, h, nil)
	popup.bid = M.buffer_create_scratch("context", textlist)
	popup.winid = vim.api.nvim_open_win(bid, 0, opts)
	vim.api.nvim_set_current_win(popup.winid)

	popup.open = true

	vim.api.nvim_win_set_option(popup.winid, 'winhl', 'Normal:QuickBG')
	M.win_execute(popup.winid, M.highlight_region('QuickSel', 2, 2, 2, w, 1, true), 0)

	return popup
end
-- }}}
-- {{{ M.popup_menu_close = function(popup, redraw)
M.popup_menu_close = function(popup, redraw)
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
-- {{{ M.popup_menu_init = function()
M.popup_menu_init = function()
	return {bid=nil, idx=nil, open=nil, winid=nil, w=nil, h=nil}
end
-- }}}

-- {{{ M.win_execute = function(winid, command, silent)
M.win_execute = function(winid, command, silent)
	local current = vim.api.nvim_get_current_win()
	vim.cmd("keepalt call nvim_set_current_win(" .. winid .. ")")
	if type(command) == "string" then
		if silent == 0 then
			vim.fn.execute(command)
		else
			vim.cmd("silent exec " .. command)
		end
	elseif type(command) == "table" then
		if silent == 0 then
			vim.fn.execute(table.concat(command, "\n"))
		else
			vim.cmd("silent exec " .. table.concat(command, "\n"))
		end
	end
	vim.cmd("keepalt call nvim_set_current_win(" .. current .. ")")
end
-- }}}

return M

-- vim:filetype=lua noexpandtab sw=8 ts=8 tw=0
