local opt = vim.opt

-- not using any python plugins, checking for this is slow
vim.g.loaded_python3_provider = 0

vim.o.winborder = "rounded"

-- line numbers
opt.number = true
opt.relativenumber = true

-- Indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true
opt.autoindent = true

opt.wrap = false

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- Random
-- opt.cmdheight = 2
opt.showmode = false
opt.signcolumn = "yes"

opt.termguicolors = true

opt.updatetime = 50

opt.swapfile = false
opt.undofile = true
opt.cursorline = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.confirm = true

opt.splitright = true
