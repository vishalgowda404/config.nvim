-- Run cats on the parent directory of the current file and open result in explorer.exe
vim.api.nvim_create_user_command('CatsParent', function(opts)
  local filepath = vim.api.nvim_buf_get_name(0)
  local parent_dir = vim.fn.fnamemodify(filepath, ':h')
  local work_dir = vim.fn.getcwd()

  vim.notify('🐈 Running cats on: ' .. parent_dir, vim.log.levels.INFO)

  -- Default output file name if -o not provided
  local output_file = 'cats_output.txt'

  -- Parse arguments to look for -o <filename>
  local args = opts.fargs
  for i = 1, #args do
    if args[i] == '-o' and args[i + 1] then
      output_file = args[i + 1]
      break
    end
  end

  vim.notify('📄 Output file will be: ' .. output_file, vim.log.levels.INFO)

  -- Construct full shell command to run
  local cats_cmd = { 'cats', parent_dir, unpack(args) }
  vim.notify('🛠️ Executing: ' .. table.concat(cats_cmd, ' '), vim.log.levels.DEBUG)
  local result = vim.fn.system(cats_cmd)

  -- Check for errors in cats command
  if vim.v.shell_error ~= 0 then
    vim.notify('❌ cats command failed:\n' .. result, vim.log.levels.ERROR)
    return
  end

  -- Open the output file's directory in explorer.exe
  local explorer_cmd = string.format 'explorer.exe .'

  vim.notify('📂 Opening in Explorer: ' .. work_dir, vim.log.levels.INFO)
  vim.fn.system(explorer_cmd)

  if vim.v.shell_error ~= 0 then
    vim.notify('⚠️ Failed to open explorer.exe Exited with code %d', vim.v.shell_error)
  else
    vim.notify('✅ cats finished and explorer opened.', vim.log.levels.INFO)
  end
end, {
  nargs = '*',
  complete = nil,
  desc = 'Run cats on the parent directory of the current file and open output in explorer.exe',
})
