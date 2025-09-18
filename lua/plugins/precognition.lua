return {
  "tris203/precognition.nvim",
  event = "VeryLazy",
  opts = {
    startVisible = false,
  },
  keys = {
    {
      "<leader>up",
      function()
        require("precognition").toggle()
      end,
      desc = "precognition",
    },
  },
}
