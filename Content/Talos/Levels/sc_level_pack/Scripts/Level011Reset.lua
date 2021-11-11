local base = worldGlobals.CreateInstance(worldInfo)

RunHandled(
  base.WaitTerminal,
  OnEvery(Delay(0.1)),
  function ()
    if plasma:IsOpen() then return end
    if 1 ~= base.EntityCountInArea("CCarriableItemEntity", detector) then return end
    if base.ExistEntityInArea("CCarriableFanItemEntity", detector) then return end
    base.ResetMessage()
  end,
  OnEvery(Delay(0.1)),
  function ()
    if plasma:IsOpen() then return end
    local itemCount = base.EntityCountInArea("CCarriableItemEntity", detector)
    local fanCount = base.EntityCountInArea("CCarriableFanItemEntity", detector)
    if fanCount >= itemCount then return end
    if base.IsPlayerInArea(detector) then return end
    Wait(Delay(1))
    base.ResetMessage()
  end
)
