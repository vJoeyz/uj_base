--[[
Created by vJoeyz#5115 (Uncle Joey)
Please do not redistribute
]]--

local M = {}

local config

local function disableActions()
    if config.restrictActions then
        extensions.core_input_actionFilter.setGroup('uj_base', config.disabledActions)
        extensions.core_input_actionFilter.addAction(0, 'uj_base', true)
    end
end

local function onExtensionLoaded()
    config = require("settings/config")
    disableActions()
end

local function onExtensionUnloaded()
    extensions.core_input_actionFilter.addAction(0, 'uj_base', false)
end

M.onExtensionLoaded = onExtensionLoaded
M.onExtensionUnloaded = onExtensionUnloaded

return M