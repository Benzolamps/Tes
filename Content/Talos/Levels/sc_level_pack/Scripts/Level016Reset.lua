local base = worldGlobals.CreateInstance(worldInfo)

RunHandled(
  base.WaitTerminal,
  OnEvery(Event(detector.Activated)),
  function()
    detector:Recharge()
    if plasma:IsOpen() then return end
    if fan:IsActive() then return end
    if base.ExistEntityInArea("CCarriableRodItemEntity", detector) then return end
    base.ResetMessage()
  end
)
