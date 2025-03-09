
local ls=require('luasnip')
local s=ls.snippet
local t=ls.text_node
local i=ls.insert_node

ls.add_snippets('cpp',{
    s("cout",{
        t"std::cout<<",i(1),t"<<std::endl;"
    })
})

-- g/cout/s/^/\/\/ -- prepend with // to every line containing "cout"
