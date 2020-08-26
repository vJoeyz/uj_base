-- This Source Code Form is subject to the terms of the bCDDL, v. 1.1.
-- If a copy of the bCDDL was not distributed with this
-- file, You can obtain one at http://beamng.com/bCDDL-1.1.txt

local M = {}

M.torque = 0
M.gear = 0
M.rpm = 0
M.torqueTransmission = 0
M.brake = 0
M.throttle = 0
M.engineDisabled = false
M.fuelLeakRate = 0 -- L/sec
M.fuel = 100
M.fuelCapacity = 100
M.fuelUsage = 0
M.engineLoad = 0
M.shifterMode = 2 -- initial value needs to fit to the two modes below
M.shifterPosition = 0
M.wheelCount = 0
M.avgAV = 0
M.engineAV = 0

M.esc = {update = nop, updateGFX = nop, toggleESCMode = nop, getCarData = nop, escPulse = 0}

local proxyEngine = nil
local proxyGearbox = nil
local avToRPM = 9.549296596425384

local function updateProxy()
  proxyEngine = powertrain.getDevice("mainEngine")
  proxyGearbox = powertrain.getDevice("gearbox")

  M.torque = proxyEngine and proxyEngine.outputTorque1 or 0
  M.gear = proxyGearbox and proxyGearbox.gearIndex or 0
  M.rpm = proxyEngine and proxyEngine.outputAV1 * avToRPM or 0
  M.torqueTransmission = proxyGearbox and proxyGearbox.outputTorque1 or 0
  M.throttle = electrics.values.throttle or 0
  M.engineDisabled = proxyEngine and proxyEngine.isDisabled or false
  M.engineLoad = proxyEngine and proxyEngine.engineLoad or 0

  M.shifterMode = 2
  M.engineAV = proxyEngine and proxyEngine.outputAV1

  electrics.values.gear_M = proxyGearbox and proxyGearbox.gearIndex
end

local function setShifterMode(v)
-- shifterMode = 0 : realistic (manual)
-- shifterMode = 1 : realistic (manual autoclutch)
-- shifterMode = 2 : arcade
-- shifterMode = 3 : realistic (automatic)

  local mode = "realistic"
  if v == 2 then
    mode = "arcade"
  end
  controller.mainController.setGearboxMode(mode)
end

local function shiftToGear(gear)
  controller.mainController.shiftToGearIndex(gear)
end

local function init()
  M.wheels = wheels.wheels
  M.rpm = 0
  M.engineDisabled = false
  M.gear = 0
  M.torqueTransmission = 0
  M.engineLoad = 0

  -- <custom>
	--obj:queueGameEngineLua("extensions.addModulePath('lua/vehicle/extensions/uj_base')")
  --obj:queueGameEngineLua("extensions.loadModulesInDirectory('lua/vehicle/extensions/uj_base')")
  
  obj:queueGameEngineLua("extensions.addModulePath('lua/ge/extensions/uj_base')")
  obj:queueGameEngineLua("extensions.loadModulesInDirectory('lua/ge/extensions/uj_base')")
  -- </custom>
end

-- public interface
M.reset           = init
M.init            = init
M.updateGFX       = updateProxy
M.shiftToGear     = shiftToGear
M.setShifterMode  = setShifterMode

return M
