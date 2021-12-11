SIGSTRM12GIS             �Ă                  Signkey.EditorSignaturelv���/�*A�$8��Ӯ>{�����i�Oy�����+����9�mR?�n���r�R�8� �#>*�����$a���s���^���p�6��xu����F�dk-d���mA,�褘��?���]��S`��T5��Q :�V~:n��i|*�G��-s��m~��Ɛhf�)U��e@�P$-rjFw��8B߿�<�m�(�=�G|�T��M3zM�C�j�χ�+�n�r�*O��T]}B⨚��6^���﻿ local util = worldGlobals.CreateUtil()

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
  for i = 1, #entities, 2 do
    local detector = entities[i]
    local plasma = entities[i + 1]
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

--- item fall below killer
--- @param killer table
local function ItemFallStuck(killer)
  if not killer then return end
  RunAsync(function ()
    RunHandled(
      util.WaitTerminal,
      OnEvery(Delay(0.1)),
      function()
        if util.IsTimeSwitchActive() then return end
        local all = worldInfo:GetAllEntitiesOfClass("CCarriableItemEntity")
        for _, entity in ipairs(all) do
          local p = entity:GetActualPlacement()
          if p.vy < killer:GetPlacement().vy then
            util.ResetMessage()
            return
          end
        end
      end
    )
  end)
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
ItemFallStuck(killer)
|)���M��p�6d�+e�q�|�4+E"���!���S��&�8E���ƥ�3{�V�}��`�,O�!����4D�5,xHP�,q#�H��/%�p��3��F�듵n4��A�/Dvil����f�V�Yq������Wi�N�2����l�@�O�=��`:K)���:�0z9��h�,�8�P�'���c����ن��>�$��}z ���^Xt��(_�������G��#iL����Ҿ�H�de��͋�