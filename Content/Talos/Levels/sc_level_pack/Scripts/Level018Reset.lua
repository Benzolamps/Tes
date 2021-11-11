local base = worldGlobals.CreateInstance(worldInfo)

RunHandled(
  base.WaitTerminal,
  OnEvery(Event(detector.Activated)),
  function ()
    detector:Recharge()
    if not base.ExistEntityInArea("CCarriableFanItemEntity", detector) then
      base.ResetMessage()
    end
  end
)
