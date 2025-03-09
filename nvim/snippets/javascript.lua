local ls=require('luasnip')
local s=ls.snippet
local t=ls.text_node
local i=ls.insert_node


ls.add_snippets('javascript',{
    s("lg",{
        t"console.log(`",i(1),t"`)",i(2)
    })
})
ls.add_snippets('javascript',{
    s("ll",{
        t"console.log(",i(1),t")",i(2)
    })
})
ls.add_snippets('javascriptreact',{
    s("lg",{
        t"console.log(`",i(1),t"`)",i(2)
    })
})


ls.add_snippets('javascript',{
    s("cond",{
        i(1,"cond"),t(" ? "),i(2,"then"),t(" : "),i(3,"else")
    })
})
require('luasnip').filetype_extend("javascript", { "javascriptreact" })
require('luasnip').filetype_extend("javascript", { "html" })
