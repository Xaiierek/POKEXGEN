function postostring(pos)
  return pos.x .. " " .. pos.y .. " " .. pos.z
end

function dirtostring(dir)
  for k,v in pairs(Directions) do
    if v == dir then
      return k
    end
  end
end


function getVocation(vocation)
  if not vocation then
    print("Vocation ID is nil")
    return "none"
  end
  print("Vocation ID: " .. vocation)
  local vocationName

  if vocation == 0 then
    vocationName = "hunter"
  elseif vocation == 2 then
    vocationName = "catcher"
  elseif vocation == 3 then
    vocationName = "healer"
  elseif vocation == 4 then
    vocationName = "blocker"
  elseif vocation == 5 then
    vocationName = "explorer"
  else
    vocationName = "none"
  end

  print("Vocation Name: " .. vocationName)
  return vocationName
end
 