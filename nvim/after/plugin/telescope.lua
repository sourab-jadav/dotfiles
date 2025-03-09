local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>th', builtin.find_files, {})
-- vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>gg', function()
	builtin.grep_string({search=vim.fn.input("Grep > ")});
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
require('telescope').setup{
  defaults = {
    file_ignore_patterns = {
      "node_modules",
    },
     mappings = {
      i = {
        -- ["<C-y>"] = actions.api.insVdert_selected,
        -- ["<C-j>"] = actions.move_selection_next,
        -- ["<C-k>"] = actions.move_selection_previous,
      },

    },
  },
}
vim.api.nvim_set_keymap('n', '<leader>tb', [[:Telescope buffers<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>of', [[:Telescope oldfiles<CR>]], { noremap = true, silent = true })
-- looking at recently used files that belong to the pwd
vim.api.nvim_set_keymap('n', '<leader>ost', "<cmd>lua require('telescope.builtin').oldfiles({ cwd_only = true })<cr>", { noremap = true, silent = true })
