local M = {}

M.preq = function(module)
  local ok, lib = pcall(require, module)
  if ok then 
    return lib
  end
  vim.notify('Error loading module: ' .. module .. '\n\n' .. lib)
  return nil
end

return M
