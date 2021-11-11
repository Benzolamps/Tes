local base = worldGlobals.CreateInstance(worldInfo)

-- player stuck forever
local function PlayerStuck(detector)
  RunHandled(
    WaitForever,
    OnEvery(Event(detector.Activated)),
    function()
      detector:Recharge()
      base.ResetMessage()
    end
  )
end

-- player stuck temporal
local function PlayerStuckTemp(detector)
  RunHandled(
    base.WaitTerminal,
    OnEvery(Event(detector.Activated)),
    function()
      detector:Recharge()
      base.ResetMessage()
    end
  )
end

-- item stuck
local function ItemStuck(detector)
  RunHandled(
    base.WaitTerminal,
    OnEvery(Delay(0.1)),
    function()
      if base.IsTimeSwitchActive() then return end
      if not base.ExistEntityInArea("CCarriableItemEntity", detector) then return end
      base.ResetMessage()
    end
  )
end

-- plasma stuck
local function PlasmaStuck(entities)
  if not entities then return end
  for i = 1, #entities, 2 do
    local detector = entities[i]
    local plasma = entities[i + 1]
    RunAsync(function ()
      RunHandled(
        base.WaitTerminal,
        OnEvery(Event(detector.Activated)),
        function()
          detector:Recharge()
          if plasma:IsOpen() then return end
          if base.IsTimeSwitchPlaying() then return end
          if base.ExistEntityInArea("CJammerItemEntity", detector) then return end
          base.ResetMessage()
        end
      )
    end)
  end
end

-- run detectors
local function RunDetectors(detectors, func)
  if detectors then
    if not (#detectors > 0) then detectors = {detectors} end
    for i = 1, #detectors do
      RunAsync(function() func(detectors[i]) end)
    end
  end
end

RunDetectors(detectors1, PlayerStuck)
RunDetectors(detectors2, PlayerStuckTemp)
RunDetectors(detectors3, ItemStuck)
PlasmaStuck(entities)
