local mt = getrawmetatable(game)
local old = mt.__namecall

setreadonly(mt, false)

mt.__namecall = newcclosure(function(self, ...)
  local args = {...}
local method = getnamecallmethod()
 
  if method == "Kick" then
      return
   end

  return old(self, ...)
end)
setreadonly(mt, true)
game:GetService("Players").LocalPlayer.PlayerScripts.LocalScript2:Destroy()
game:GetService("Players").LocalPlayer.PlayerScripts.LocalScript:Destroy()
