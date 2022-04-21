local M = {'kyazdani42/nvim-web-devicons'}

M.config = function()
  local colors = {
    white = "#FCFCFA",
    black = "#2D2A2E",
    red = "#E06C75",
    pink = "#FF6188",
    orange = "#FC9867",
    yellow = "#FFD866",
    green = "#A9DC76",
    blue = "#78DCE8",
    purple = "#AB9DF2",
    cyan = "#18FF9E",
    grey1 = "#383539",
    grey2 = "#403E41",
    grey3 = "#565357",
    white_dark1 = "#5B595C",
    white_dark2 = "#727072",
    white_dark3 = "#939293",
    white_dark4 = "#ABB2BF",
    white_dark5 = "#747474",
    grey_dark1 = "#19181A",
    grey_dark2 = "#221F22",
    purple2 = "#C678DD"
  }

  require('nvim-web-devicons').setup {
    override = {
      html = {
        icon = "",
        color = colors.orange,
        name = "html"
      },
      css = {
        icon = "",
        color = colors.blue,
        name = "css"
      },
      js = {
        icon = "",
        color = colors.yellow,
        name = "js"
      },
      ts = {
        icon = "ﯤ",
        color = colors.blue,
        name = "ts"
      },
      kt = {
        icon = "󱈙",
        color = colors.orange,
        name = "kt"
      },
      png = {
        icon = "",
        color = colors.purple,
        name = "png"
      },
      jpg = {
        icon = "",
        color = colors.purple,
        name = "jpg"
      },
      jpeg = {
        icon = "",
        color = "colors.purple",
        name = "jpeg"
      },
      mp3 = {
        icon = "",
        color = colors.white,
        name = "mp3"
      },
      mp4 = {
        icon = "",
        color = colors.white,
        name = "mp4"
      },
      out = {
        icon = "",
        color = colors.white,
        name = "out"
      },
      Dockerfile = {
        icon = "",
        color = colors.blue,
        name = "Dockerfile"
      },
      dockerfile = {
        icon = "",
        color = colors.blue,
        name = "Dockerfile"
      },
      rb = {
        icon = "",
        color = colors.red,
        name = "rb"
      },
      ru = {
        icon = "",
        color = colors.red,
        name = "ru"
      },
      vue = {
        icon = "﵂",
        color = colors.green,
        name = "vue"
      },
      py = {
        icon = "",
        color = colors.green,
        name = "py"
      },
      toml = {
        icon = "",
        color = colors.blue,
        name = "toml"
      },
      lock = {
        icon = "",
        color = colors.red,
        name = "lock"
      },
      zip = {
        icon = "",
        color = colors.orange,
        name = "zip"
      },
      xz = {
        icon = "",
        color = colors.orange,
        name = "xz"
      },
      deb = {
        icon = "",
        color = colors.cyan,
        name = "deb"
      },
      rpm = {
        icon = "",
        color = colors.orange,
        name = "rpm"
      },
      lua = {
        icon = "",
        color = colors.blue,
        name = "lua"
      },
      sh = {
        icon = "",
        color = colors.green,
        name = "sh"
      },
      md = {
        icon = "",
        color = colors.green,
        name = 'md'
      },
      markdown = {
        icon = "",
        color = colors.green,
        name = 'markdown'
      },
      mdx = {
        icon = "",
        color = colors.green,
        name = 'mdx'
      },
      [".gitignore"] = {
        icon = "",
        color = colors.orange,
        name = "gitignore"
      },
      json = {
        icon = "ﬥ",
        color = colors.yellow,
        name = "json"
      }
    }
  }
end

return M