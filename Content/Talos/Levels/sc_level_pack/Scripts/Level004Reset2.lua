local base = worldGlobals.CreateInstance(worldInfo)

RunHandled(
  base.WaitTerminal,
  OnEvery(Event(detectorTop.Activated)),
  function ()
    detectorOuter:Recharge()
    detectorInner:Recharge()
    BreakableRunHandled(
      base.WaitTerminal,
      On(Event(detectorOuter.Activated)),
      function ()
        detectorTop:Recharge()
        while not detectorTop:IsActivated() do
          Wait(Delay(0.1))
          local itemCount = base.EntityCountInArea("CCarriableItemEntity", detectorTop)
          local jammerCount = base.EntityCountInArea("CJammerItemEntity", detectorTop)
          if itemCount > jammerCount then
            base.ResetMessage()
          end
        end
      end,
      On(Event(detectorInner.Activated)),
      function ()
        detectorTop:Recharge()
        while not detectorTop:IsActivated() do
          Wait(Delay(0.1))
          if not base.ExistEntityInArea("CJammerItemEntity", detectorInner) and not plasma:IsOpen() then
            base.ResetMessage()
          end
        end
      end
    )
  end
)
