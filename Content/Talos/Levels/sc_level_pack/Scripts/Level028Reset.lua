SIGSTRM12GIS             ��U�                  Signkey.EditorSignatureW@!�wG��(��,8���u���Ø�����E��
���C�b}[�4P�֍YR��>��͸q�m�00�5`���N�X�n�l�aO�̈́����ΕHq:^A$7��E���I@}����wO����� ����	1i�F$9�CX+��K�y��U��F!t����ra�=�v�ƆиQ`sp\�7%[���3��5�� ��=5��8��8?���y��:%��r�hH��&�Qߗ��#������f-sG0V��﻿local util = worldGlobals.CreateUtil()

local itemCount = util.EntityCountInArea("CCarriableItemEntity", detector2)

RunHandled(
  function()
    Wait(Event(detector3.Activated))
  end,
  OnEvery(Delay(0.1)),
  function()
    if util.IsTimeSwitchPlaying() then return end
    if not util.ExistEntityInArea("CJammerItemEntity", detector1) then
      util.ResetMessage()
    end
    if util.EntityCountInArea("CCarriableItemEntity", detector2) > itemCount then
      util.ResetMessage()
    end
  end
)
�N��˽�DM�m��J�Aw��ds�2D��i�(��=}eL����Ǩ�:�1V���cxCCzu⪰]��.��6�n�}�8cA��2�tì�9�ъY)�i���0%���\I��q��� ��M�Bc�x����a�4��Gƶ�]�pjiL��B-�--:y��E�h?����V�T�mAp�Mu_�b������Q�rˮ�
l��	��\N$%����+�D��H�w�{�`�ʉA�vO!��n�5���