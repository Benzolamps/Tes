SIGSTRM12GIS             :h��                  Signkey.EditorSignature�ЯF�Ĺ�={�R��D��B̆/?
aN7�-�Rh0o��[?nƙ� �t�ea	ە?�g:b��y#�&�p�����W��m��b��c{��qݓ۝z�|�3��S�T�W��"^1�V3�y�E�k$��xs��9���cm�o�j*�G�7�y��G��%!��u� Bm(�a���ǔ�Ի��  �X��i�]�kCWJQI����vl��x�R��K��Bu�b���[����n}���`;�y�;CA���#'�E�﻿ local util = worldGlobals.CreateUtil()

RunHandled(
  util.WaitTerminal,
  OnEvery(Delay(0.1)),
  function ()
    if red:IsChargedUp() then return end
    if util.IsTimeSwitchActive() then return end
    local itemCount = util.EntityCountInArea("CCarriableItemEntity", entityDetector)
    local jammerCount = util.EntityCountInArea("CJammerItemEntity", entityDetector)
    if itemCount == jammerCount then return end
    if detectors[1]:IsActivated() or detectors[2]:IsActivated() then
      detectors[1]:Recharge()
      detectors[2]:Recharge()
      return
    end
    util.ResetMessage()
  end
)
��iUC=���� �R�/�o����J'��e!��r�(3��Gm��3`O�O3xTz���GВ������\�5	h-�xMпF��F0 ���<3{��r�D	���ջ氱�/��{r`R�9��������x��op���a��W����)w^�D�� �������S�"���=� l��O����G�a��ef-)�-(K���A�����2�� ��	<U���K�Pߡ���rpw��6��t�mm��{^-��=�