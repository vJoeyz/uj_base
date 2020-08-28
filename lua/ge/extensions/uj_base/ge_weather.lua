--[[
Created by vJoeyz#5115 (Uncle Joey)
Please do not redistribute
]]--

local M = {}

local envObjectIdCache = {}
local config

local function getObject(className, preferredObjName)
    if envObjectIdCache[className] then
        return scenetree.findObjectById(envObjectIdCache[className])
    end
  
    envObjectIdCache[className] = 0
    local objNames = scenetree.findClassObjects(className)
    if objNames and tableSize(objNames) > 0 then
        for _,name in pairs(objNames) do
            local obj = scenetree.findObject(name)
            if obj and (name == preferredObjName or not preferredObjName) then
                envObjectIdCache[className] = obj:getID()
                return obj
            end
        end
    end

    return nil
end

local function setPrecipitation(rainDrops) -- rain function has typo in core ng code
    local rainObj = getObject("Precipitation", "rain_coverage") or getObject("Precipitation")
    if rainObj and rainDrops then
        rainObj.numDrops = rainDrops
        
        if config.weathersync.rainIsSnow then
            rainObj.dataBlock = scenetree.findObject("Snow_menu")
        end
    end
end

local function setInitialWeather()
    if config.weathersync.enabled then
        local cloudCover = (config.weathersync.cloudCover / 100) * 2.5
        core_environment.setCloudCover(cloudCover)

        local fogDensity = config.weathersync.fogDensity / 10000
        core_environment.setFogDensity(fogDensity)

        local rainDrops = config.weathersync.rainDrops * 10
        setPrecipitation(rainDrops)

        core_environment.setWindSpeed(config.weathersync.windSpeed)

        core_environment.setGravity(config.weathersync.gravity)
    end
end

local function onExtensionLoaded()
    config = rerequire("settings/config")
    setInitialWeather()
end

M.onExtensionLoaded = onExtensionLoaded

return M