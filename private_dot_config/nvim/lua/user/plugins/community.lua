return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- theme related
  { import = "astrocommunity.colorscheme.nord-nvim"},

  -- completion     
  { import = "astrocommunity.completion.cmp-cmdline"},
  { import = "astrocommunity.completion.codeium-vim"},

  -- langauge server and linter 
  { import = "astrocommunity.pack.python"},
  { import = "astrocommunity.pack.bash"},
  { import = "astrocommunity.pack.go"},
  { import = "astrocommunity.pack.cpp"},
  { import = "astrocommunity.pak.markdown"},

  -- { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },
}
