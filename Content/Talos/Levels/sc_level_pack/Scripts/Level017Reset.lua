local base = worldGlobals.CreateInstance(worldInfo)

RunHandled(
  base.WaitTerminal,
  OnEvery(Delay(0.1)),
  function ()
    if not pressure:IsPressed() then return end
    if base.IsTimeSwitchActive() then return end
    base.ResetMessage()
  end
)
