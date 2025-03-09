local ls=require('luasnip')
local s=ls.snippet
local t=ls.text_node
local i=ls.insert_node

ls.add_snippets('lex',{
    s("hi",{
        t"welcome to the lex programming"
    })
})
