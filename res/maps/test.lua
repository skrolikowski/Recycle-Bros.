return {
  version = "1.2",
  luaversion = "5.1",
  tiledversion = "1.3.1",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 12,
  height = 12,
  tilewidth = 8,
  tileheight = 8,
  nextlayerid = 6,
  nextobjectid = 23,
  properties = {},
  tilesets = {
    {
      name = "Tileset",
      firstgid = 1,
      filename = "../tilesets/tileset.tsx",
      tilewidth = 8,
      tileheight = 8,
      spacing = 0,
      margin = 0,
      columns = 12,
      image = "../tilesets/tileset.png",
      imagewidth = 96,
      imageheight = 96,
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 8,
        height = 8
      },
      properties = {},
      terrains = {},
      tilecount = 144,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      id = 1,
      name = "Background",
      x = 0,
      y = 0,
      width = 12,
      height = 12,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      data = "CgAAAAsAAAALAAAACwAAAAsAAAALAAAACwAAAAsAAAALAAAACwAAAAsAAAAMAAAAFgAAABcAAAAXAAAAFwAAABcAAAAXAAAAFwAAABcAAAAXAAAAFwAAABcAAAAYAAAAFgAAABcAAAAXAAAAFwAAABcAAAAXAAAAFwAAABcAAAAXAAAAFwAAABcAAAAYAAAAFgAAABcAAAAXAAAAFwAAABcAAAAXAAAAFwAAABcAAAAXAAAAFwAAABcAAAAYAAAAFgAAABcAAAAXAAAAFwAAABcAAAAXAAAAFwAAABcAAAAXAAAAFwAAABcAAAAYAAAAFgAAABcAAAAXAAAAFwAAABcAAAAXAAAAFwAAABcAAAAXAAAAFwAAABcAAAAYAAAAFgAAABcAAAAXAAAAFwAAABcAAAAXAAAAFwAAABcAAAAXAAAAFwAAABcAAAAYAAAAFgAAABcAAAAXAAAAFwAAABcAAAAXAAAAFwAAABcAAAAXAAAAFwAAABcAAAAYAAAAFgAAABcAAAAXAAAAFwAAABcAAAAXAAAAFwAAABcAAAAXAAAAFwAAABcAAAAYAAAALgAAAC8AAAAvAAAALwAAAC8AAAAvAAAALwAAAC8AAAAvAAAALwAAAC8AAAAwAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    },
    {
      type = "tilelayer",
      id = 3,
      name = "Entities",
      x = 0,
      y = 0,
      width = 12,
      height = 12,
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "base64",
      data = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADgAAAA4AAAAPAAAAAAAAAA0AAAAOAAAADgAAAA8AAAAAAAAADQAAAA4AAAAOAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADgAAAA4AAAAPAAAAAAAAAA0AAAAOAAAADgAAAA8AAAAAAAAADQAAAA4AAAAOAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADgAAAA4AAAAPAAAAAAAAAA0AAAAOAAAADgAAAA8AAAAAAAAADQAAAA4AAAAOAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAADgAAAA4AAAAPAAAAAAAAAA0AAAAOAAAADgAAAA8AAAAAAAAADQAAAA4AAAAOAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
    },
    {
      type = "objectgroup",
      id = 4,
      name = "Spawn",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 2,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 8,
          width = 8,
          height = 8,
          rotation = 0,
          visible = true,
          properties = {
            ["dx"] = 1
          }
        }
      }
    },
    {
      type = "objectgroup",
      id = 5,
      name = "Belt",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      draworder = "topdown",
      properties = {},
      objects = {
        {
          id = 7,
          name = "",
          type = "",
          shape = "rectangle",
          x = 0,
          y = 16,
          width = 24,
          height = 8,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 20,
          name = "",
          type = "",
          shape = "rectangle",
          x = 32,
          y = 16,
          width = 32,
          height = 8,
          rotation = 0,
          visible = true,
          properties = {}
        },
        {
          id = 21,
          name = "",
          type = "",
          shape = "rectangle",
          x = 72,
          y = 16,
          width = 24,
          height = 8,
          rotation = 0,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
