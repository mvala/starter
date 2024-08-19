return {
  "saecki/crates.nvim",
  ft = { "toml" },
  tag = "stable",
  config = function()
    require("crates").setup()
  end,
}
