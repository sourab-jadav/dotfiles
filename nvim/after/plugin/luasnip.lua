local ls = require("luasnip")

require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets/" })

ls.config.set_config({
    history = true,
    updateevents = "TextChanged,TextChangedI",
    enable_autosnippets = true,
    ext_opts = {
        [require("luasnip.util.types").choiceNode] = {
            active = {
                virt_text = { { ".", "GruvboxOrange" } },
            }
        }
    }
})



vim.keymap.set({ "i","s" }, "<C-k>", function() ls.expand() end, { silent = true })
-- vim.keymap.set({"i","s"},"<C-k>",function () -- this is not working
--     if ls.expand_or_jumpable() then
--         ls.expand_or_jumpable()
--     end
-- end,{ silent = true})
vim.keymap.set({ "i", "s" }, "<C-l>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-j>", function() ls.jump(-1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<C-b>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { silent = true })
