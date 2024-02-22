return {
  -- "ogaken-1/wilder.nvim", -- most updated fork
  "gelguy/wilder.nvim", -- original repo, bit outdated
  lazy = false,
  config = function()
    local wilder = require("wilder")
    wilder.setup({ modes = { ":", "/", "?" } })

    -- fuzzy config
    wilder.set_option("pipeline", {
      wilder.branch(
        wilder.cmdline_pipeline({
          fuzzy = 1,
          set_pcre2_pattern = 1,
        }),
        wilder.python_search_pipeline({
          pattern = "fuzzy",
        })
      ),
    })

    -- rendering config
    wilder.set_option(
      "renderer",
      wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
        highlights = {
          border = "Normal", -- highlight to use for the border
        },
        -- 'single', 'double', 'rounded' or 'solid'
        -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
        border = "rounded",
      }))
    )
  end,
}
