local ok, mason = pcall(require, "mason")
if not ok then
    vim.notify("Unable to require mason", vim.lsp.log_levels.ERROR,
               {title = "Plugin error"})
    return
end

local oklsp, masonlsp = pcall(require, "mason-lspconfig")
if not oklsp then
    vim.notify("Unable to require mason-lspconfig", vim.lsp.log_levels.ERROR,
               {title = "Plugin error"})
    return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
    vim.notify("Unable to require mason-null-ls", vim.lsp.log_levels.ERROR,
               {title = "Plugin error"})
    return
end

mason.setup()

--"pylsp"
masonlsp.setup({
    ensure_installed = {
        "gopls", "lua_ls", "bashls", "yamlls", "pyright", "efm",
        "dockerls", "clangd", "jsonls", "perlnavigator"
    },
    automatic_installation = true
})

mason_null_ls.setup({
    -- list of formatters & linters for mason to install
    ensure_installed = {
        "stylua", "black"
    },
    -- auto-install configured servers (with lspconfig)
    automatic_installation = true
})
