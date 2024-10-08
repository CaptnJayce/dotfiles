return {
  {
    "vyfor/cord.nvim",
    build = "./build || .\\build",
    event = "VeryLazy",
    opts = {
      editor = {
        tooltip = ":Wq :WQ :wQ :W :wWQ :WqQ :wq",
      },
      text = {
        editing = "rawdogging {}",
        workspace = "in /{}",
      },
    },
  },
}
