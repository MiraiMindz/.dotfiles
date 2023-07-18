local uiPlugins = require("mirai.pluginsImports.uiPlugins")
local functionalPlugins = require("mirai.pluginsImports.functionalPlugins")
local lspPlugins = require("mirai.pluginsImports.lspPlugins")
local languagePlugins = require("mirai.pluginsImports.languagePlugins")
local otherPlugins = require("mirai.pluginsImports.otherPlugins")

--[[

I'm using this inner-loops implementation because the vim.tbl_deep_extend func
doesn't work as expected, thus, the editor finishes loading before the merging
and I don't see a HUGE delay on the startup time, around 235.417ms (< 0.3 sec)
While some could argue that this isn't really fast, I have sereval plugins
That doesn't do too much but improve a little my development, so they add up.

--]]
local pluginsSize = #uiPlugins + #functionalPlugins + #lspPlugins + #languagePlugins + #otherPlugins
local plugins = {}
for i = 1, pluginsSize do
    plugins[i] = nil
end
local pluginsIndex = 1
for _, tbl in ipairs({ uiPlugins, functionalPlugins, lspPlugins, languagePlugins, otherPlugins }) do
    for _, value in ipairs(tbl) do
        plugins[pluginsIndex] = value
        pluginsIndex = pluginsIndex + 1
    end
end

return plugins
