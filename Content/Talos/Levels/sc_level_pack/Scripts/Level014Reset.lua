local base = worldGlobals.CreateInstance(worldInfo)

RunHandled(
  base.WaitTerminal,
  OnEvery(Delay(0.1)),
  function ()
    if base.EntityCountInArea("CCarriableRodItemEntity", detector) <= 0 then
      base.ResetMessage()
    end
  end
)
