local util = worldGlobals.CreateUtil(worldInfo)

-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)

local function GetStage()
  return talosProgress:GetCodeValue("Code_TS_Stage")
end

local function SetStage(stage)
  if corIsAppEditor() then
    print('stage: ' .. stage)
  end
  return talosProgress:SetCode("Code_TS_Stage", stage)
end

local function GetCode()
  return talosProgress:GetCodeValue("Code_TS_Code")
end

local function SetCode(code)
  talosProgress:SetCode("Code_TS_CodePrefix", code / 10000)
  talosProgress:SetCode("Code_TS_CodeSuffix", code % 1000)
  if corIsAppEditor() then
    print('code: ' .. code)
  end
  return talosProgress:SetCode("Code_TS_Code", code)
end

local function GetCodeRead()
  return talosProgress:GetCodeValue("Code_TS_CodeRead")
end

local function SetCodeRead(codeRead)
  if corIsAppEditor() then
    print('codeRead: ' .. codeRead)
  end
  talosProgress:SetCode("Code_TS_CodeRead", codeRead)
end

local function SetRecording(recording)
  if corIsAppEditor() then
    print('recording: ' .. tostring(recording))
  end
  if recording then
    talosProgress:SetVar("Code_TS_Recording")
  else
    talosProgress:ClearVar("Code_TS_Recording")
  end
end

local cacheCode = 0
SetStage(1)
SetCode(mthRndRangeL(100000, 999999))
SetCodeRead(0)
SetRecording(false)

RunHandled(
  function()
    Wait(All(Events(doors.Unlocked)))
  end,
  OnEvery(CustomEvent("TimeSwitchRecordingStarted")),
  function()
    cacheCode = GetCode()
    SetRecording(true)
  end,
  OnEvery(CustomEvent("TimeSwitchRecordingEnded")),
  function()
    SetRecording(false)
  end,
  OnEvery(CustomEvent("TimeSwitchRecordingAborted")),
  function()
    cacheCode = 0
  end,
  OnEvery(CustomEvent("TimeSwitchPlayingStarted")),
  function()
    SetCode(cacheCode)
    if GetCodeRead() == 2 then
      SetCodeRead(1)
    end
  end,
  OnEvery(CustomEvent(terminal, "TerminalEvent_6")),
  function()
    if (GetStage() == 1) then
      SetCodeRead(1)
    else
      SetCode(mthRndRangeL(100000, 999999))
      if (util.IsTimeSwitchRecording()) then
        SetCodeRead(2)
      else
        SetCodeRead(0)
      end
    end
  end,
  OnEvery(CustomEvent(terminal, "TerminalEvent_7")),
  function()
    doors[GetStage()]:Open()
    SetStage(GetStage() + 1)
    cacheCode = 0
    SetCodeRead(0)
    SetCode(mthRndRangeL(100000, 999999))
  end
)
