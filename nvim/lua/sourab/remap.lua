vim.g.mapleader = " "
vim.keymap.set("n", "<leader>e", ":Ex<CR>")
vim.keymap.set("n", "<leader>q", "<cmd>bd<CR>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "<C-a>", "ggVG")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- vim.keymap.set("n", "<leader>vwm", function()
--     require("vim-with-me").StartVimWithMe()
-- end)
-- vim.keymap.set("n", "<leader>svwm", function()
--     require("vim-with-me").StopVimWithMe()
-- end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]]) -- it is going to delete the text and paste it in the next line

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>")
vim.keymap.set("n", "U", "<cmd>bn<CR>")
vim.keymap.set("n", "B", "<cmd>bp<CR>")
vim.keymap.set("n", "<leader>c", "<cmd>b#<CR>")
vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.config/nvim/lua/sourab/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");
vim.keymap.set("n", "<leader>i", "<cmd>lcd %:p:h<CR>");
vim.keymap.set("n", "<leader>.", "<cmd>MRUToggle<CR>")

function OpenTerm()
    vim.api.nvim_command('vsplit | :Ex | :lcd %:p:h | terminal')
    vim.cmd('startinsert')
end

-- Map a key to call the function, for example, <leader>`
vim.api.nvim_set_keymap('n', '<leader>`', [[:lua OpenTerm()<CR>]], { noremap = true, silent = true })


-- vim.keymap.set("n", "<leader><leader>", function()
--     vim.cmd("so")
-- end)
vim.cmd [[
  autocmd FileType lua nnoremap <silent> <leader><leader> :source %<CR>
]]




vim.api.nvim_set_keymap('t', '<C-q>', '<C-\\><C-N>', { noremap = true }) --quiting from the terminal mode



--buffers
function Close_other_buffers()
    local current_bufnr = vim.fn.bufnr('%')
    for _, bufnr in ipairs(vim.fn.getbufinfo({ bufloaded = 1 })) do
        if bufnr.bufnr ~= current_bufnr then
            vim.api.nvim_command('silent! bdelete ' .. bufnr.bufnr)
        end
    end
end

vim.api.nvim_set_keymap('n', '<Leader>bda', ':lua Close_other_buffers()<CR>', { noremap = true, silent = true })
--window management
-- Rotate to the previous window with Shift + L
vim.api.nvim_set_keymap('n', 't', ':wincmd w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-X>', ':wincmd x<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-S-L>', ':wincmd L<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-S-K>', ':wincmd K<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-S-J>', ':wincmd J<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-S-H>', ':wincmd H<CR>', { noremap = true, silent = true })
-- Resize window with Alt-< and Alt->
vim.api.nvim_set_keymap('n', '<A-<>', ':vertical resize -5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A->>', ':vertical resize +5<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F9>', ':wincmd =<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Q>', ':wincmd q<CR>', { noremap = true, silent = true })

-- splitting
vim.api.nvim_set_keymap('n', 'ss', ':split<Return>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'sv', ':vsplit<Return>', { noremap = true, silent = true })

-- window navigation
vim.api.nvim_set_keymap('n', 'sh', ':wincmd h<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'sl', ':wincmd l<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'sj', ':wincmd j<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'sk', ':wincmd k<CR>', { noremap = true, silent = true })

--working with tabs
vim.api.nvim_set_keymap('n', '<A-t>', ':tabnew<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-l>', ':tabnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<A-k>', ':tabprevious<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('v', '<Space>', 'zf', { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', 'y', 'ygv<Esc>', { noremap = true })
vim.api.nvim_set_keymap('n', 'p', 'gp', { noremap = true })
vim.api.nvim_set_keymap('n', 'P', 'gP', { noremap = true })
vim.api.nvim_set_keymap('n', 'gp', 'p', { noremap = true })
vim.api.nvim_set_keymap('n', 'gP', 'P', { noremap = true })
vim.api.nvim_exec([[
  vnoremap <leader>z "+p
  noremap <leader>z "+p
]], true) -- p pastes below the line and P pastes above the line
-- cpp file compile and run
-- vim.api.nvim_set_keymap('n', '<leader>rc', ':lua runcpp()<CR>', {noremap = true})
function _G.runcpp()
    vim.cmd('split | resize 10 | term g++ % && ./a.out')
end

function _G.runJava()
    -- vim.cmd('split') -- Open a vertical split
    vim.cmd('split | term java %') -- Run Java in the new split
end

vim.api.nvim_create_augroup('runner', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
    group = 'runner',
    pattern = 'cpp,c',
    callback = function()
        vim.api.nvim_buf_set_keymap(0, 'n', '<leader>n', ':lua _G.runcpp()<CR>', { noremap = true, silent = true })
    end
})

vim.api.nvim_create_autocmd('FileType', {
    group = 'runner',
    pattern = 'java',
    callback = function()
        vim.api.nvim_set_keymap('n', '<leader>rj', ':lua runJava()<CR>', { noremap = true })
    end
})
-- Define a function to split the current window and open a terminal running Java


-- Map <leader>r to the runJava function



-- vim.cmd([[ nnoremap <leader>r :split | term java %<CR> ]])


vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- substibute word under cursor
function _G.toggleMapping()
    vim.cmd(':s/\\[/{/g')
    vim.cmd(':s/\\]/}/g')
    vim.cmd(':s/\"/\'/g')
end

vim.cmd [[
 command! Curly lua toggleMapping()
]]

vim.cmd [[
  command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
]]
