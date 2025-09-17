return {
  name = "Ruff",
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
  init_options = {
    settings = {
      lint = {
        ignore = { "ALL" }
      },
    },
  },
  on_attach = function(client)
    client.server_capabilities.hoverProvider = false
    client.server_capabilities.definitionProvider = false
    client.server_capabilities.complitionProvider = false
  end
}
