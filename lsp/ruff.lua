return {
  cmd = { 'ruff', 'server' },
  filetypes = { 'python' },
  root_markers = {
    'pyproject.toml',
    'setup.py',
    'setup.cfg',
    'requirements.txt',
    'Pipfile',
    'pyrightconfig.json',
    '.git',
  },
  -- TODO: Улучшить настройку LSP-Ruff
  init_options = {
    settings = {
      -- args = {
      --   "--select=E,F,UP,N,I,ASYNC,S,PTH",
      --   "--line-length=60",
      --   "--respect-gitignore",
      -- },
      -- lint = {
      --   -- ignore = { "ALL" }
      -- },
    },
  },
}
