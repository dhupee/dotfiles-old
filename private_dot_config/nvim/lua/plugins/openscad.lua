return {
  "salkin-mada/openscad.nvim",
  ft = { "openscad" },
  config = function()
    require("openscad")
    -- load snippets, note requires
    vim.g.openscad_load_snippets = true

    -- Custom Which-key for Openscad
    local wk = require("which-key")
    wk.register({
      o = {
        name = "Openscad", -- Group name
        c = { "<Cmd>OpenscadCheatsheet<cr>", "Open Cheatsheet" },
        e = { "<Cmd>OpenscadExecFile<cr>", "Execute File" },
        h = { "<Cmd>OpenscadHelp<cr>", "Help" },
        m = { "<Cmd>OpenscadManual<cr>", "Open Manual" },
        t = { "<Cmd>OpenscadToggle<cr>", "Toggle Htop/Top" },
      },
    }, { prefix = "<leader>" })
  end,
  requires = { "L3MON4D3/LuaSnip" },
  module = "openscad",
}
