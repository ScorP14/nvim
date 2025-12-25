return {
  name = "Ty",
  cmd = { "ty", "server" },
  filetypes = { "python" },
  root_markers = {
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    "pyrightconfig.json",
    ".git",
  },
  init_options = {
    settings = {
      ty = {
        -- ty language server settings go here
      }
    }
  }
}
