return {
  {
    "vyfor/cord.nvim",
    build = "./build || .\\build",
    event = "VeryLazy",
    opts = {
      editor = {
        tooltip = ":Wq :WQ :wQ :W :wWQ :WqQ :wq",
      },
    }, -- calls require('cord').setup()
  },
}
