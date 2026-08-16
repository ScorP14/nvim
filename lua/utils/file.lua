local M = {}

function M.is_python()
  return vim.bo.filetype == "python"
end

function M.is_filetype(filetype)
  return vim.bo.filetype == filetype
end

function M.has_extension(extension)
  return vim.fn.expand("%:e") == extension
end

return M
