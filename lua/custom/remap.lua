vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Remap Alt-v to vertical (blockwise) selection
vim.keymap.set('n', '<A-v>', '<C-v>', { noremap = true, silent = true })
vim.keymap.set('v', '<A-v>', '<C-v>', { noremap = true, silent = true })

-- Rename file and apply LSP edits (e.g., update imports)
local function rename_file()
  local old_name = vim.api.nvim_buf_get_name(0)
  vim.ui.input({ prompt = 'New filename: ', default = old_name }, function(new_name)
    if not new_name or new_name == '' or new_name == old_name then
      return
    end

    local params = {
      files = {
        {
          oldUri = vim.uri_from_fname(old_name),
          newUri = vim.uri_from_fname(new_name),
        },
      },
    }

    -- Send willRenameFiles request to the server (if supported)
    local clients = vim.lsp.get_clients { bufnr = 0 }
    for _, client in ipairs(clients) do
      if client.supports_method 'workspace/willRenameFiles' then
        client.request('workspace/willRenameFiles', params, function(_, result)
          if result then
            vim.lsp.util.apply_workspace_edit(result, client.offset_encoding)
          end
          vim.cmd('saveas ' .. new_name)
          os.remove(old_name)
        end)
      else
        vim.cmd('saveas ' .. new_name)
        os.remove(old_name)
      end
    end
  end)
end

vim.keymap.set('n', '<leader>rf', rename_file, { desc = 'LSP: Rename File with Import Updates' })
