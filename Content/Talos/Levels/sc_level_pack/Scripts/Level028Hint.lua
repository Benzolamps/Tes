SIGSTRM12GIS             ;:	&                  Signkey.EditorSignature
S����d�Ꮰ�S�P2rj�;�Q52�oQ)lDQ����N���b)�^%�	��qi[�G�v�}��x����I��r��P1�H����y2�r�p.��Y�㶉6�z�؇s��&�b�-��rv�y8��t�>�ۋg6�W��L����4?����`L� �,�sg��$������\���>7�-Y�(Z��|g5;$�CK�e��Kɒ����_��없M�?�5��))E�.����".:�%>﻿local util = worldGlobals.CreateUtil()

RunHandled(
  util.WaitTerminal,
  OnEvery(Event(detectorTrigger.Activated)),
  function()
    detectorTrigger:Recharge()
    if not util.IsTimeSwitchRecording() then return end
    if mthAbsF(mine:GetLinearVelocity().z) >= 0.01 then return end
    if not util.ExistEntityInArea("CJammerItemEntity", detectorJammer) then return end
    if not util.ExistEntityInArea("CCarriableFanItemEntity", detectorFan) then return end
    util.player:ShowTutorialMessage("TTRS:ScLevelPack.SplitHint=Don't forget to press the pressure plate!", 2, 2)
  end
)
0p��6�T\���V���Fs��"9 p���Ú �V��"�#3��h=�� 1 3y�=M�{�F.R\������AdNR��E���P�'���\!���XɃ؉�]���ɖx+x˦���$gI$�ɚF�x�nG#�^�c=���q�҅f^�cgO�4��Ӹ��\�$�1�p��m��UGm#I���T��:	�V�	�y�s���=$H�9z��_Ļ-H���ҍ�wӬ� z+�4�&|� 7�E���\�ۇ��