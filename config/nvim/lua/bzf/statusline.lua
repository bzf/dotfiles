local M = {}

M.configure = function()
  require('lualine').setup {
    options = {
      theme = 'gruvbox-material',
      icons_enabled = false,
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
    },
    sections = {
      lualine_c = {
        {'filename', path = 1 },
      },
    },
  }
end

return M
