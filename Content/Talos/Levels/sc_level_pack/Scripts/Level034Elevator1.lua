RunHandled(
  WaitForever,
  OnEvery(Event(fakeFan.Activated)),
  function()
    elevator:MoveToDestinationEntity(markerEnd)
  end,
  OnEvery(Event(fakeFan.Deactivated)),
  function()
    elevator:MoveToDestinationEntity(markerStart)
  end
)
