return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        metal = {
          cmd = { "metal-lsp" },
          filetypes = { "metal" },
          root_markers = { ".git" },
        },
        ty = {},
        pylsp = {
          mason = false,
          autostart = false,
          settings = {
            pylsp = {
              plugins = {
                -- Disable all linting plugins
                pyflakes = { enabled = true },
                pycodestyle = { enabled = false },
                autopep8 = { enabled = false },
                yapf = { enabled = false },
                mccabe = { enabled = false },
                pylsp_mypy = { enabled = false },
                pylsp_black = { enabled = false },
                pylsp_isort = { enabled = false },
                pylint = { enabled = false },
                flake8 = { enabled = false },
                pydocstyle = { enabled = false },
                -- Keep navigation-related plugins enabled
                rope_completion = { enabled = true },
                jedi_completion = { enabled = true },
                jedi_definition = { enabled = true },
                jedi_hover = { enabled = true },
                jedi_references = { enabled = true },
                jedi_signature_help = { enabled = true },
                jedi_symbols = { enabled = true },
              },
            }
          }
        },
        pyright = {
          mason = false,
          autostart = false,
        },
        pyrefly = {
          mason = false,
          autostart = false,
        }
      },
    },
  }
}
