function DiffWithSaved()
    local filetype = vim.bo.filetype
    vim.fn.diffthis()
    vim.cmd('vnew | r# | normal! 1Gdd')
    vim.fn.diffthis()
    vim.cmd('setlocal bt=nofile bh=wipe nobl noswf ro ft=' .. filetype)
end

vim.api.nvim_set_keymap('n', '<Leader>ds', [[:lua DiffWithSaved()<CR>]], { noremap = true, silent = true })

