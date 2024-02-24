--[[ This is my custom neovim configuration, version 2024.01, see below.
I really like to modularize my config so you will see a bunch of files, I'll
try to document all of them so you (and future me) can understanding what's
happenning on it. I'll not explain lua code, if you want to dive deep into lua
I recommend the `:help lua-guide` neovim's built-in guide about lua.

That's being said, let's go. (follow the requires to get into places) - Mirai.
--]]

-- NeoVIm ONLY supports LUA 5.1, so the constant modifier doesn't work.
-- local MAIN_MODULE <const> = "mirai"
local MAIN_MODULE = "mirai"

require(MAIN_MODULE)
