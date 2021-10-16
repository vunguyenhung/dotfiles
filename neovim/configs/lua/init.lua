-- Lualine
local lualine = require 'lualine'
local config = {
  options = {
    theme = 'tokyonight'
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', {"diagnostics", sources = {"nvim_lsp"}}},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
}

lualine.setup(config)

-- gitsigns
require('gitsigns').setup()

-- nvim-tree
require('nvim-tree').setup {
  auto_close = true,
  open_on_tab = true
}

