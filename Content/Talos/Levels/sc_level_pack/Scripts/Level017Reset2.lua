local base = worldGlobals.CreateInstance(worldInfo)

BreakableRunHandled(
  base.WaitTerminal,
  On(Delay(0.1)),
  function ()
    base.WaitUntil(function ()
      local itemCount = base.EntityCountInArea("CCarriableItemEntity", entityDetector)
      local jammerCount = base.EntityCountInArea("CJammerItemEntity", entityDetector)
      return itemCount > jammerCount
    end)
    base.WaitWhile(base.IsTimeSwitchPlaying)
    while true do
      Wait(Delay(0.1))
      if not red:IsChargedUp() and not playerDetector:IsActivated() then
        base.ResetMessage()
      end
    end
  end
)
