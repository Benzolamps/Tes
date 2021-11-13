SIGSTRM12GIS             J{�'                  Signkey.EditorSignatureL^�\P���Q��
.eƣ%�u�l.oUI�Q�U�O/g~�e����䊰��'��G"�x�ڑF�G{��]/�����^5�`_�)�n��u[�IzE�׼�d��}C�(Ns� &�l��5N΁�Lm��V�C�"�?��:�m�ʉ�)��m�v�@bD�W�P��q��:�SkK���/iiu^�����]i�o6��Y�L�]��~a��g'�o����rx����)������"��Qd`��N���p�X﻿local base = worldGlobals.CreateInstance(worldInfo)

-- player stuck forever
local function PlayerStuck(detector)
  RunHandled(
    WaitForever,
    OnEvery(Event(detector.Activated)),
    function()
      detector:Recharge()
      base.ResetMessage()
    end
  )
end

-- player stuck temporal
local function PlayerStuckTemp(detector)
  RunHandled(
    base.WaitTerminal,
    OnEvery(Event(detector.Activated)),
    function()
      detector:Recharge()
      base.ResetMessage()
    end
  )
end

-- item stuck
local function ItemStuck(detector)
  RunHandled(
    base.WaitTerminal,
    OnEvery(Delay(0.1)),
    function()
      if base.IsTimeSwitchActive() then return end
      if not base.ExistEntityInArea("CCarriableItemEntity", detector) then return end
      base.ResetMessage()
    end
  )
end

-- plasma stuck
local function PlasmaStuck(entities)
  if not entities then return end
  for i = 1, #entities, 2 do
    local detector = entities[i]
    local plasma = entities[i + 1]
    RunAsync(function ()
      RunHandled(
        base.WaitTerminal,
        OnEvery(Event(detector.Activated)),
        function()
          detector:Recharge()
          if plasma:IsOpen() then return end
          if base.IsTimeSwitchPlaying() then return end
          if base.ExistEntityInArea("CJammerItemEntity", detector) then return end
          base.ResetMessage()
        end
      )
    end)
  end
end

-- run detectors
local function RunDetectors(detectors, func)
  if detectors then
    if not (#detectors > 0) then detectors = {detectors} end
    for i = 1, #detectors do
      RunAsync(function() func(detectors[i]) end)
    end
  end
end

RunDetectors(detectors1, PlayerStuck)
RunDetectors(detectors2, PlayerStuckTemp)
RunDetectors(detectors3, ItemStuck)
PlasmaStuck(entities)
h�Ͳ5l��Yo�����=k��tmY���P��`D�ۧ���.��f���5d�ս�M�:`�G<UlH�2`wH��/��Ɨ��\A�4��,M��C���\v�$�Rp�n�J^��/@�EO[Q�qR"nPnK�1K2]T����_,z��N�C��7.т����N�r7���A�r�X;�c�	�<����wf�YB��̹gS���~��\��p8�^�_�-$��n�qAU
gy�0�