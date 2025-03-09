local markedWinNum = 0

function MarkWindowSwap()
    markedWinNum = vim.fn.winnr()
end

function DoWindowSwap()
    -- Mark destination
    local curNum = vim.fn.winnr()
    local curBuf = vim.fn.bufnr('%')
    vim.cmd(tostring(markedWinNum) .. 'wincmd w')
    -- Switch to source and shuffle dest->source
    local markedBuf = vim.fn.bufnr('%')
    -- Hide and open so that we aren't prompted and keep history
    vim.cmd('hide buf ' .. curBuf)
    -- Switch to dest and shuffle source->dest
    vim.cmd(tostring(curNum) .. 'wincmd w')
    -- Hide and open so that we aren't prompted and keep history
    vim.cmd('hide buf ' .. markedBuf)
end

vim.api.nvim_set_keymap('n', '<leader>mw', [[:lua MarkWindowSwap()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>pw', [[:lua DoWindowSwap()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F10>', [[:wincmd _<Bar>wincmd <Bar><CR>]], { noremap = true, silent = true })
