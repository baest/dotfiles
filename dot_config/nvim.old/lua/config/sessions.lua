require("sessions").setup({
    events = { "WinEnter", "VimLeavePre", "BufEnter", "BufWinEnter" },
    --session_filepath = ".nvim/session",
    -- session_filepath = vim.fn.stdpath("data") .. "/session",
})
