SIGSTRM12GIS             �bA�                  Signkey.EditorSignatureE�k�{_�,�5������)�u����+��: c��2��<��LC�O����Bj�=�Ӽe���ȕ5M:߹�c��!P�M�V�3��G$���.a�N��&����:2�W�B
�VITߍ��S٘l��T�i�N��v'��/�7,��[*�T�I�8�}���.n�:Fye4k.d�X2�3'9V���M9�
D��T��*��E~7�~B�锟j���r�S�$௷Zp��9u	j�p���A�\-h5�3�﻿ worldInfo:ActivateTimer(0)

local util = worldGlobals.CreateUtil(worldInfo)

-- talosProgress : CTalosProgress
local talosProgress = nexGetTalosProgress(worldInfo)

if (terminal:GetName() == "TerminalEnd") then
  -- create temporal chapter, prevent not saving the level
  local curr = worldInfo:GetCurrentChapter()
  local temp = SpawnEntityByClass(worldInfo, curr:GetPlacement(), "CChapterInfoEntity")
  temp:Start()
  Wait(Delay(0.1))
  curr:Start()
  terminal:EnableASCIIAnimation(true)
end

local finished = false

RunHandled(
  WaitForever,
  OnEvery(Event(terminal.Started)),
  function ()
    if terminal:GetName() == "TerminalEnd" and not finished then
      finished = true
      terminal:EnableASCIIAnimation(false)

      -- calculate the time
      local time = worldInfo:GetTimePassedFromTimer()
      local str = "Congratulations! "
      -- judge if it is new record
      if util.currentLevel.GetLevelTime() <= 0 or time < util.currentLevel.GetLevelTime() then
        util.currentLevel.SetLevelTime(time)
        str = str .. "You have a new record."
      end
      str = str .. "\nTime:%w2 " .. util.currentLevel.GetLevelTime() .. " s%w3\n"
      terminal:AddString(str)
      talosProgress:SetVar("Level" .. util.currentLevel.levelIndex .. "_READ")
    end
  end,

  -- loading the level
  On(CustomEvent(terminal, "TerminalEvent_0")),
  function ()
    local level = util.levels[talosProgress:GetCodeValue("Level")]
    terminal:AddString("Opening " .. level.levelFile .. ".%w1.%w1.%w1 %w9Done.%w30.")
    Wait(Delay(2))
    worldInfo:StartLevel(level.levelFile)
  end,

  -- level record
  OnEvery(CustomEvent(terminal, "TerminalEvent_1")),
  function ()
    local str = "";
    str = str .. util.currentLevel.levelTitle .. "\n"
    str = str .. "Level File: " .. util.currentLevel.levelFile .. "\n"
    if util.currentLevel.GetLevelTime() > 0 then
      str = str .. "Level Best Time: " .. util.currentLevel.GetLevelTime() .. " s\n"
    else
      str = str .. "Level Best Time: Infinity\n"
    end
    terminal:AddString(str .. "<span class=\"strong\">>>></span> ")
  end,

  -- close the fences and barriers
  On(Event(terminal.Stopped)),
  function ()
    if terminal:GetName() == "TerminalEnd" then
      if fences then
        fences:Open()
      end
      if barriers then
        barriers:Disable()
      end
    end
  end
)
f8p�i	�a��e�	�����2�-�����i�ۇ>�sN���X������ć[����D^�MU�T<8@��0#C�l���M���䵀��7Z�Y-���Ҳ��&<��T1)����dF��ݼq���݉LC�;T�p��t��`wX�J���� �?��w�*�	�ǩb���|j}���o?C�]�д���b:�|@��+�g~ �:+W�"[X�[mKճ1�����Ƈ� �yΫ��W��