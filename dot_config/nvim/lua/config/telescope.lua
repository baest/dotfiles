local ok, ts = pcall(require, "telescope")
if not ok then
	vim.notify("Unable to require telescope", vim.lsp.log_levels.ERROR, { title = "Plugin error" })
	return
end

local actionok, actions = pcall(require, "telescope.actions")
if not actionok then
	vim.notify("Unable to require telescope.actions", vim.lsp.log_levels.ERROR, { title = "Plugin error" })
	return
end

local buildok, tsbuildin = pcall(require, "telescope.builtin")
if not buildok then
	vim.notify("Unable to require telescope.builtin", vim.lsp.log_levels.ERROR, { title = "Plugin error" })
	return
end

local buildok, sorters = pcall(require, "telescope.sorters")
if not buildok then
	vim.notify("Unable to require telescope.sorters", vim.lsp.log_levels.ERROR, { title = "Plugin error" })
	return
end

ts.setup({
	defaults = {
		file_ignore_patterns = {".git/", ".cache/", "vendor"},
		prompt_prefix = " ",
		selection_caret = " ",
		--path_display = { "smart" },

		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
				["<esc>"] = actions.close,
				["<CR>"] = actions.select_default + actions.center,

				-- You can perform as many actions in a row as you like
				-- ["<CR>"] = actions.select_default + actions.center + my_cool_custom_action,
				["<C-h>"] = actions.which_key, -- keys from pressing <C-/>
			},
			n = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
				["<C-h>"] = actions.which_key,
			},
		},
	},
	pickers = {
		buffers = {
			ignore_current_buffer = true,
			sort_lastused = true,
			--sorter = sorters.get_substr_matcher(),
			sorter = sorters.get_fzy_sorter(),
			show_all_buffers = true,
			path_display = {"absolute"},
		},
		colorscheme = {
			enable_preview = true
		},
		lsp_references = {
			preview = true -- error on launchin lsp_references
		},
	},
	extensions = {
--		fzy_native = {
--			override_generic_sorter = false,
--			override_file_sorter = true,
--		},
--		["ui-select"] = {
--			require("telescope.themes").get_dropdown({
--				-- even more opts
--			}),
--		},
	},
})

ts.load_extension("fzy_native")
ts.load_extension('chezmoi')
vim.keymap.set('n', '<leader>cz', ts.extensions.chezmoi.find_files, {})
--ts.load_extension("ui-select")

vim.keymap.set("n", "<Leader>a", function()
	tsbuildin.marks()
end, { noremap = true, silent = true, desc = "Show marks" })

vim.keymap.set("n", "<Leader>ff", function()
	tsbuildin.find_files({ hidden = true })
end, { noremap = true, silent = true, desc = "Find files" })

vim.keymap.set("n", "<Leader>fv", function()
	tsbuildin.treesitter()
end, { noremap = true, silent = true, desc = "Find variables" })

vim.keymap.set("n", "<Leader>fm", function()
	ts.extensions.media_files.media_files()
end, { noremap = true, silent = true, desc = "Find media files" })

vim.keymap.set("n", "<Leader>fg", function()
	tsbuildin.live_grep()
end, { noremap = true, silent = true, desc = "Live grep" })

vim.keymap.set("n", "<Leader>fb", function()
	tsbuildin.buffers()
end, { noremap = true, silent = true, desc = "Show buffers" })

vim.keymap.set("n", "<Leader>fh", function()
	tsbuildin.help_tags()
end, { noremap = true, silent = true, desc = "Help tags" })

vim.keymap.set("n", "<Leader>fn", function()
	ts.extensions.notify.notify({})
end, { noremap = true, silent = true, desc = "List notifications" })

vim.keymap.set("n", "<Leader>fo", function()
	tsbuildin.tags({ only_current_buffer = true })
end, { noremap = true, silent = true, desc = "List tags" })

vim.keymap.set("n", "<Leader>fs", function()
	tsbuildin.current_buffer_fuzzy_find()
end, { noremap = true, silent = true, desc = "Fuzzy find in buffer" })

vim.keymap.set("n", "<Leader>gS", function()
	tsbuildin.git_status()
end, { noremap = true, silent = true, desc = "Git status" })

vim.keymap.set("n", "<Leader>p", function()
	tsbuildin.diagnostics()
end, { noremap = true, silent = true, desc = "Show diagnostics" })

local M = {}

M.find_files = function()
	tsbuildin.find_files({
		--find_command = { "rg", "--files", "--hidden", "-g", "!.git" },
		find_command = {"fd", "--type=f", "--absolute-path", "--hidden", "--no-ignore", "--exclude", ".git", "--exclude", "__pycache__", "--ignore-file", ".ts_ignore"},
		hidden = true,
		wrap_results = true,
		prompt_title = "Search files ABE"
	})
end

--M.search_nvim = function()
--	tsbuildin.find_files({
--		prompt_title = "< VimRC >",
--		cwd = "$HOME/.config/nvim/",
--	})
--end

function M.list_methods()
	local symopts = { symbols = { "function", "method", "constructor" } }
	if vim.bo.filetype == "vim" then
		symopts.symbols = { "function" }
	end
	tsbuildin.lsp_document_symbols(symopts)
end

vim.keymap.set("n", "<S-Tab>", function()
	M.find_files({
		hidden = true,
		previewer = true,
		wrap_results = true,
		prompt_title = "Search files ABE"
	})
end, { noremap = true, silent = true, desc = "Search files" })

vim.keymap.set("n", "<Tab>", function()
	tsbuildin.buffers()
end, { noremap = true, silent = true, desc = "Show buffers" })

vim.keymap.set("n", "<Leader>lg", function()
	tsbuildin.live_grep()
end, { noremap = true, silent = true, desc = "Live grep" })

--nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>

return M
