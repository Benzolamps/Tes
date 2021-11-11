local base = worldGlobals.CreateInstance(worldInfo)

RunHandled(
  base.WaitTerminal,
  OnEvery(Event(detector.Activated)),
  function ()
    detector:Recharge()
    if receiver:IsChargedUp() then return end
    if receiver:IsCharging() then return end
    base.ResetMessage()
  end
)
