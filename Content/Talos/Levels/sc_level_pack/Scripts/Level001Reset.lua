local util = worldGlobals.CreateUtil(worldInfo)

RunHandled(
  function ()
    Wait(Event(mine.Died))
  end,
  OnEvery(Any(Events(detectors.Activated))),
  function ()
    detectors:Recharge()
    if not util.ExistEntityInArea("CJammerItemEntity", detectorJammer) then
      util.ResetMessage()
    end
  end
)
