vim.opt.list = true
--vim.opt.listchars:append("space:⋅")
--vim.opt.listchars:append("eol:↴")
--
--IndentBlanklineDisable
--:set listchars+=lead:.
--IndentBlanklineEnable
--:set listchars-=lead:.

--require("ibl").setup {
--    show_end_of_line = true,
--    space_char_blankline = " ",
--}
local highlight = {
    "CursorColumn",
    "Whitespace",
}
require("ibl").setup {
    indent = { highlight = highlight, char = "" },
    whitespace = {
        highlight = highlight,
        remove_blankline_trail = false,
    },
    scope = { enabled = false },
}
