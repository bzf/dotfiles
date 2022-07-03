local M = {}

M.configure = function()
  require('lualine').setup {
    options = {
      theme = 'gruvbox-material',
      icons_enabled = false,
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
    },
  }
end

return M
