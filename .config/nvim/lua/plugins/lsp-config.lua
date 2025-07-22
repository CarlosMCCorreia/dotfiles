return {
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },{
    "mason-org/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {"lua_ls"}
      })
    end
  },{
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({
        on_attach = function(_, bufnr)
          local opts = { noremap = true, silent = true, buffer = bufnr }

          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        end,
      })
     end,
  }
}
