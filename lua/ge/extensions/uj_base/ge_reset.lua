--[[
Created by vJoeyz#5115 (Uncle Joey)
Please do not redistribute
]]--

local M = {}

local timeElapsedReset = 0
local config, tryResetOld

local function tryReset(playerID)
    if not config.reset.enabled then
        guihooks.trigger('toastrMsg', {type="warning", title = config.reset.title, msg = config.reset.disabledMessage, config = {timeOut = config.messageDuration}})
        return
    end

    if timeElapsedReset >= config.reset.timeout or config.reset.timeout == -1 then
        timeElapsedReset = 0
        be:resetVehicle(playerID)
    else
        local message = config.reset.message:gsub("{secondsLeft}", math.floor(config.reset.timeout - timeElapsedReset))
        guihooks.trigger('toastrMsg', {type="warning", title = config.reset.title, msg = message, config = {timeOut = config.messageDuration}})
    end
end

local function replaceResetHook()
    tryResetOld = extensions.freeroam_freeroam.onResetGameplay
    extensions.freeroam_freeroam.onResetGameplay = tryReset
end

local function onExtensionLoaded()
    config = require("settings/config")
    replaceResetHook()
end

local function onExtensionUnloaded()
    extensions.freeroam_freeroam.onResetGameplay = tryResetOld
end

local function onUpdate(dtReal, dtSim, dtRaw)
    timeElapsedReset = timeElapsedReset + dtReal
end

M.onExtensionLoaded = onExtensionLoaded
M.onExtensionUnloaded = onExtensionUnloaded
M.onUpdate = onUpdate

return M