local mappings = {}
mappings.config = {}

local has_telescope, telescope = pcall(require, 'telescope')
if not has_telescope then
  error 'This extension requires telescope.nvim (https://github.com/nvim-telescope/telescope.nvim)'
end

local action_state = require "telescope.actions.state"
local actions = require "telescope.actions"
local conf = require("telescope.config").values
local finders = require "telescope.finders"
local pickers = require "telescope.pickers"
local previewers = require "telescope.previewers"

-- {{{ function get_menu_keys()
function get_menu_keys()
  local menu_keys = {}
  local n = 0

  order_fn = function(t, a, b)
    return t[b]["priority"] > t[a]["priority"]
  end
  for menu, _ in spairs(vim.g.menus, order_fn) do
    n = n + 1
    menu_keys[n] = {
      descr = nil,
      display = string.upper(menu) .. ":",
      lhs = nil,
      menu = menu,
      ordinal = string.upper(menu) .. ":",
      title = string.upper(menu) .. ":",
      value = nil,
    }

    for _, item in pairs(vim.g.menus[menu]["items"]) do
      if not (item["title"] == "--") then
        n = n + 1
        menu_keys[n] = {
          descr = item["descr"],
          display = item["title"],
          lhs = item["lhs"],
          menu = menu,
          ordinal = item["title"],
          title = item["title"],
          value = nil,
        }
      end
    end
  end

  return menu_keys
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

mappings.mappings = function(opts)
  menu_keys = get_menu_keys()
  opts = opts or {}

  pickers.new(opts, {
    -- {{{ attach_mappings = ...
    attach_mappings = function(_, map)
      actions.select_default:replace(function(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        if not (selection == nil) then
          print(selection.lhs)
        end
      end)
      return true
    end,
    -- }}}
    -- {{{ finder = ...
    finder = finders.new_table {
      entry_maker = function(entry)
        return entry
      end,
      results = menu_keys
    },
    -- }}}
    -- {{{ previewer = ...
    previewer = previewers.new_buffer_previewer {
      define_preview = function(self, entry)
        local lines = {}
        if not (entry.lhs == nil) then
          lines = {
            "Menu:",
            entry.menu,
            "",
            "Description:",
            entry.descr,
            "",
            "Mapping:",
            entry.lhs,
          }
        end
        vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, lines)
      end,
    },
    -- }}}
    -- {{{ sorter = ...
    sorter = conf.generic_sorter(opts),
    -- }}}

    prompt_title = "Mappings",
  }):find()
end

return mappings

-- vim:expandtab sw=2 ts=2
