local mappings = require('mappings')

return require('telescope').register_extension {
  exports = {
    mappings = mappings.mappings
  },

  setup = function(ext_config, _config)
    for k, v in pairs(ext_config) do
      mappings.config[k] = v
    end
  end,
}

-- vim:expandtab sw=2 ts=2
