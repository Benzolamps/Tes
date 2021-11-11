local base = worldGlobals.CreateInstance(worldInfo)

RunHandled(
  base.WaitTerminal,
  OnEvery(Event(detector1.Activated)),
  function ()
    detector1:Recharge()
    if plasma:IsOpen() then return end
    if base.ExistEntityInArea("CJammerItemEntity", detector1) then return end
    if base.ExistEntityInArea("CJammerItemEntity", detector2) then return end
    base.ResetMessage()
  end
)
