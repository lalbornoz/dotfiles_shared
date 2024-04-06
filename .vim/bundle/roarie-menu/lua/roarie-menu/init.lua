--
-- Copyright (c) 2024 Lucía Andrea Illanes Albornoz <lucia@luciaillanes.de>
--

local commands = {}
local menus = {}
local mod_order = {
	'',
	'S-',
	'C-',
	'C-S-',
	'M-',
	'M-S-',
	'M-C-',
	'M-C-S-',
}

local fn_tmp_menu = "<Fn>"

local M = {}

-- {{{ function array_to_vim_array(t)
function array_to_vim_array(t)
	local array = '['
	for idx, v in ipairs(t) do
		local v_ = nil
		if type(v) == "number" then
			v_ = v
		elseif type(v) == "string" then
			v_ = "'" .. v .. "'"
		elseif type(v) == "table" then
			v_ = array_to_vim_array(v)
		else
			vim.api.nvim_err_writeln("Unknown type " .. type(v) .. " for item #" .. idx)
		end
		if v_ ~= nil then
			array = array .. v_ .. ', '
		end
	end
	array = array .. ']'
	return array
end
-- }}}
-- {{{ function dict_to_vim_dict(t)
function dict_to_vim_dict(t)
	local dict = '{'
	for k, v in pairs(t) do
		local v_ = nil
		if type(v) == "number" then
			v_ = v
		elseif type(v) == "string" then
			v_ = "'" .. v .. "'"
		elseif type(v) == "table" then
			v_ = array_to_vim_array(v)
		else
			vim.api.nvim_err_writeln("Unknown type " .. type(v) .. " for item: " .. k)
		end
		if v_ ~= nil then
			dict = dict .. "'" .. k .. "'" .. ':' .. v_ .. ', '
		end
	end
	dict = dict .. '}'
	return dict
end
-- }}}
-- {{{ function get_keys(t)
function get_keys(t)
	local keys = {}
	for key, _ in pairs(t) do
		table.insert(keys, key)
	end
	return keys
end
-- }}}
-- {{{ function spairs(t, order)
-- <https://stackoverflow.com/questions/15706270/sort-a-table-in-lua>
function spairs(t, order)
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

-- {{{ function AddMapping_(noaddfl, menu, id, title, mode, descr, silent, lhs, rhs, pseudofl)
function AddMapping_(noaddfl, menu, id, title, mode, descr, silent, lhs, rhs, pseudofl)
	local map_line = {GetMappingMode(mode, lhs)}

	if noaddfl == 0 then
		if descr:len() == 0 then
			descr = title
		end
		local menu_item = {
			descr=descr,
			id=id,
			lhs=lhs,
			menu=menu,
			mode=mode,
			rhs=rhs,
			silent=silent,
			title=title,
		}

		if commands[id] == nil then
			commands[id] = {}
		end

		table.insert(commands[id], menu_item)
		table.insert(menus[menu]['items'], menu_item)
	end

	if pseudofl == "<fnalias>" then
		if menus[fn_tmp_menu] == nil then
			M.AddMenu(fn_tmp_menu, 0, 1)
		end

		AddMapping_(
			noaddfl, fn_tmp_menu, id, title,
			mode, descr, silent, lhs, rhs,
			"<pseudo>")
	end

	if pseudofl ~= "<pseudo>" then
		if silent:len() > 0 then
			table.insert(map_line, '<silent>')
		end

		table.insert(map_line, lhs)
		table.insert(map_line, rhs)
		vim.fn.execute(table.concat(map_line, ' '))
	end
end
-- }}}
-- {{{ function GetMappingMode(mode, lhs)
function GetMappingMode(mode, lhs)
	if mode == "insert" then
		return "inoremap"
	elseif mode == "normal" then
		return "nnoremap"
	elseif mode == "nvo" then
		return "noremap"
	elseif mode == "terminal" then
		return "tnoremap"
	elseif mode == "visual" then
		return "vnoremap"
	else
		vim.api.nvim_err_writeln("Invalid mode " .. mode .. " for mapping: " .. lhs)
	end
end
-- }}}

-- {{{ function PopulateFnMenu(src_items, dst_title, key_to, sep_each)
function PopulateFnMenu(src_items, dst_title, key_to, sep_each)
	local key_last = 0

	for item_idx=1,table.getn(src_items) do
		local item = src_items[item_idx]
		local key_cur = vim.fn.str2nr(vim.fn.matchstr(item["lhs"], '^<\\([MCS]-\\)*F\\zs[0-9]\\+\\ze'))

		if key_cur > key_to then
			if item_idx > 1 then
				for idx=1,item_idx do
					table.remove(src_items, 1)
				end
			end
			break
		else
			if key_last == 0 then
				key_last = key_cur
			elseif (key_cur ~= key_last) and (((key_cur - 1) % sep_each) == 0) then
				key_last = key_cur
				M.AddSeparator(dst_title)
			end
			table.insert(menus[dst_title]["items"], item)
		end
	end
	return src_items
end
-- }}}
-- {{{ function SortFnMenu_(lhs, rhs)
function SortFnMenu_(lhs, rhs)
	local lhs_key = vim.fn.str2nr(vim.fn.matchstr(lhs["lhs"], '^<\\([MCS]-\\)*F\\zs[0-9]\\+\\ze'))
	local rhs_key = vim.fn.str2nr(vim.fn.matchstr(rhs["lhs"], '^<\\([MCS]-\\)*F\\zs[0-9]\\+\\ze'))
	if lhs_key < rhs_key then
		return -1
	elseif lhs_key > rhs_key then
		return 1
	else
		local lhs_mod = vim.fn.matchstr(lhs["lhs"], '^<\\zs\\([MCS-]\\)*\\ze')
		local lhs_priority = vim.fn.index(mod_order, lhs_mod)
		local rhs_mod = vim.fn.matchstr(rhs["lhs"], '^<\\zs\\([MCS-]\\)*\\ze')
		local rhs_priority = vim.fn.index(mod_order, rhs_mod)
		if lhs_priority < rhs_priority then
			return -1
		elseif lhs_priority > rhs_priority then
			return 1
		else
			return 0
		end
	end
end
-- }}}
-- {{{ function SortFnMenu()
function SortFnMenu()
	return vim.fn.sort(menus[fn_tmp_menu]["items"], SortFnMenu_)
end
-- }}}
-- {{{ function SortMenus(lhs, rhs)
function SortMenus(lhs, rhs)
	local lhs_item = menus[lhs]
	local rhs_item = menus[rhs]
	if lhs_item['priority'] < rhs_item['priority'] then
		return -1
	elseif lhs_item['priority'] > rhs_item['priority'] then
		return 1
	else
		return 0
	end
end
-- }}}

-- {{{ M.AddMapping = function(menu, id, title, descr, silent, lhs, rhs, ...)
M.AddMapping = function(menu, id, title, descr, silent, lhs, rhs, pseudofl)
	return AddMapping_(0, menu, id, title, 'nvo', descr, silent, lhs, rhs, pseudofl)
end
-- }}}
-- {{{ M.AddIMapping = function(menu, id, title, descr, silent, lhs, rhs, pseudofl)
M.AddIMapping = function(menu, id, title, descr, silent, lhs, rhs, pseudofl)
	return AddMapping_(0, menu, id, title, 'insert', descr, silent, lhs, rhs, pseudofl)
end
-- }}}
-- {{{ M.AddINVOMapping = function(menu, id, title, descr, silent, lhs, rhs, pseudofl)
M.AddINVOMapping = function(menu, id, title, descr, silent, lhs, rhs, pseudofl)
	AddMapping_(0, menu, id, title, 'nvo', descr, silent, lhs, rhs, pseudofl)
	return AddMapping_(1, menu, id, title, 'insert', descr, silent, lhs, rhs, pseudofl)
end
-- }}}
-- {{{ M.AddNMapping = function(menu, id, title, descr, silent, lhs, rhs, pseudofl)
M.AddNMapping = function(menu, id, title, descr, silent, lhs, rhs, pseudofl)
	return AddMapping_(0, menu, id, title, 'normal', descr, silent, lhs, rhs, pseudofl)
end
-- }}}
-- {{{ M.AddTMapping = function(menu, id, title, descr, silent, lhs, rhs, pseudofl)
M.AddTMapping = function(menu, id, title, descr, silent, lhs, rhs, pseudofl)
	return AddMapping_(0, menu, id, title, 'terminal', descr, silent, lhs, rhs, pseudofl)
end
-- }}}
-- {{{ M.AddVMapping = function(menu, id, title, descr, silent, lhs, rhs, pseudofl)
M.AddVMapping = function(menu, id, title, descr, silent, lhs, rhs, pseudofl)
	return AddMapping_(0, menu, id, title, 'visual', descr, silent, lhs, rhs, pseudofl)
end
-- }}}

-- {{{ M.AddMenu = function(title, priority, ignore_in_palette)
M.AddMenu = function(title, priority, ignore_in_palette)
	menus[title] = {}
	menus[title]['items'] = {}
	menus[title]['priority'] = priority
	menus[title]['ignore_in_palette'] = ignore_in_palette
end
-- }}}
-- {{{ M.AddSeparator = function(menu)
M.AddSeparator = function(menu)
	table.insert(menus[menu]['items'], {
		descr='',
		lhs='',
		rhs='',
		silent='',
		title='--',
	})
end
-- }}}

-- {{{ M.GetMapping = function(menu, id)
M.GetMapping = function(menu, id)
	if commands[id] ~= nil then
		for _, cmd in ipairs(commands[id]) do
			if cmd["menu"] == menu then
				return cmd
			end
		end
	end
	return nil
end
-- }}}
-- {{{ M.GetMenu = function(menu)
M.GetMenu = function(menu)
	return menus[menu]
end
-- }}}
-- {{{ M.GetMenuTitles = function()
M.GetMenuTitles = function()
	order_fn = function(t, a, b)
		return t[b]["priority"] > t[a]["priority"]
	end
	return spairs(menus, order_fn)

end
-- }}}

-- {{{ M.InstallMenus = function()
M.InstallMenus = function()
	vim.fn.execute('call quickui#menu#reset()')
	local menu_keys = vim.fn.sort(get_keys(menus), SortMenus)
	for _, menu in ipairs(menu_keys) do
		local menu_items = {}
		for _, menu_item in ipairs(menus[menu]['items']) do
			local keys = menu_item['lhs']
			keys = vim.fn.substitute(keys, '<Leader>', vim.g.mapleader, '')
			keys = vim.fn.substitute(keys, '<', '\\\\<', '')
			local title = menu_item['title']
			if title ~= "--" then
				title = title .. "\t" .. menu_item['lhs']
			end
			table.insert(menu_items, {title, ':call feedkeys("' .. keys .. '")', ''})
		end
		vim.fn.execute('call quickui#menu#install('
			.. '"' .. menu .. '"' .. ', '
			.. array_to_vim_array(menu_items) .. ', '
			.. menus[menu]['priority']
			.. ')')
	end
end
-- }}}
-- {{{ M.SetupFnMenus = function(ltitle, lpriority, lkey_to, lsep_each)
M.SetupFnMenus = function(ltitle, lpriority, lkey_to, lsep_each)
	local menu_items = SortFnMenu()
	menus[fn_tmp_menu] = nil
	for idx=1,table.getn(lpriority) do
		M.AddMenu(ltitle[idx], lpriority[idx], 1)
		menu_items = PopulateFnMenu(menu_items, ltitle[idx], lkey_to[idx], lsep_each[idx])
	end
end
-- }}}

return M

-- vim:filetype=lua noexpandtab sw=8 ts=8 tw=0
