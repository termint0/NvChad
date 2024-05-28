require "nvchad.mappings"
local M = {}

local map = vim.keymap.set
local telescope_builtin = require('telescope.builtin')
vim.cmd("map <C-t> <Nop>")
vim.cmd("map K <Nop>")
map("t", "<C-x>", "<C-\\><C-N>", { desc = "Terminal Escape terminal mode" })
map("n", "K", vim.lsp.buf.hover, { desc = "Terminal Escape terminal mode" })
M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    }
  }
}
M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require('dap-python').test_method()
      end
    }
  }
}

map(
  "n",
  '<leader>fd',
  telescope_builtin.lsp_document_symbols,
  {desc = "Find in document symbols"}
)

map("t", "<C-h>", 
      function()
        vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true)
        vim.cmd("wincmd h")
      end,
  {desc = "Window left"}
)

map("t", "<C-l>", 
      function()
        vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true)
        vim.cmd("wincmd j")
      end,
  {desc = "Window right"}
)
map("t", "<C-j>", 
      function()
        vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true)
        vim.cmd("wincmd j")
      end,
  {desc = "Window down"}
)
map("t", "<C-k>", 
      function()
        vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true)
        vim.cmd("wincmd k")
      end,
  {desc = "Window up"}
)
M.general = {
  n = {
    ["<leader>sh"] = {
      function()
        if vim.v.count > 0 then
          vim.cmd("vert res -" .. vim.v.count)
        else
          vim.cmd("vert res -1")
        end
      end,
      "Vertically narrow window"
    },
    ["<leader>sk"] = {
      function()
        if vim.v.count > 0 then
          vim.cmd("res -" .. vim.v.count)
        else
          vim.cmd("res -1")
        end
      end,
      "Vertically narrow window"
    },
    ["<leader>sj"] = {
      function()
        if vim.v.count > 0 then
          vim.cmd("res +" .. vim.v.count)
        else
          vim.cmd("res +1")
        end
      end,
      "Vertically narrow window"
    },
    ["<leader>sl"] = {
      function()
        if vim.v.count > 0 then
          vim.cmd("vert res +" .. vim.v.count)
        else
          vim.cmd("vert res +1")
        end
      end,
      "Vertically narrow window"
    },
  }
}

return M
