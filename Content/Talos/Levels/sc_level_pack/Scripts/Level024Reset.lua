SIGSTRM12GIS             kq�x                  Signkey.EditorSignaturev�TՆh 0|[}��>��89�-gj���@�H��*���H%r�e�:uIKX'7�c�5#�IK�9��Ș��t`Ϳ�8�	��LVz���)Х>H@�u���s���S/x��?#dT�ke���U�����
��ڃ$H��(w��j}��D���>~���ͥ�%�*#���O�^���Ħ�=Ѥ+X+�G{`[k�r��4�i�Q��1��X+� {W�lH��$��>:�J)	�B�y﻿local util = worldGlobals.CreateUtil()

RunHandled(
  util.WaitTerminal,
  OnEvery(Event(detector.Activated)),
  function ()
    detector:Recharge()
    if util.IsTimeSwitchPlaying() then return end
    if util.ExistEntityInArea("CCarriableFanItemEntity", detector) then return end
    util.ResetMessage()
  end
)
9�n���k�ČN:g�H&Vu[���3զ ��B+p2Ϫ����,"}UO`�ʫ�?��Jv�����JQ��E1�Z�� �r��3C�z�Y���=��ѣ�y��t�0��l5�=���jb����Z�G�z}�]QT��s��?%���U���p^	'���HK���j���1*������s��)�E���Ų�ҕ5j�a7�s�:������J[�����|mx�ӋQ<�f�;�r%ݤ#���