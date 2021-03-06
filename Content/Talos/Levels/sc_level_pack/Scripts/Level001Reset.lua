local util = worldGlobals.CreateUtil()

RunHandled(
  function ()
    Wait(Any(CustomEvent("Level001CubeFall"), Event(mine.Died)))
    turret = nil
  end,
  OnEvery(Any(Events(detectors.Activated))),
  function ()
    detectors:Recharge()
    if not turret or turret:IsEnabled() then return end
    if not util.ExistEntityInArea("CJammerItemEntity", detectorJammer) then
      util.ResetMessage()
    end
  end
)
