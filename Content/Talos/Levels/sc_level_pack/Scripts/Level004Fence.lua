while true do
  Wait(Delay(0.1))
  if red:IsChargedUp() and blue:IsChargedUp() then
    fence:Open()
    break
  end
end
