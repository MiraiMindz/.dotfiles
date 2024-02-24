-- This file contains all of my utility functions

local M = {}

-- Adds the command string boilerplate
function M.cmdstr(inputString)
	return "<CMD>" .. inputString .. "<CR>"
end

-- Adds the luacommand string boilerplate
function M.luacmdstr(inputString)
	return "<CMD>lua " .. inputString .. "<CR>"
end

return M
