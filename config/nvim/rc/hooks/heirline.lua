local StatusLine = require("rc/heirline/statusline.lua")
local WinBar = require("rc/heirline/winbar.lua")
local TabLine = require("rc/heirline/tabline.lua")
local StatusColumn = require("rc/heirline/statuscolumn.lua")

require("heirline").setup({
    statusline = StatusLine,
    winbar = WinBar,
    tabline = TabLine,
    statuscolumn = StatusColumn,
    -- opts = {...} -- other config parameters, see below
})
