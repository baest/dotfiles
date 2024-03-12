local ok, rd = pcall(require, "rainbow-delimiters")
if not ok then
	vim.notify("Unable to require rainbow-delimiters", vim.lsp.log_levels.ERROR, { title = "Plugin error" })
	return
end
require('rainbow-delimiters.setup').setup({
    strategy = {
        [''] = rd.strategy['global'],
        vim = rd.strategy['local'],
    },
    query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
    },
    priority = {
        [''] = 110,
        lua = 210,
    },
    highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
    },
})
