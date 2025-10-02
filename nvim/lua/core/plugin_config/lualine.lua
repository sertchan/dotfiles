local custom_auto = require('lualine.themes.auto')

local modes = { 'normal', 'inactive' }
local bg_color = '#00000000'

for _, mode in ipairs(modes) do
      custom_auto[mode].c.bg = bg_color
end

require('lualine').setup {
    options = {
        section_separators = '',
        component_separators = '',
        icons_enabled = true,
        theme = custom_auto
    }
}

