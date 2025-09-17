return {
  cmd = { 'basedpyright-langserver', '--stdio' },
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
  -- TODO: Улучшить настройку LSP-basedpyright
  settings = {
    basedpyright = {
      disableOrganizeImports = true,
      -- disableLanguageServices = false,

      analysis = {
        diagnosticSeverityOverrides = {
          -- "error", "warning", "information", "true", "false", "none"
          reportExplicitAny = false,
          reportAny = false,
          reportUnknownParameterType = false,
          reportUnknownArgumentType = false,
          reportUnknownMemberType = false,
          reportUnusedCallResult = false,
          reportIncompatibleVariableOverride = false,
        },
        ignore = {
          "__pycache__"
        },
        typeCheckingMode = "all", -- ["off", "basic", "standard", "strict", "recommended", "all"]

        autoSearchPaths = true,
        autoImportCompletions = true,
        useLibraryCodeForTypes = true,
        -- diagnosticMode = 'workspace',
      },
    },
    python = {
      analysis = {
        ignore = { "*" },
      },
    },
  },
}
