local M = {}

function M.is_executable(name)
  return vim.fn.executable(name) == 1
end

return M
