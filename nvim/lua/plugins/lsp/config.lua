local lsp = require('lspconfig')
local mason_lsp = require('mason-lspconfig')
local rt = require('rust-tools')
local on_attach = require('plugins.lsp.handlers').on_attach
local coq = require('coq')

--Language servers
local langs = {"tsserver", "vimls", "ruby_ls", "html", "cssls",
    "gopls", "jdtls", "kotlin_language_server",   }

--Install language servers through mason
require('mason').setup({
  ui = {
    border = "rounded",
  },
})

mason_lsp.setup ({
    ensure_installed = langs  ,
})


--Enable language servers
for _, server in ipairs(langs) do
    if server == "tsserver" then
        require("typescript").setup({
          server = {
            on_attach = on_attach,
            capabilities = coq.lsp_ensure_capabilities({on_attach = on_attach})
          }
        })
    end

    lsp[server].setup {
      on_attach = on_attach,
      coq.lsp_ensure_capabilities({on_attach = on_attach})
    }

end

--Specific configs for manually installed servers
lsp.pyright.setup({
    coq.lsp_ensure_capabilities({on_attach = on_attach}),
    cmd = {
        '/home/zura/.npm-global/bin/pyright'
    },
    single_file_support = true,
})

lsp.sumneko_lua.setup ({
    coq.lsp_ensure_capabilities({
        on_attach = on_attach
    }),
    cmd = {
    '/home/zura/lua-language-server/bin/lua-language-server'
  },
  settings = {
    runtime = {
      version = "lua 5.4",
      pathStrict = false,
    },
    semantic = {
      annotation = true,
      enable = true,
      variable = true,
    },
    window = {
      statusBar = true,
      progressBar = true,
    },

    Lua = {
      diagnostics = {
        globals = { "vim", "awesome", "client", "screen", "root" },
      },
      runtime = {
        version = "lua 5.4",
        pathStrict = false,
      },
      semantic = {
        annotation = true,
        enable = true,
        variable = true,
      },
      window = {
        statusBar = true,
        progressBar = true,
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
          checkThirdParty = true,
          maxPreload = 5000,
          useGitIgnore = true,
        },
      },
    },
  },
})

rt.setup({
    server = {
        on_attach = on_attach,
        --capabilities = coq.lsp_ensure_capabilities({on_attach = on_attach})
  },
  dap = {
    adapter = require("rust-tools.dap").get_codelldb_adapter("codelldb",
      require("mason-registry").get_package("codelldb"):get_install_path() .. "/extension/lldb/lib/liblldb.so")
    },
})

-- null-ns
local null_ls = require('plugins.lsp.null-ls')

require('mason-null-ls').setup({
  ensure_installed = {"prettier", "black",  "prettierd", }
   --"goimports"}
})

require("gopher").setup {
  commands = {
    go = "go",
    gomodifytags = "gomodifytags",
    gotests = "~/go/bin/gotests", -- also you can set custom command path
    impl = "impl",
    iferr = "iferr",
  },
}

require('plugins.lsp.bqf')
