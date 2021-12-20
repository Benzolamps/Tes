local util = worldGlobals.CreateUtil()

--- player stuck forever
--- @param detector table
local function PlayerStuck(detector)
  RunHandled(
    WaitForever,
    OnEvery(Event(detector.Activated)),
    function()
      detector:Recharge()
      util.ResetMessage()
    end
  )
end

--- player stuck temporarily
--- @param detector table
local function PlayerStuckTemp(detector)
  RunHandled(
    util.WaitTerminal,
    OnEvery(Event(detector.Activated)),
    function()
      detector:Recharge()
      util.ResetMessage()
    end
  )
end

--- item stuck
--- @param detector table
local function ItemStuck(detector)
  RunHandled(
    util.WaitTerminal,
    OnEvery(Delay(0.1)),
    function()
      if util.IsTimeSwitchActive() then return end
      if not util.ExistEntityInArea("CCarriableItemEntity", detector) then return end
      util.ResetMessage()
    end
  )
end

--- plasma closed, no jammer, player stuck
--- @param entities table
local function PlasmaStuck(entities)
  if not entities then return end

  local detector, plasma

  for _, entity in ipairs(entities) do
    if entity:GetClassName() == "CDetectorAreaEntity" then
      detector = entity
    else
      plasma = entity
      RunAsync(function ()
        RunHandled(
          WaitForever,
          OnEvery(Event(detector.Activated)),
          function()
            detector:Recharge()
            if plasma:IsOpen() then return end
            if util.IsTimeSwitchPlaying() then return end
            if util.ExistEntityInArea("CJammerItemEntity", detector) then return end
            util.ResetMessage()
          end
        )
      end)
    end
  end
end

--- run detectors
--- @param detectors table
--- @param func function
local function RunDetectors(detectors, func)
  if detectors then
    if not (#detectors > 0) then detectors = {detectors} end
    for _, detector in ipairs(detectors) do
      RunAsync(function() func(detector) end)
    end
  end
end

RunDetectors(detectors1, PlayerStuck)
RunDetectors(detectors2, PlayerStuckTemp)
RunDetectors(detectors3, ItemStuck)
PlasmaStuck(entities)
