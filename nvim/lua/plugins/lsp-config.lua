return {
  {
    "mason-org/mason.nvim",
    config = function()
      require('mason').setup()
    end
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = { "lua_ls", "pyright" }
      })
    end
  },
  {
    'neovim/nvim-lspconfig',
    config = function()
      vim.lsp.enable('lua_ls', 'pyright')

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
      })

      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
