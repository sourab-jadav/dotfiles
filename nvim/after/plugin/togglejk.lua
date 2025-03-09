-- Initialize a variable to track the mapping state
local mapping_enabled = false

-- Function to toggle the mapping
function toggle_mapping()
    if mapping_enabled then
        -- Remove the mapping
        -- Execute :iunmap commands
        vim.cmd('iunmap jk')
        vim.cmd('iunmap kj')
        print("Mapping disabled")
    else
        -- Set the mapping
        vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('i', 'kj', '<Esc>', { noremap = true, silent = true })
        print("Mapping enabled")
    end
    -- Update the state
    mapping_enabled = not mapping_enabled
end

vim.api.nvim_set_keymap('n', '<Leader>jk', '<Cmd>lua toggle_mapping()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', 'kj', '<Esc>', { noremap = true, silent = true })
