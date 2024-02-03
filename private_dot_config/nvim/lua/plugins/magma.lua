return {
  "dccsillag/magma-nvim",
  lazy = true,
  run = ":UpdateRemotePlugins",
  -- run only when ipynb or python opened_buffer
  on_ft = { "ipynb", "python" },
}
