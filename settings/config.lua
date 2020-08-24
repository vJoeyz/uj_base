--[[
Created by vJoeyz#5115 (Uncle Joey)
Please do not redistribute
]]--

local config = {}
config.reset = {}
config.motd = {}
config.timesync = {}
config.weathersync = {}

config.messageDuration = 6000 -- global toast message duration in ms

config.restrictMenu = true -- enables or disables (side-)menu for mods, spawning vehicles, tuning, environment, trackbuilder and replay

config.restrictActions = true -- enables or disables restricting actions globally (see below)
config.disabledActions = {
    "switch_next_vehicle", -- switches focus to next vehicle
    "switch_previous_vehicle", -- switches focus to previous vehicle
    "loadHome", -- moves the vehicle to its home position
    "saveHome", -- stores current vehicle position for quick access
    "recover_vehicle", -- rewinds vehicle position
    "reload_vehicle", -- reloads vehicle files from disk
    "reload_all_vehicles", -- reloads all vehicles files from disk
    "vehicle_selector", -- opens the vehicle selection screen
    "parts_selector", -- opens the vehicle configuration screen
    "nodegrabberRender", -- displays nodes that can be grabbed
    "slower_motion", -- slows down time
    "faster_motion", -- speeds up time
    "toggle_slow_motion", -- slows time down or resets if back to real time
    "dropPlayerAtCamera", -- puts the player at the camera
}

config.reset.enabled = true -- enables or disables the ability to reset vehicles
config.reset.timeout = 30 -- how often a vehicle can be reset, -1 for no limit
config.reset.title = "Vehicle Reset Limiter" -- title shown when resetting is limited or disabled
config.reset.message = "You can reset your vehicle in {secondsLeft} seconds." -- message shown when resetting is limited
config.reset.disabledMessage = "Vehicle resetting is disabled on this server." -- message shown when resetting is completely disabled

config.motd.enabled = true -- enables or disables the motd
config.motd.type = "selectableVehicle" -- htmlOnly: simple (large) bbcode-only motd || selectableVehicle: motd with the ability to select a vehicle
config.motd.title = "Welcome to a BeamMP server!"
config.motd.description = [[
    [img]uj_base/welcome.gif[/img]
    [br]
    [h2]Introduction[/h2]
    This is a sample motd provided to you by [i]Uncle Joey's Base[/i]. Uncle Joey's Base provides some essential client-side addons for your BeamMP server. This motd supports BBCode. [color=#FF69B4]Awesome[/color] isn't it?
    [h2]Rules[/h2]
    [list]
        [*]Be respectful
        [*]Don't spam cars
    [/list]
    [MEDIA=youtube]3PlBukazpo0[/media]
    [br]
    Expect many more futures to be added to Uncle Joey's Base in the future!
    [br][br]
    [color=#FFC0CB][i][right]made with ❤️ by vJoeyz#5115[/right][/i][/color]
]] -- all bbcodes can be found in README.md

config.timesync.enabled = true -- enables or disables in-game time syncing to real world time
config.timesync.offsetHours = 0 -- 0 for utc, can be positive (+) or negative (-)
config.timesync.realtime = true -- whether in-game time should be actively synced with real world time (only works when timesync.enabled = true)

-- NOTE: not all weather settings work on all maps
config.weathersync.enabled = true -- enables or disables in-game weather syncing
config.weathersync.cloudCover = 30 -- 0-100 (0 = no clouds; 100 = very cloudy)
config.weathersync.windSpeed = 1 -- 0-10 (0 = no wind; 10 = very windy)
config.weathersync.rainDrops = 20 -- 0-100 (0 = no rain; 100 = very rainy)
config.weathersync.fogDensity = 0 -- 0-100 (0 = no fog; 100 = very foggy)

return config