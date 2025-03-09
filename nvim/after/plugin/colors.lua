function ColorMyPencils(color)
    color = color or "gruvbox"
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- Define the two color schemes
vim.cmd('colorscheme gruvbox')
local current_colorscheme = 'gruvbox'

-- Function to toggle between the two color schemes
function ToggleColorscheme()
    if current_colorscheme == 'rose-pine' then
        vim.cmd('colorscheme gruvbox')
        current_colorscheme = 'gruvbox'
        -- ColorMyPencils()
    else
        ColorMyPencils()
        current_colorscheme = 'rose-pine'
    end
end

-- Map a key combination to toggle the color scheme
vim.api.nvim_set_keymap('n', '<F12>', [[:lua ToggleColorscheme()<CR>]], { noremap = true, silent = true })
