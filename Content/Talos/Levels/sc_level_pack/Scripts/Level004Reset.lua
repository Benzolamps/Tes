local util = worldGlobals.CreateUtil(worldInfo)

RunHandled(
  util.WaitTerminal,
  OnEvery(Delay(0.1)),
  function ()
    local distance = mthAbsF(mine:GetPlacement():GetVect().x - pressure:GetPlacement():GetVect().x)
    if plasma:IsOpen() and 5 > distance then
      util.ResetMessage()
    end
  end
)
