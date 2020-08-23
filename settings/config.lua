--[[
Created by vJoeyz#5115 (Uncle Joey)
Please do not redistribute
]]--

local config = {}

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
    "reset_all_physics", -- restarts physics of all vehicles (reset)
    "reset_physics", -- restarts the current scenario
}

config.motd = {}
config.motd.type = "selectableVehicle" -- htmlOnly: simple (large) bbcode-only motd || selectableVehicle: motd with the ability to select a vehicle
config.motd.title = "Welcome to a BeamMP server!"
config.motd.description = [[
    [img]uj_base/welcome.gif[/img]
    [br]
    [h2]Introduction[/h2]
    This is a sample MOTD provided to you by [i]Uncle Joey's Base[/i]. Uncle Joey's Base provides some essential client-side addons for your BeamMP server. This MOTD supports BBCode. [color=#FF69B4]Awesome[/color] isn't it?
    [h2]Rules[/h2]
    [list]
        [*]Be respectful
        [*]Don't spam cars
    [/list]
    [MEDIA=youtube]3PlBukazpo0[/media]
    [br]
    Expect many more futures to be added to Uncle Joey's Base in the future!
    [br][br]
    [color=#FFC0CB][i][right]Made by vJoeyz#5115[/right][/i][/color]
]] -- all bbcodes can be found in the README

config.setTime = true -- enables or disables in-game time syncing to real world time
config.timeOffsetHours = 0 -- 0 for utc, can be positive (+) or negative (-)
config.syncTime = true -- whether in-game time should be actively synced with real world time (only works when settime = true)

return config