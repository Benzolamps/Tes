local util = worldGlobals.CreateUtil()

RunHandled(
  function ()
    Wait(Event(fakeFan.Activated))
  end,
  OnEvery(Event(detector.Activated)),
  function ()
    detector:Recharge()
    if util.IsTimeSwitchPlaying() then return end
    local itemCount = util.EntityCountInArea("CCarriableItemEntity", detector)
    local fanCount = util.EntityCountInArea("CCarriableFanItemEntity", detector)
    if itemCount > 1 and fanCount > 0 then return end
    util.ResetMessage()
  end
)
