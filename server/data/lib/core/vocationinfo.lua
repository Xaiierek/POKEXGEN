function onRecvbyte(player, opcode, buffer)
    if opcode == 197 then
        local vocationName = player:getVocation():getName()
        player:sendExtendedOpcode(197, vocationName)
    end
    return true
end