-- C/C++
vim.g.runner_c_compiler = 'gcc'
vim.g.runner_cpp_compiler = 'g++'
vim.g.runner_c_options = '-std=c99 -Wall'
vim.g.runner_cpp_options = '-std=c++11 -Wall'

-- Python
-- vim.g.runner_python_ex = 'python3'
-- vim.g.runner_python_options = ''
-- vim.api.nvim_set_keymap('n', '<leader>rn', [[:lua if vim.bo.filetype == 'cpp' or vim.bo.filetype=='c' or vim.bo.filetype=='python' then vim.cmd(':NeoRunner') end<CR>]], { noremap = true, silent = true })




