--[[
Created by vJoeyz#5115 (Uncle Joey)
Please do not redistribute
]]--

local M = {}

local config, vehicleSpawned

local function getSign(offset)
    if offset >= 0 then
        return "+"
    end
    return ""
end

local function enableMotd()
    if config.motd.enabled then
        local description = config.motd.description:gsub("{serverTime}", os.date("!%I:%M %p", os.time() + config.timesync.offsetHours * 60 * 60) .. " UTC" .. getSign(config.timesync.offsetHours) .. config.timesync.offsetHours)
        guihooks.trigger('ScenarioChange', {name = config.motd.title, description = description, introType = config.motd.type})
    end
end

local function onExtensionLoaded()
    config = require("settings/config")

    if config.motd.enabled then
        guihooks.trigger("ChangeState", {state = "scenario-start"})
    end

    if config.restrictMenu then
        extensions.core_gamestate.setGameState("scenario", "freeroam", "uj_base")
    end
end

local function onExtensionUnloaded()
    --extensions.core_gamestate.setGameState("freeroam", "freeroam", "freeroam") commenting this out fixes mp error 10038
end

local function spawnVehicle(model, options)
    local currentUserVehicle = be:getPlayerVehicle(0)
    if currentUserVehicle then
        core_vehicles.replaceVehicle(model, options)
    else
        core_vehicles.spawnNewVehicle(model, options)
    end
end

local function onScenarioUIReady(state)
    if state == "start" then
        enableMotd()
    elseif state == "play" then
        if not vehicleSpawned then
            spawnVehicle("pickup", {})
        end
    end
end

local function onVehicleSelected(vehicleData)
    if config.motd.type == "selectableVehicle" then
        --enableMotd()
        if vehicleData.model and vehicleData.config then
            local userSpawningData = createPlayerSpawningData(vehicleData.model, vehicleData.config, vehicleData.color, vehicleData.licenseText)
            spawnVehicle(userSpawningData.model, userSpawningData.options)
            vehicleSpawned = true
        end
    end
end

M.onExtensionLoaded = onExtensionLoaded
M.onExtensionUnloaded = onExtensionUnloaded
M.onVehicleSelected = onVehicleSelected
M.onScenarioUIReady = onScenarioUIReady

return M