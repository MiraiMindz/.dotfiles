--[[
    This file contains utility functions
--]]

local M = {}

-- Adds the command string boilerplate
function M.cmdstr(inputString)
    return "<CMD>" .. inputString .. "<CR>"
end

return M

