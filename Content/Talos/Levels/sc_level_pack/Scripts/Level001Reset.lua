local base = worldGlobals.CreateInstance(worldInfo)

RunHandled(
  function ()
    Wait(Event(mine.Died))
  end,
  OnEvery(Any(Event(detector1.Activated), Event(detector2.Activated))),
  function ()
    detector1:Recharge()
    detector2:Recharge()
    if not base.ExistEntityInArea("CJammerItemEntity", detector3) then
      base.ResetMessage()
    end
  end
)
