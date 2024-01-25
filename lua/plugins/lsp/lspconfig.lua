local on_attach = function(client, buffer)
  local ts = require "telescope.builtin"

  vim.keymap.set({ "n", "x" }, "<leader>cf", vim.lsp.buf.format, { buffer = buffer, desc = "LSP: Format buffer" })
  vim.keymap.set({ "n", "x" }, "<leader>cr", vim.lsp.buf.rename, { buffer = buffer, desc = "LSP: Rename" })
  vim.keymap.set({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = buffer, desc = "LSP: Code Action" })

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = buffer, desc = "LSP: Goto Definition" })
  vim.keymap.set("n", "gr", ts.lsp_references, { buffer = buffer, desc = "LSP: Goto References" })
  vim.keymap.set("n", "gI", ts.lsp_implementations, { buffer = buffer, desc = "LSP: Goto Implementation" })
  vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { buffer = buffer, desc = "LSP: Type Definition" })
  vim.keymap.set("n", "<leader>ls", ts.lsp_document_symbols, { buffer = buffer, desc = "LSP: Document Symbols" })
  vim.keymap.set(
    "n",
    "<leader>ws",
    ts.lsp_dynamic_workspace_symbols,
    { buffer = buffer, desc = "LSP: Workspace Symbols" }
  )

  -- See `:help K` for why this keymap
  if client.server_capabilities.hoverProvider then
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = buffer, desc = "LSP: Hover Documentation" })
  end
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = buffer, desc = "LSP: Signature Documentation" })

  -- Lesser used LSP functionality
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = buffer, desc = "LSP: Goto Declaration" })
  vim.keymap.set(
    "n",
    "<leader>wa",
    vim.lsp.buf.add_workspace_folder,
    { buffer = buffer, desc = "LSP: Workspace Add Folder" }
  )
  vim.keymap.set(
    "n",
    "<leader>wr",
    vim.lsp.buf.remove_workspace_folder,
    { buffer = buffer, desc = "LSP: Workspace Remove Folder" }
  )
  vim.keymap.set("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { buffer = buffer, desc = "LSP: Workspace List Folders" })

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(buffer, "Format", function(_)
    vim.lsp.buf.format()
  end, { desc = "LSP: Format current buffer with LSP" })
end

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    { "j-hui/fidget.nvim", tag = "legacy", opts = {} },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    local lspconfig = require "lspconfig"

    lspconfig.lua_ls.setup {
      on_attach = on_attach,
      settings = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
    }
    lspconfig.tsserver.setup {
      on_attach = on_attach,
    }
    lspconfig.pyright.setup {
      on_attach = on_attach,
      settings = {
        pyright = { autoImportCompletion = true },
        python = {
          analysis = {
            autoSearchPaths = true,
            diagnosticMode = "openFilesOnly",
            useLibraryCodeForTypes = true,
            typeCheckingMode = "off",
          },
        },
      },
    }
    lspconfig.ruff_lsp.setup {
      on_attach = function(client, buffer)
        client.server_capabilities.hoverProvider = false
        on_attach(client, buffer)
      end,
      settings = {
        args = {},
      },
    }
  end,
}
