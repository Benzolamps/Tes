SIGSTRM12GIS             �sI$                  Signkey.EditorSignature�"�j����,<ۨ~�XU�Q\#�H}�wf^�j8R����C�.g��bR���WA���ʟ��2m_/T�=��;���x{9#{�+�����h�D�3��2�B����\ؤWݷy��j���Ll#����H韅߅o~��	ECy��zn�-c�Y�=F9�� �.��gµm(<��W��e��7Ɖ�@t��Tq��m�dW��s��=�	80>>[qSZ�p�|��o\��zh��M�i�T�vd�L<﻿local util = worldGlobals.CreateUtil()

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
��Rmc����ocF���i�Ӊ��i��^5c��%~���q�**���2���og�ٮ]�z� �2���$�:yw���/]�H�K3cl[�cX��'-�ݩ�Su��f�
����x���>P�)��y,�dhS�&}0� ��I���f�J����� �m!�W��J�Y:Tj�2�db��Z�g�����co�K
�חA#?��������*�����wB_z�@�O�v�����`ԍb�3ډ�B�