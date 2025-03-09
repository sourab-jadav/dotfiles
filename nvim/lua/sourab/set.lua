vim.opt.guicursor = ""
vim.opt.ignorecase=true
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
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.cursorline=false
-- Disable automatic commenting, wrapping, and insertion of comment leader
-- vim.opt.formatoptions:remove({"c", "r", "o"})
-- Apply the formatoptions setting to all file types
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8  --maintains 8 lines below while scrolling
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.colorcolumn = "90"
-- Create a command to execute :sp | term
vim.cmd("command! -nargs=0 Str execute 'sp | term'")
vim.g.AutoPairsFlyMode = 1
-- copilot
vim.g.copilot_enabled = 0 -- cpp lsp is not working properly when the copilot is turned on 
-- vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
-- vim.opt.foldtext = "v:lua.vim.treesitter.foldtext()"
-- vim.opt.foldlevel = 99
-- vim.opt.foldenable = true
