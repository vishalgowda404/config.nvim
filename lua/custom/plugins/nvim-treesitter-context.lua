return {
  'nvim-treesitter/nvim-treesitter-context',
  dependencies = { 'nvim-treesitter/nvim-treesitter' },
  config = function()
    require('treesitter-context').setup {
      enable = true, -- plugin on/off
      max_lines = 3, -- how many lines to show at top (0 = no limit)
      min_window_height = 0, -- minimum editor height to enable
      line_numbers = false, -- show line numbers in the context window
      multiline_threshold = 20, -- when to trim context nodes
      trim_scope = 'outer', -- which context to discard if max_lines exceeded
      mode = 'cursor', -- 'cursor' or 'topline' (cursor is typical)
      -- other options available in README
    }
  end,
}
