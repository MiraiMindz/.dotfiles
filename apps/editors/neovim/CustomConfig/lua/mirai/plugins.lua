-- print("#02 PLUGINS MODULE LOADED /lua/mirai/plugins.lua")

local IMPORTS_PATH = "mirai.imports."
local uiPlugins = require(IMPORTS_PATH .. "interface")
local functionalPlugins = require(IMPORTS_PATH .. "functional")
local lspPlugins = require(IMPORTS_PATH .. "lsp")
local languagePlugins = require(IMPORTS_PATH .. "languages")
local otherPlugins = require(IMPORTS_PATH .. "others")

local pluginsSize = #uiPlugins +
    #functionalPlugins +
    #lspPlugins +
    #languagePlugins +
    #otherPlugins

-- pre-allocation of the final table.
local plugins = {}
for i = 1, pluginsSize do
    plugins[i] = nil
end

-- In this function I create the final table by inserting all values into it.
local pluginsIndex = 1
for _, tbl in ipairs({ uiPlugins,
    functionalPlugins,
    lspPlugins,
    languagePlugins,
    otherPlugins }) do
    for _, value in ipairs(tbl) do
        plugins[pluginsIndex] = value
        pluginsIndex = pluginsIndex + 1
    end
end

return plugins
