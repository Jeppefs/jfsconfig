-- load all plugins
require "pluginList"
require "options"
require "plugins.bufferline"

local g = vim.g

vim.cmd("nnoremap <SPACE> <Nop>")
g.mapleader = " "
g.auto_save = false

-- colorscheme related stuff

g.nvchad_theme = "onedark"
local base16 = require "base16"
base16(base16.themes["onedark"], true)  

-- g.nvchad_theme = "gruvbox"
-- local base16 = require "base16"
-- base16(base16.themes["nvchad-softgruv"], true)

require "highlights"
require "mappings"

require("utils").hideStuff()
