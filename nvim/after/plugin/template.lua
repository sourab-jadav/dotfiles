-- Set up an autocmd for .cpp files
vim.cmd([[
    autocmd BufNewFile *.cpp 0r ~/.config/nvim/cpp_template.cpp
]])

