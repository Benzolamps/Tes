RunHandled(
  WaitForever,
  OnEvery(Event(receiver.ChargedUp)),
  function()
    for i, elevator in ipairs(elevators) do
      elevator:MoveToDestinationEntity(markersEnd[i])
    end
  end,
  OnEvery(Event(receiver.Reset)),
  function()
     for i, elevator in ipairs(elevators) do
      elevator:MoveToDestinationEntity(markersStart[i])
     end
  end
)