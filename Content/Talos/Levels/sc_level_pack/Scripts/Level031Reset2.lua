SIGSTRM12GIS             �WG                  Signkey.EditorSignatureS:��a�g�� �kkE7� �WvU�=z�(sBcء�I��G~"�Yhs�0"��ι׫��=k�����˺�x��"�0�x�x�ž��tw��j�K"�Gq�QN�.R3�n�ۃy8,��T�C1��d`�����j+\��?g7mNhS�����;�{%�/����,^��g����Em����X�o�:Zyg���v�~H~�*�xv�X(��p7輵G�I��*,���|��Ӹ�j�pH��R���n�%wA﻿local util = worldGlobals.CreateUtil()

RunHandled(
  function ()
    Wait(Event(fakeFan.Activated))
  end,
  OnEvery(Event(detector.Activated)),
  function ()
    detector:Recharge()
    if util.IsTimeSwitchPlaying() then return end
    local itemCount = util.EntityCountInArea("CCarriableItemEntity", detector)
    local fanCount = util.EntityCountInArea("CCarriableFanItemEntity", detector)
    if itemCount > 1 and fanCount > 0 then return end
    util.ResetMessage()
  end
)
�卺6C�0�v6���S+L����ҮR����E��mR>7�w�"�;���x��s]sԒ>g��rl�ϧ�v��Si�x&ߣƖ��
�\�2rX�l�c�3|�?�
yk3Įs�e0��)�y�����mc��&%i�E�+n$?�>�p#K.+|~�yL�,ܻ_�@�k��tW��X7}Y�'j�(p�u=�;�Z�1��]ykV�������8&ć�M��k�f�=PR7&�Η��%��r�W�x��\aux��[�N