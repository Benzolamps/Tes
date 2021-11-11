local base = worldGlobals.CreateInstance(worldInfo)

RunHandled(
  function ()
    Wait(Event(detector2.Activated))
  end,
  OnEvery(Delay(0.1)),
  function ()
    if base.IsTimeSwitchActive() then return end
    if not base.ExistEntityInArea("CCarriableItemEntity", detector1) then return end
    base.ResetMessage()
  end
)
