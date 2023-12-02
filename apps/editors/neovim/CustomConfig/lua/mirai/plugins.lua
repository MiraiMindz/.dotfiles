--[[
    Here is where I load all of my plugins. They are splitted between sections
    So if you don't want a entire collection of plugins, you can simply remove
    the require statement for it.

    Sorry if the identation is a little messy, the auto-formatter has done it.
--]]

local uiPlugins = require("mirai.PluginsImports.UI")
--local functionalPlugins = require("mirai.PluginsImports.Functional")
local lspPlugins = require("mirai.PluginsImports.LSP")
--local languagePlugins = require("mirai.PluginsImports.Languages")
--local otherPlugins = require("mirai.PluginsImports.Others")

--[[
    I'm using this inner-loops implementation because the vim.tbl_deep_extend
    func doesn't work as expected, thus, the editor finishes loading before
    the merging is completed.

    I don't see a HUGE delay on the startup time, around NEED MEASUREMENT
    While some could argue that this isn't really fast, I have sereval plugins
    They don't do too much but improve a little my development, so they add up.

    For instance, you could completely disable the UI plugins to save some time.
--]]
--local pluginsSize = #uiPlugins + -- Here I calculate the raw size of all
--    #functionalPlugins +         -- tables to speedup the performance by
--    #lspPlugins +                -- pre-allocating the size of the final
--    #languagePlugins +           -- table.
--    #otherPlugins

local pluginsSize = #lspPlugins + #uiPlugins

-- pre-allocation of the final table.
local plugins = {}
for i = 1, pluginsSize do
    plugins[i] = nil
end

-- In this function I create the final table by inserting all values into it.
local pluginsIndex = 1
for _, tbl in ipairs({ 
    uiPlugins,
    --functionalPlugins,
    lspPlugins,
    --languagePlugins,
    --otherPlugins 
    }) do
    for _, value in ipairs(tbl) do
        plugins[pluginsIndex] = value
        pluginsIndex = pluginsIndex + 1
    end
end

return plugins
