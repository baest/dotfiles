require('gitsigns').setup({
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 700,
    ignore_whitespace = true,
    virt_text_priority = 100,
  },
  current_line_blame_formatter = '<abbrev_sha> <author>, <author_time:%Y-%m-%d> - <summary>',
})
