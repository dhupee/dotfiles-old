return {
  {
    "siawkz/nvim-cheatsh",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    cmd = { "Cheat", "CheatClose", "CheatList" },
    keys = {
      {
        "<leader>ch",
        function()
          -- run command CheatList
          return vim.cmd.CheatList()
        end,
        desc = "Find Cheatsheets",
      },
    },
    opts = {
      cheatsh_url = "https://cht.sh/", -- URL of the cheat.sh instance to use, support self-hosted instances
      position = "bottom", -- position of the window can be: bottom, top, left, right
      height = 20, -- height of the cheat when position is top or bottom
      width = 100, -- width of the cheat when position is left or right
    },
  },
}
