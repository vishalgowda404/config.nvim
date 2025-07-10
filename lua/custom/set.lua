vim.opt.guicursor = ''

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 25
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append '@-@'

vim.opt.updatetime = 50

vim.opt.colorcolumn = '80'

-- set background transparent
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5

-- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
-- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
vim.opt.foldlevelstart = 99
