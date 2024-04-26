--
-- Copyright (c) 2024 Lucía Andrea Illanes Albornoz <lucia@luciaillanes.de>
-- Partially based on vim-quickui code.
--

local M = {}

-- {{{ M.get_keys = function(t)
M.get_keys = function(t)
	local keys = {}
	for key, _ in pairs(t) do
		table.insert(keys, key)
	end
	return keys
end
-- }}}
-- {{{ M.serialise_table = function(val, name, skipnewlines, depth)
-- <https://stackoverflow.com/questions/6075262/lua-table-tostringtablename-and-table-fromstringstringtable-functions>
M.serialise_table = function(val, name, skipnewlines, depth)
	skipnewlines = skipnewlines or false
	depth = depth or 0

	local tmp = string.rep(" ", depth)

	if name then tmp = tmp .. name .. " = " end

	if type(val) == "table" then
		tmp = tmp .. "{" .. (not skipnewlines and "\n" or "")

		for k, v in pairs(val) do
			tmp =  tmp .. M.serialise_table(v, k, skipnewlines, depth + 1) .. "," .. (not skipnewlines and "\n" or "")
		end

		tmp = tmp .. string.rep(" ", depth) .. "}"
	elseif type(val) == "number" then
		tmp = tmp .. tostring(val)
	elseif type(val) == "string" then
		tmp = tmp .. string.format("%q", val)
	elseif type(val) == "boolean" then
		tmp = tmp .. (val and "true" or "false")
	else
		tmp = tmp .. "\"[inserializeable datatype:" .. type(val) .. "]\""
	end

	return tmp
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
-- {{{ M.array_next = function(array, idx_cur)
M.array_next = function(array, value)
	local array_len = table.getn(array)
	for idx, value_cur in ipairs(array) do
		if value_cur == value then
			if (idx + 1) <= array_len then
				return array[(idx + 1)]
			else
				return array[1]
			end
		end
	end
	return array[1]
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
