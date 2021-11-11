local base = worldGlobals.CreateInstance(worldInfo)

Wait(Event(base.GetTerminal().Stopped))
fan:Deactivate()
plasma:Deactivate()
