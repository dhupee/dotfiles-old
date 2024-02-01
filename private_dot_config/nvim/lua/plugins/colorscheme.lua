return {
  -- add dracula
  { "Mofiqul/dracula.nvim" },

  -- Configure LazyVim to load dracula
  {
    "LazyVim/LazyVim",
    Lazy = true,
    opts = {
      colorscheme = "dracula",
    },
  },
}
