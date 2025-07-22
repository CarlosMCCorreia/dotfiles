return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    local code_actions = null_ls.builtins.code_actions

    null_ls.setup({
      sources = {
        -- Lua
        formatting.stylua,

        -- Python
        formatting.black,
        formatting.isort,

        -- Bash / Shell
        diagnostics.shellcheck,
        formatting.shfmt,

        -- C / C++
        formatting.clang_format,
        diagnostics.cppcheck,
      },
    })
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}

