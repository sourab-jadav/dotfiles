
vim.api.nvim_exec([[
  autocmd BufWinLeave *.cpp mkview
  autocmd BufWinEnter *.cpp silent! loadview
]], false)
