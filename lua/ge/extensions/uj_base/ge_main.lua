--[[
Created by vJoeyz#5115 (Uncle Joey)
Please do not redistribute
]]--

local M = {}

local resource

local function onExtensionLoaded()
    resource = jsonReadFile("settings/resource.json")
    log("I", resource.name,  "version " .. resource.version .. " loaded")
end

local function onExtensionUnloaded()
    log("I", resource.name,  "version " .. resource.version .. " unloaded, goodbye!")
    Lua:requestReload()
end

M.onExtensionLoaded = onExtensionLoaded
M.onExtensionUnloaded = onExtensionUnloaded

return M