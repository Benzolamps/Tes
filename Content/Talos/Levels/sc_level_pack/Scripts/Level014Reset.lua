local util = worldGlobals.CreateUtil()

RunHandled(
  util.WaitTerminal,
  OnEvery(Delay(0.1)),
  function ()
    if not util.ExistEntityInArea("CCarriableRodItemEntity", detector) then
      util.ResetMessage()
    end
  end
)
