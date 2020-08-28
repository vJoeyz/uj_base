--[[
Created by vJoeyz#5115 (Uncle Joey)
Please do not redistribute
]]--

local M = {}

local config
local tickrate = 1 -- in seconds
local timeElapsed = 0

local function setTime(hours, minutes)
    local tod = core_environment.getTimeOfDay()
    tod.time = (math.abs((hours + minutes / 60) - 12) / 12) * 0.5
    core_environment.setTimeOfDay(tod)

    --print(tod.time)
end

local function syncTime(minutes)
    if config.timesync.realtime and config.timesync.enabled then
        local datetime = os.date("!*t", os.time() + (config.timesync.offsetHours * 60 + minutes) * 60)
        setTime(datetime.hour, datetime.min)
    end
end

local function setInitialTime()
    if config.timesync.enabled then
        local datetime = os.date("!*t", os.time() + config.timesync.offsetHours * 60 * 60)
        setTime(datetime.hour, datetime.min)
    end
end

local function onUpdate(dtReal, dtSim, dtRaw)
    timeElapsed = timeElapsed + dtReal

    if timeElapsed >= tickrate then
        syncTime(timeElapsed / 60)
    end
end

local function onExtensionLoaded()
    config = require("settings/config")
    setInitialTime()
end

M.onExtensionLoaded = onExtensionLoaded
M.onUpdate = onUpdate

return M