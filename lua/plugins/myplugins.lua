local plugins = {
  { "nvim-neotest/nvim-nio" },
  { 
    'f3fora/nvim-texlabconfig',
    config = function()
        require('texlabconfig').setup(config)
    end,
    -- ft = { 'tex', 'bib' }, -- Lazy-load on filetype
    build = 'go build'
    -- build = 'go build -o ~/.bin/' if e.g. ~/.bin/ is in $PATH
},
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
  {
    'tzachar/local-highlight.nvim',
    config = function()
      require('local-highlight').setup()
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {}
    },
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      -- require("core.utils").load_mappings("dap_python")
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function()
      return require "configs.null-ls"
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, _)
      -- require("core.utils").load_mappings("dap")
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "nvchad.configs.lspconfig"
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clang-format",
        "standardjs",
        "clangd",
        "codelldb",
        "black",
        "debugpy",
        "mypy",
        "ruff",
        "pyright",
        "texlab",
"typescript-language-server"
      }
    }
  }
}
return plugins
