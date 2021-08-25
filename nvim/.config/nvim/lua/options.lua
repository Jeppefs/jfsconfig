local opt = vim.opt

opt.ruler = false
opt.hidden = true
opt.ignorecase = true
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.cul = true
opt.mouse = "a"
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.updatetime = 250 -- update interval for gitsigns
opt.timeoutlen = 2000
opt.clipboard = "unnamedplus"

-- Numbers
opt.number = true
opt.numberwidth = 2
-- opt.relativenumber = true

-- for indenline
vim.cmd("set noexpandtab")
opt.tabstop = 4
opt.shiftwidth = 4
opt.smartindent = true
opt.list = true
vim.cmd("set listchars=tab:>-,trail:~")
-- vim.cmd("set listchars=tab:>-")
-- vim.cmd("set listchars=tab:>\ ,trail:- list")
-- vim.cmd("set list")
-- vim.cmd(":set listchars tab:>-<CR>")
-- opt.listchars = tab:▸·
-- opt.listchars = eol:c

-- disable builtin vim plugins
vim.g.loaded_gzip = 0
vim.g.loaded_tar = 0
vim.g.loaded_tarPlugin = 0
vim.g.loaded_zipPlugin = 0
vim.g.loaded_2html_plugin = 0
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0
vim.g.loaded_matchit = 0
vim.g.loaded_matchparen = 0
vim.g.loaded_spec = 0

-- vim.cmd(":command XRemoveWhiteSpace :%s/\s\+$//e")

local M = {}

function M.is_buffer_empty()
    -- Check whether the current buffer is empty
    return vim.fn.empty(vim.fn.expand("%:t")) == 1
end

function M.has_width_gt(cols)
    -- Check if the windows width is greater than a given number of columns
    return vim.fn.winwidth(0) / 2 > cols
end

-- file extension specific tabbing
-- vim.cmd([[autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4]])

return M
