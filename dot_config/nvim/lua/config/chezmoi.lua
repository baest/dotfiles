vim.g['chezmoi#use_tmp_buffer'] = true

require("chezmoi").setup {
  edit = {
    watch = true, -- Set true to automatically apply on save.
    force = false, -- Set true to force apply. Works only when watch = true.
  },
  notification = {
    on_open = true, -- vim.notify when start editing chezmoi-managed file.
    on_apply = true, -- vim.notify on apply.
  },
}

