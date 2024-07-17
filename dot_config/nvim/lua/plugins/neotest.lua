return {
  "nvim-neotest/neotest",
  config = function()
    -- get neotest namespace
    local neotest_ns = vim.api.nvim_create_namespace "neotest"
    vim.diagnostic.config({
      virtual_text = {
        format = function(diagnostic)
          local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
          return message
        end,
      },
    }, neotest_ns)
    require("neotest").setup {
      adapters = {
        require("neotest-python")({
            -- Extra arguments for nvim-dap configuration
            -- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
            dap = { justMyCode = false },
            -- Command line arguments for runner
            -- Can also be a function to return dynamic values
            args = {"--log-level", "DEBUG"},
            -- Runner to use. Will use pytest if available by default.
            -- Can be a function to return dynamic value.
            -- runner = "poetry run pytest",
            -- Custom python path for the runner.
            -- Can be a string or a list of strings.
            -- Can also be a function to return dynamic value.
            -- get it from VIRTUALENV/bin/python
            python = function()
                return vim.fn.expand(vim.env.VIRTUAL_ENV .. "/bin/python")
            end,
            -- If not provided, the path will be inferred by checking for 
            -- virtual envs in the local directory and for Pipenev/Poetry configs
            -- Returns if a given file path is a test file.
            -- NB: This function is called a lot so don't perform any heavy tasks within it.
            is_test_file = function(file_path) -- any python file can contain tests
                return file_path:match(".*%.py$") ~= nil
            end,
            -- !!EXPERIMENTAL!! Enable shelling out to `pytest` to discover test
            -- instances for files containing a parametrize mark (default: false)
            pytest_discover_instances = true,
        })
      },
    }
  end,
  ft = { "python" },
  dependencies = {
    "nvim-neotest/neotest-python",
  },
}
