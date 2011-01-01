return { 
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
}
