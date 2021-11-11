
local base = worldGlobals.CreateInstance(worldInfo)

RunHandled(
  WaitForever,
  OnEvery(Event(detector.Activated)),
  function ()
    detector:Recharge()
    if not turret:IsEnabled() then return end
    if base:IsTimeSwitchPlaying() then return end
    base.ResetMessage()
  end
)
