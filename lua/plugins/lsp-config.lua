return {
  {
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup()
  end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function ()
      require("mason-lspconfig").setup({
        -- ensure_installed = {"lua_ls", "pyright"}
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      -- Loop through all LSPs
      require("mason-lspconfig").setup_handlers {
        function(server_name)
          lspconfig[server_name].setup({})
        end
      }
      -- lspconfig.lua_ls.setup({})
      -- lspconfig.pyright.setup({})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {desc="Go to definition"})
      vim.keymap.set({'n'}, '<leader>ca', vim.lsp.buf.code_action, {desc="Code Actions"})
    end
  }
}
