local util = worldGlobals.CreateUtil()

RunHandled(
  util.WaitTerminal,
  OnEvery(Delay(0.1)),
  function ()
    if red:IsChargedUp() then return end
    if util.IsTimeSwitchActive() then return end
    local itemCount = util.EntityCountInArea("CCarriableItemEntity", entityDetector)
    local jammerCount = util.EntityCountInArea("CJammerItemEntity", entityDetector)
    if itemCount == jammerCount then return end
    if detectors[1]:IsActivated() or detectors[2]:IsActivated() then
      detectors[1]:Recharge()
      detectors[2]:Recharge()
      return
    end
    util.ResetMessage()
  end
)
