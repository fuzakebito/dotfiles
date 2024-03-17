local colors = {
  bg = '#202020',
  black = '#282828',
  red = '#ef3f5f',
  green = '#62b283',
  yellow = '#d19a61',
  blue ='#759ee2',
  magenta = '#ad88ce',
  cyan = '#2db3bb',
  white = '#d7d7d7',
}

return {
  normal = {
    a = {bg = colors.magenta, fg = colors.black, gui = 'bold'},
    b = {bg = colors.white, fg = colors.black},
    c = {bg = colors.black, fg = colors.white}
  },
  insert = {
    a = {bg = colors.cyan, fg = colors.black, gui = 'bold'},
    b = {bg = colors.white, fg = colors.black},
    c = {bg = colors.black, fg = colors.white}
  },
  visual = {
    a = {bg = colors.red, fg = colors.black, gui = 'bold'},
    b = {bg = colors.white, fg = colors.black},
    c = {bg = colors.black, fg = colors.white}
  },
  replace = {
    a = {bg = colors.yellow, fg = colors.black, gui = 'bold'},
    b = {bg = colors.white, fg = colors.black},
    c = {bg = colors.black, fg = colors.white}
  },
  command = {
    a = {bg = colors.green, fg = colors.black, gui = 'bold'},
    b = {bg = colors.white, fg = colors.black},
    c = {bg = colors.black, fg = colors.white}
  },
  terminal = {
    a = {bg = colors.cyan, fg = colors.black, gui = 'bold'},
    b = {bg = colors.white, fg = colors.black},
    c = {bg = colors.black, fg = colors.white}
  },
  inactive = {
    a = {bg = colors.black, fg = colors.grey},
    b = {bg = colors.black, fg = colors.grey},
    c = {bg = colors.black, fg = colors.grey}
  }
}
