local saga = require("lspsaga")

saga.init_lsp_saga({
    error_sign = "",
    warn_sign = "",
    hint_sign = "",
    infor_sign = "",
    border_style = "round",
    finder_action_keys = {
        open = "o",
        vsplit = "s",
        split = "v",
        tabe = "t",
        quit = "q",
    },
    server_filetype_map = {},
    definition_preview_icon = "  ",
})

local action = require("lspsaga.codeaction")
