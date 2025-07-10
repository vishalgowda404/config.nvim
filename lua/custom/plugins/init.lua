-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'rose-pine/neovim',
  },
  {
    'stevearc/oil.nvim',
    config = function()
      require('oil').setup()
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
    end,
  },
  {
    'Mofiqul/vscode.nvim',
    config = function()
      -- Lua:
      -- For dark theme (neovim's default)
      vim.o.background = 'dark'

      local c = require('vscode.colors').get_colors()
      require('vscode').setup {
        -- Alternatively set style in setup
        -- style = 'light'

        -- Enable transparent background
        transparent = true,

        -- Enable italic comment
        italic_comments = true,

        -- Underline `@markup.link.*` variants
        underline_links = true,

        -- Disable nvim-tree background color
        disable_nvimtree_bg = true,

        -- Override colors (see ./lua/vscode/colors.lua)
        color_overrides = {
          vscLineNumber = '#FFFFFF',
        },

        -- Override highlight groups (see ./lua/vscode/theme.lua)
        group_overrides = {
          -- this supports the same val table as vim.api.nvim_set_hl
          -- use colors from this colorscheme by requiring vscode.colors!
          Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
        },
      }
      -- require('vscode').load()

      -- load the theme without affecting devicon colors.
      vim.cmd.colorscheme 'vscode'
    end,
  },
}
